#include "mdwa_planning/dwa.h"
#include<math.h>
#include<stdlib.h>
#include <ros/ros.h>
using namespace std;


DWA::DWA()
{

}
DWA::DWA(mdwa_planning::Environment* env, PointF start, PointF destination)
{
    startPoint = start;
    destinationPoint = destination;
    environment = env;
    destinationState.x = destination.x;
    destinationState.y = destination.y;
    destinationState.yaw = 0;
    destinationState.speed = 0;
    destinationState.angular_speed = 0;
}
//路径规划
// void DWA::planning()
// {  
//     CarState currentState(startPoint.x, startPoint.y, -1, 0, 0);
//     vector<CarState> currentTrajectory;
//     while(1)
//     {
//         cout << "**********************************************" << endl;
//         vector<float> speed(2);     //v[0]为速度, v[1]角速度
//         speed = dwa_control(currentState);      
//         cout << "speed:" << speed[0] << ", " << speed[1] << endl;
//         currentTrajectory.clear();
//         aaa = false;
//         predict_trajectory(currentState, speed[0], speed[1], currentTrajectory);
//         aaa = false;
//         trajectory.push_back(currentTrajectory);
//         currentState = currentTrajectory.back();
//         //判断是否到达终点
//         if(pow(currentState.x - destinationState.x, 2) + pow(currentState.y - destinationState.y, 2) <= car.radius * car.radius+1)
//         {
//             cout << "Done" << endl;
//             break;
//         }
//         //cout << "currentState:(" << currentState.x << ", " << currentState.y << ", " << currentState.yaw * 180 / PI << ")" << currentState.speed << "  " << currentState.angular_speed << endl;
        
