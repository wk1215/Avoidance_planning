#include <ros/ros.h>
#include <iostream>
#include "mdwa_planning/environment.h"

#include "mdwa_planning/Barrier.h"
#include "mdwa_planning/Dy_Barrier.h"
#include "mdwa_planning/Environment.h"
using namespace std;

Environment::Environment()
{
    //barrier初始化
    barrier.push_back(PointF(20, 30));
    barrier.push_back(PointF(20, 35));
    barrier.push_back(PointF(25, 35));
    barrier.push_back(PointF(25, 30));
    barrier.push_back(PointF(27, 30));
    barrier.push_back(PointF(25, 25));
    barrier.push_back(PointF(22, 23));
    barrier.push_back(PointF(22, 23));
    barrier.push_back(PointF(25, 23));
}

Environment::Environment(int i)
{
    //不同的地图场景
    //1号地图，室内小场景
    if(i==1)
    {
            //static obstacle
            barrier.push_back(PointF(1.2, 3.6));
            barrier.push_back(PointF(3.0, 2.1));
            barrier.push_back(PointF(3.6, 0.6));
            barrier.push_back(PointF(3.6, 2.7));
           //dynamic obstacle
            dy_obs.push_back(dy_PointF(0.6,4.8,0.2,-0.3));
            dy_obs.push_back(dy_PointF(2.4,0,-0.08,0.25));
    }
}

//更新环境中动态障碍物的位置信息
void update_state(vector<dy_PointF> & dy_obs,int n)
{
    float dt =0.1;
    for(int i=0;i<n;i++)
    {
        dy_obs[i].x= dy_obs[i].x+dy_obs[i].vx*dt;
        dy_obs[i].y= dy_obs[i].y+dy_obs[i].vy*dt;
    }
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "env_publisher");
  ros::NodeHandle n;
  ros::Publisher pub = n.advertise<mdwa_planning::Environment>("env_pub", 1000);
  Environment env(1);

  ros::Rate loop_rate(10);

  mdwa_planning::Environment env_msg;
  //添加静态障碍物
  int  n_size = env.barrier.size();
  for(int i=0;i<n_size;i++)
  {
    mdwa_planning::Barrier b;
    b.x  = env.barrier[i].x;
    b.y = env.barrier[i].y;
    env_msg.barrier.push_back(b);
  }

  while (ros::ok())
  {
    //添加动态障碍物
  env_msg.dy_obs.clear();
  int  n = env.dy_obs.size();
  for(int i=0;i<n;i++)
  {
    mdwa_planning::Dy_Barrier  d;
      d.x = env.dy_obs[i].x;
      d.y = env.dy_obs[i].y;
      d.vx = env.dy_obs[i].x;
      d.vy = env.dy_obs[i].x;
      env_msg.dy_obs.push_back(d);
  }
  for(int i=0;i<n;i++)
  {
    ROS_INFO("obstacle %d :  %.2f, %.2f", i,env.dy_obs[i].x, env.dy_obs[i].y);
  }
  update_state(env.dy_obs,n);
 // 设置obs_size
  env_msg.obs_size = 0.1;
  // pub
  pub.publish(env_msg);
  ros::spinOnce();
  loop_rate.sleep();
  }
}

