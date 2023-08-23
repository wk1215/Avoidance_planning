#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include<geometry_msgs/PointStamped.h>

#include"mdwa_planning/environment.h"
#include"mdwa_planning/threat_points.h"
#include"mdwa_planning/dwa.h"

mdwa_planning::threat_points    air_thread; //存储空中威胁


class LocalPathPlanner
{
public:
    LocalPathPlanner()
    {
        // init publisher and subscriber
        pub_cmd = nh_plan.advertise<geometry_msgs::Twist>("cmd_vel", 10);
        pub_point = nh_plan.advertise<geometry_msgs::PointStamped>("point", 1, true);
        sub_air = nh_plan.subscribe("air_threat", 10, &LocalPathPlanner::threatPointCallback, this);
         // init start and destination
        dwa=new DWA(&env, start, destination);
    }
    ~LocalPathPlanner()
    {
        delete dwa;
    }
    void set_start(double x,double y)
    {
        start = PointF(x,y);
    }

    void set_destination(double x,double y)
    {
        destination = PointF(x,y);
    }

    void threatPointCallback(const mdwa_planning::threat_points::ConstPtr& msg)
    {
        int n_size =msg->impact_points.size();
        for(int i=0;i<n_size;i++)
        {
            air_thread.impact_points.push_back(msg->impact_points[i]);
        }
        air_thread.impact_times=msg->impact_times;
    }

    void  planning()
    {
        CarState currentState(dwa->startPoint.x, dwa->startPoint.y, 0, 0, 0);
        vector<CarState> currentTrajectory;
        while(ros::ok)
        {
            //dwa algorithm
            vector<float> speed(2);     //v[0]为速度, v[1]角速度
            speed = dwa->dwa_control(currentState); 
            currentTrajectory.clear();
            dwa->aaa = false;
            dwa->predict_trajectory(currentState, speed[0], speed[1], currentTrajectory);
            dwa->aaa = false;
            dwa->trajectory.push_back(currentTrajectory);
            currentState = currentTrajectory.back();
            geometry_msgs::Twist cmd_vel;
            float optimal_speed;
            float optimal_yaw_rate ;
        //判断是否到达终点
            if(pow(currentState.x - dwa->destinationState.x, 2) + pow(currentState.y - dwa->destinationState.y, 2) <= dwa->car.radius * dwa->car.radius+1)
           {
                optimal_speed =0;
                optimal_yaw_rate = 0;
           }else
           {
               optimal_speed =speed[0];
               optimal_yaw_rate = speed[1];
           }
            // message  init
            cmd_vel.linear.x = optimal_speed; 
            cmd_vel.angular.z = optimal_yaw_rate; 

             // pub message
            pub_cmd.publish(cmd_vel);
            ROS_INFO("cmd_vel : vx %.2f,  wz:  %0.2f", cmd_vel.linear.x , cmd_vel.angular.z);

            geometry_msgs::PointStamped  this_point_stamped;
            this_point_stamped.point.x=currentState.x;
            this_point_stamped.point.y=currentState.y;
             this_point_stamped.point.z=0;

            pub_point.publish(this_point_stamped);
            // ROS_INFO("position : x %.2f,  y:  %0.2f", this_point_stamped.point.x , this_point_stamped.point.y);
            ros::spinOnce();
            loop_rate.sleep();
        }
    }

private:
    ros::NodeHandle nh_plan;
    ros::Publisher pub_cmd;
    ros::Publisher pub_point;
    ros::Subscriber sub_air;
    ros::Rate loop_rate{ros::Rate(50)};
    Environment  env;
    PointF start{20, 10};         //起点
    PointF destination{60,60};   // 终点
    DWA *dwa;

};

int main(int argc, char** argv)
{
    ros::init(argc, argv, "local_path_planner");
    LocalPathPlanner local_path_planner;
    local_path_planner.planning();
    return 0;
}