//     }
// }
//动态窗口法
vector<float> DWA::dwa_control(const CarState &carstate)
{
    vector<float> dw(4);     //dw[0]为最小速度，dw[1]为最大速度，dw[2]为最小角速度，dw[3]为最大角速度
    //计算动态窗口
    dw = calc_dw(carstate);
    // ROS_INFO("dw[0] :  %.2f,dw[1]: %0.2f", dw[0],dw[1]);
    //计算最佳（v, w）
    vector<float> v_w(2);
    v_w = calc_best_speed(carstate, dw);
    return v_w;
}
// 计算动态窗口
vector<float> DWA::calc_dw(const CarState &carstate)
{
    // 速度属性限制的动态窗口
    vector<float> dw_robot_state{car.min_speed, car.max_speed, car.min_angular_speed, car.max_angular_speed};
    // 模型限制的动态窗口
    vector<float> dw_robot_model(4);
    dw_robot_model[0] = carstate.speed - car.max_accel * car.dt;
    dw_robot_model[1] = carstate.speed + car.max_accel * car.dt;
    dw_robot_model[2] = carstate.angular_speed - car.max_angular_speed_rate * car.dt;
    dw_robot_model[3] = carstate.angular_speed + car.max_angular_speed_rate * car.dt;
    vector<float> dw{max(dw_robot_state[0], dw_robot_model[0]),
                     min(dw_robot_state[1], dw_robot_model[1]),
                     max(dw_robot_state[2], dw_robot_model[2]),
                     min(dw_robot_state[3], dw_robot_model[3])};
    return dw;
}
//在dw中计算最佳速度和角速度
vector<float> DWA::calc_best_speed(const CarState &carstate, const vector<float> &dw)
{
    vector<float> best_speed{0, 0};
    vector<CarState> trajectoryTmp;
    float min_cost = 10000;
    float final_cost;
    float direct_cost;
    float goal_cost;
    float dy_obstacle_cost;
    //float speed_cost = 0;
    float obstacle_cost = 0;
    vector<vector<float>>cost_set;
    float direct_cost_min=100,direct_cost_max=0;
    float goal_cost_min=100,goal_cost_max=0;
    float obstacle_cost_min=100,obstacle_cost_max=-10;
    float dy_obstacle_cost_min=100,dy_obstacle_cost_max=-10;
    for(float i = dw[0]; i < dw[1]; i += car.v_resolution)
    {
        for (float j = dw[2]; j < dw[3]; j += car.yaw_rate_resolution)
        {
            //预测轨迹
            if(i*3.0<=j || -i*3.0>=j) continue;
            trajectoryTmp.clear();
            predict_trajectory(carstate, i, j, trajectoryTmp);
            //计算代价
            direct_cost = calc_goal_cost(trajectoryTmp); //朝向代价
           // speed_cost = car.speed_cost_gain * (car.max_speed - trajectoryTmp.back().speed);
            goal_cost = sqrt(pow(destinationState.x - trajectoryTmp.back().x, 2) + pow(destinationState.y - trajectoryTmp.back().y, 2));//终点代价
            obstacle_cost = - calc_obstacle_cost(trajectoryTmp);
            dy_obstacle_cost =-calc_dy_obstacle_cost(carstate,i,j);
            // if(dy_obstacle_cost==0) continue;
            cost_set.push_back(vector<float>{direct_cost,goal_cost,obstacle_cost,dy_obstacle_cost,i,j});

            direct_cost_min=min(direct_cost_min,direct_cost),direct_cost_max=max(direct_cost_max,direct_cost);
            goal_cost_min=min(goal_cost_min,goal_cost),goal_cost_max=max(goal_cost_max,goal_cost);
            obstacle_cost_min=min(obstacle_cost_min,obstacle_cost),obstacle_cost_max=max(obstacle_cost_max,obstacle_cost);
            dy_obstacle_cost_min=min(dy_obstacle_cost_min,dy_obstacle_cost),dy_obstacle_cost_max=max(dy_obstacle_cost_max,dy_obstacle_cost);
        }
    }
    if(cost_set.size()==0)
    {
            best_speed[0] = 0;
            best_speed[1] = 0;
            return best_speed;
    }

    for(int i=0;i<cost_set.size();i++)
    {
        if(direct_cost_min!=direct_cost_max)
        {
             cost_set[i][0]=(cost_set[i][0]-direct_cost_min)/(direct_cost_max-direct_cost_min);
        }else cost_set[i][0]=0;

        if(goal_cost_min !=goal_cost_max)
        {
               cost_set[i][1]=(cost_set[i][1]-goal_cost_min)/(goal_cost_max-goal_cost_min);
        }else  cost_set[i][1]=1;

        if(obstacle_cost_min!=obstacle_cost_max)
        {
            cost_set[i][2]=(cost_set[i][2]-obstacle_cost_min)/(obstacle_cost_max-obstacle_cost_min);
        }else  cost_set[i][2] = 1;

        if(dy_obstacle_cost_min!=dy_obstacle_cost_max)
        {
            cost_set[i][3]=(cost_set[i][3]-dy_obstacle_cost_min)/(dy_obstacle_cost_max-dy_obstacle_cost_min);
        }else  cost_set[i][3] = 1;

       // final_cost = cost_set[i][0]+fmin(cost_set[i][1] , - cost_set[i][2]);
       final_cost =  car.goal_cost_gain*cost_set[i][1] +car.obstacle_cost_gain*cost_set[i][2] +car.dy_obstacle_cost_gain*cost_set[i][3] ;
    //    final_cost =  car.goal_cost_gain*cost_set[i][1] +car.obstacle_cost_gain*cost_set[i][2] +0*cost_set[i][3] ;
        if(final_cost <= min_cost)
         {
            min_cost = final_cost;
            best_speed[0] = cost_set[i][4];
            best_speed[1] = cost_set[i][5];

         }
    }
    //cout << "best_speed:" << best_speed[0] << ",   " << best_speed[1] << endl;
    return best_speed;
}
// 在一段时间内预测轨迹
void DWA::predict_trajectory(const CarState &carstate, const float &speed, const float &angular_speed, vector<CarState> &trajectory)
{
    float time = 0;
    CarState nextState = carstate;
    nextState.speed = speed;
    nextState.angular_speed = angular_speed;
    while(time < car.predict_time)
    {
        nextState = motion_model(nextState, speed, angular_speed);
        // if(aaa)
        //     cout << "nextState:(" << nextState.x << ", " << nextState.y << ", " << nextState.yaw * 180 / PI << ")" << nextState.speed << "  " << nextState.angular_speed << endl;
        trajectory.push_back(nextState);
        time += car.dt;
    }
}
//根据动力学模型计算下一时刻状态
CarState DWA::motion_model(const CarState &carstate, const float &speed, const float &angular_speed)
{
    CarState nextState;
    nextState.x = carstate.x + speed * car.dt * cos(carstate.yaw);
    nextState.y = carstate.y + speed * car.dt * sin(carstate.yaw);
    nextState.yaw = carstate.yaw + angular_speed * car.dt;
    nextState.speed = carstate.speed;
    nextState.angular_speed = carstate.angular_speed;
    return nextState;
}
//模拟里程计数据
CarState DWA::motion_model_Odom(const CarState &carstate, const float &speed, const float &angular_speed)
{
    CarState nextState;
    nextState.x = carstate.x + speed * 0.02* cos(carstate.yaw);
    nextState.y = carstate.y + speed *0.02* sin(carstate.yaw);
    nextState.yaw = carstate.yaw + angular_speed * 0.02;
    nextState.speed = carstate.speed;
    nextState.angular_speed = carstate.angular_speed;
    return nextState;
}
// 计算方位角代价
float DWA::calc_goal_cost(const vector<CarState> &trajectory)
{
    float error_yaw = atan2(destinationState.y - trajectory.back().y, destinationState.x - trajectory.back().x);
    float goal_cost = error_yaw - trajectory.back().yaw;
//    cout << "error_yaw :" << error_yaw << "    yaw:" << trajectory.back().yaw;
    goal_cost = atan2(sin(goal_cost), cos(goal_cost)); //limit value[-pi,pi]
//    cout << "    final:" << goal_cost << endl;
    return abs(goal_cost);
}
// 计算障碍代价
float DWA::calc_obstacle_cost(const vector<CarState> &trajectory)
{
    //float obstacle_cost;
    float distance=10;
    for (int i = 0; i < environment->barrier.size(); i ++) {
            distance = fmin(distance,sqrt(pow(environment->barrier[i].x - trajectory.back().x, 2) + pow(environment->barrier[i].y - trajectory.back().y, 2)));
            if(distance <= car.radius)
                return 0;
    }
    return distance;
}

