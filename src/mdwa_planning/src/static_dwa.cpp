#include <cmath>
#include <iostream>
#include <vector>
#include"DWA.h"
#include <numeric>

#include "ros/ros.h"
#include "std_msgs/String.h"
using namespace std;

#define pi 3.1415926
double dt = 0.05;
double evalParam[4] = { 0.05,0.4,0.1,2.0 };

int main(int argc, char** argv)
{
  ros::init(argc, argv, "local_plan");
  ros::NodeHandle n;
  ros::Publisher chatter_pub = n.advertise<std_msgs::String>("cmd_vel", 1000);
  ros::Rate loop_rate(20);

  State state;
  state.yaw = pi /2;
  double goal[2] = { 5,5 };
  std::vector<OB> obs(2);
  obs[0].x = 0;
  obs[0].y = 2;
  obs[1].x = 4;
  obs[1].y = 2;
  double obstacleR = 0.5;
  KModel model;

  while(ros::ok())
  {
    std_msgs::String msg;
     int count=0;
     std::stringstream ss;
     DWAreturn dwareturn = DynamicWindowApproach(state, model, goal, evalParam, obs, obstacleR);
     UU u1 = dwareturn.u;
     ss << "UU" << " :"<<u1.vt<<","<<u1.ot;
     msg.data = ss.str();
     ROS_INFO("%s", msg.data.c_str());
     state = f(state, u1);
     chatter_pub.publish(msg);
     ros::spinOnce();
     loop_rate.sleep();
  }
  return 0;
}

int 1_main()
{
    State state;
    state.yaw = pi /2;
    double goal[2] = { 5,5 };
    std::vector<OB> obs(2);
    obs[0].x = 0;
    obs[0].y = 2;
    obs[1].x = 4;
    obs[1].y = 2;
    double obstacleR = 0.5;
    KModel model;
    std::vector<State> result;
    UU u1;
    double time=0;
    for (int iii = 0;iii < 5000;iii++)
    {
        DWAreturn dwareturn = DynamicWindowApproach(state, model, goal, evalParam, obs, obstacleR);
        u1 = dwareturn.u;
        state = f(state, u1);
        result.push_back(state);

        if (pow(state.x - goal[0], 2) + pow(state.y - goal[1], 2)< model.radius*model.radius+0.1)
        {
            break;
        }
        std::stringstream ss;
        ss << "第"<<iii<<"s到达的位置为" << "x = " << state.x << " y = " << state.y << endl;
    }
}

DWAreturn DynamicWindowApproach(State state, KModel model, double goal[2], double evalParam[4], std::vector<OB> &obs, double R)
{
    DWAreturn dwareturn;
     if (pow(state.x - goal[0], 2) + pow(state.y - goal[1], 2)< model.radius*model.radius+0.1)
        {
            break;
        }

    VR vr = CalcDynamicWindow(state, model);
    SumDB DB = Evaluation(state, vr, goal, obs, R, model, evalParam);
    if (DB.EvalDB.empty())
    {
        cout << "no path to goal!" << endl;
            dwareturn.u.vt = 0;
            dwareturn.u.ot= 0;
            return dwareturn;

    }
   NormalizeEval(DB.EvalDB);
   double result1;
    std::vector<double> feval;
    for (int id = 0; id < DB.EvalDB.size(); id++)
    {
        result1 = evalParam[0] * DB.EvalDB[id].heading + evalParam[1] * DB.EvalDB[id].dist + evalParam[2] * DB.EvalDB[id].vel;
        feval.push_back(result1);
    }
    int k = 0;
    for (int ii = 1;ii < feval.size();ii++)
    {
        if (feval[ii]>feval[ii-1])
        {
            k = ii;
        }
    }

    dwareturn.u.vt = DB.EvalDB[k].vt;
    dwareturn.u.ot = DB.EvalDB[k].ot;
    dwareturn.trajDB = DB.trajDB;
    return dwareturn;

}

