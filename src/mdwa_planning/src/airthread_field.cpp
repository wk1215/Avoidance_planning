#include "ros/ros.h"

#include <geometry_msgs/Point.h>
#include <iostream>

#include"mdwa_planning/threat_points.h"

int main(int argc, char** argv)
{
  ros::init(argc, argv, "air_threat_node");
  ros::NodeHandle n;
  ros::Publisher chatter_pub = n.advertise<mdwa_planning::threat_points>("air_threat", 100);
  mdwa_planning::threat_points threat_msg;

  // init threat_point
  geometry_msgs::Point point1;
  point1.x = 10.0;
  point1.y = 2.0;
  point1.z = 1.5;
  threat_msg.impact_points.push_back(point1);

  geometry_msgs::Point point2;
  point2.x = 4.0;
  point2.y = 5.0;
  point2.z = 0.5;
  threat_msg.impact_points.push_back(point2);

  //init  impact_times 
  threat_msg.impact_times=1.5;
  ros::Rate rate(10);

  while (ros::ok()) {
    // pub  meaaage
    chatter_pub.publish(threat_msg);

    for (int i = 0; i < threat_msg.impact_points.size(); ++i)
    { 
        ROS_INFO("Point %d: x = %.2f, y = %.2f, z = %.2f", i+1, 
        threat_msg.impact_points[i].x, threat_msg.impact_points[i].y, threat_msg.impact_points[i].z);
    }
    ROS_INFO("Time : %.2f", threat_msg.impact_times);

    ros::spinOnce();

    rate.sleep();
  }
  return 0;
}