//计算动态障碍物代价
float DWA::calc_dy_obstacle_cost(const CarState &carstate,float v,float wz)
{
    float dis_min=10;
    for(int i=0;i<environment->dy_obs.size();i++)
    {
    //动态障碍物运动状态
    float vx_obs =environment->dy_obs[i].vx;
    float vy_obs = environment->dy_obs[i].vy;
    //车辆当前状态
    float  theta = carstate.yaw;
    float x = carstate.x;
    float y =carstate.y;

    //合成速度矢量和对应的模
    vector<float> v_com{v*cos(theta)-vx_obs, v*sin(theta)-vy_obs}; 
    float v_com_abs = sqrt(v_com[1]*v_com[1]+v_com[2]*v_com[2]);
    float theta_com = atan2(v_com[2],v_com[1]);
    float dis_safety = v_com_abs*car.predict_time+0.3;
    //合成位置朝向矢量和对应的模
    vector<double>obs_ori{environment->dy_obs[i].x-x , environment->dy_obs[i].y-y};
    float obs_ori_abs = sqrt(obs_ori[1]*obs_ori[1]+obs_ori[2]*obs_ori[2]);

    float cos_theta = (v_com[1]*obs_ori[1]+ v_com[2]*obs_ori[2])/(v_com_abs*obs_ori_abs);
    if(cos_theta<=0.1 &&  obs_ori_abs>dis_safety)  continue;

    float time = 0.0;
    CarState cur_state(carstate.x,carstate.y,theta_com,v_com_abs,wz);
    while (time <= car.predict_time)
    {
        time=time+car.dt; //时间更新
        cur_state = motion_model(cur_state,v_com_abs,carstate.angular_speed);
        float dis_cur = sqrt((cur_state.x-environment->dy_obs[i].x)*(cur_state.x-environment->dy_obs[i].x)+
        (cur_state.y-environment->dy_obs[i].y)*(cur_state.y-environment->dy_obs[i].y));

        if(dis_cur<=(0.3+environment->obs_size))
            return  0 ;
        dis_min = min(dis_min,dis_cur);
    }
}
 return dis_min;
}
