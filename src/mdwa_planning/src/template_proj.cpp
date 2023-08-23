#include <iostream>
#include <string>
#include <sstream>
using namespace std;

#include "ros/ros.h"
#include "std_msgs/String.h"
#include"mdwa_planning/threat_points.h"

ros::Publisher chatter_pub;
ros::Subscriber sub_air ;
std_msgs::String pub_msg;

void callback(const mdwa_planning::threat_points::ConstPtr& msg) {
  // 在回调函数中处理订阅的消息
  // ...

  // 发布消息
  std_msgs::String pub_msg;
  pub_msg.data = "Hello, world!";
}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "talker");
  ros::NodeHandle n;
  chatter_pub = n.advertise<std_msgs::String>("template_pub", 1000);
  sub_air = n.subscribe("air_threat", 10, callback);
  ros::Rate loop_rate(10);
  int count = 0;
  while(ros::ok())
  {
    // std_msgs::String msg;
    // std::stringstream ss;
    // ss << "hello world " << count;
    // msg.data = ss.str();
    // ROS_INFO("%s", msg.data.c_str());
    // chatter_pub.publish(msg);
    chatter_pub.publish(pub_msg);
    ros::spinOnce();
    loop_rate.sleep();
   // count++;
  }
  return 0;
}