SumDB Evaluation(State state, VR vr, double goal[2], std::vector<OB> &obs, double R, KModel model, double evalParam[4])
{
    SumDB DB;
    GTreturn GT;
    double heading, dist, vel, stopDist;
    EvalDB_cell evaldb;
    UU u;
    double  delta=toRadian(model.delta);
    double L=model.L;
    for (double vt = vr.min_v;vt < vr.max_v;vt = vt + model.MD_V_RESOLUTION)
    {
        for (double ot = vr.min_w;ot < vr.max_w;ot = ot + model.MD_W_RESOLUTION)
        {
            if(ot>2*vt*std::tan(delta)/L  || ot<-2*vt*std::tan(delta)/L ) continue;
            u.vt = vt;
            u.ot = ot;
            GT = GenerateTrajectory(state, u, evalParam[3], model);
         
            heading = CalcHeadingEval(GT.state, goal);
            dist = CalcDistEval(GT.state, obs, R);
            vel = abs(vt);
            stopDist = CalcBreakingDist(vel, model);

            if (dist > stopDist)
            {
                evaldb.vt = vt;
                evaldb.ot = ot;
                evaldb.heading = heading;
                evaldb.dist = dist;
                evaldb.vel = vel;
                DB.EvalDB.push_back(evaldb);
                
            }
        }
    }

    return DB;

}

void NormalizeEval(std::vector<EvalDB_cell> &EvalDB)
{
    int n = EvalDB.size();
    double sum1 = 0, sum2 = 0, sum3 = 0;
    int i;
 
    for (i = 0;i < n;i++) { sum1 = sum1 + EvalDB[i].heading; }
    for (i = 0;i < n;i++) { EvalDB[i].heading = EvalDB[i].heading / sum1; }

    for (i = 0;i < n;i++) { sum2 = sum2 + EvalDB[i].dist; }
    for (i = 0;i < n;i++) { EvalDB[i].dist = EvalDB[i].dist / sum2; }

    for (i = 0;i < n;i++) { sum3 = sum3 + EvalDB[i].vel; }
    for (i = 0;i < n;i++) { EvalDB[i].vel = EvalDB[i].vel / sum3; }

}

GTreturn GenerateTrajectory(State state, UU u, double evaldt, KModel model)
{
    GTreturn GT;
    double time = 0;
    GT.traj.push_back(state);
    while (time <= evaldt)
    {
        time = time + dt;
        state = f(state, u);
        GT.traj.push_back(state);
    }
    GT.state = state;
    return GT;
}

double CalcBreakingDist(double vel, KModel model)
{
    double stopDist = 0;
    stopDist=vel*vel/(2*model.MD_MU*9.8);
    return stopDist;
}

double CalcDistEval(State state, std::vector<OB>& obs, double R)
{
    //Define an upper distance limit
    double dist = 100;
    for (int io = 0;io < obs.size();io++)
    {
        double disttmp = sqrt(pow(obs[io].x - state.x, 2) + pow(obs[io].y - state.y, 2)) - R;
        if (dist > disttmp)
        {
            dist = disttmp;
        }

    }
    if (dist >= 2 * R)
    {
        dist = 2 * R;
    }
    return dist;
}
double CalcHeadingEval(State state, double goal[2])
{
    double theta = toDegree(state.yaw);
    double goalTheta = toDegree(atan2(goal[1] - state.y, goal[0] - state.x));
    double targetTheta;
    if (goalTheta > theta)
    {
        targetTheta = goalTheta - theta;
    }
    else
    {
        targetTheta = theta - goalTheta;
    }
    double heading = 90 - targetTheta;
    return heading;

}

VR CalcDynamicWindow(State state, KModel model)
{
    VR vr;
    vr.min_v = max(0, state.v - model.MD_ACC * dt);
    vr.max_v = min(model.MD_MAX_V, state.v + model.MD_ACC * dt);
    vr.min_w = max(-model.MD_MAX_W, state.w - model.MD_VW * dt);
    vr.max_w = min(model.MD_MAX_W, state.w + model.MD_VW * dt);

    return vr;

}

State f(State state, UU u)
{
    State state2;

    state2.x = state.x + u.vt * dt * cos(state.yaw);
    state2.y = state.y + u.vt * dt * sin(state.yaw);
    state2.yaw = state.yaw + dt * u.ot;
    state2.v = u.vt;
    state2.w = u.ot;

    return state2;
}

double toRadian(double degree)
{
    double radian = degree / 180 * pi;
    return radian;

}

double toDegree(double radian)
{

    double degree = radian / pi * 180;
    return degree;

}
double max(double a, double b)
{
    if (a < b) { a = b; };
    return a;

}
double min(double a, double b)
{
    if (a > b) { a=b; };
    return a;

}

