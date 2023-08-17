#include <ros/ros.h>
#include <geometry_msgs/Twist.h>

#include"mdwa_planning/threat_points.h"

class LocalPathPlanner
{
public:
    LocalPathPlanner()
    {
        // 初始化发布者和订阅者
        pub_cmd = nh_plan.advertise<geometry_msgs::Twist>("cmd_vel", 10);
        sub_air = nh_plan.subscribe("air_threat", 10, &LocalPathPlanner::threatPointCallback, this);
    }

    void threatPointCallback(const mdwa_planning::threat_points::ConstPtr& msg)
    {
        // 在这里执行DWA算法，计算最优车速和横摆角速度
        geometry_msgs::Twist cmd_vel;
        float optimal_speed =1.0;
        float optimal_yaw_rate = 0.5;
        cmd_vel.linear.x = optimal_speed; 
        cmd_vel.angular.z = optimal_yaw_rate; 

        // pub
        pub_cmd.publish(cmd_vel);
        ROS_INFO("cmd_vel : vx %.2f,  wz:  %0.2f", cmd_vel.linear.x , cmd_vel.angular.z);
    }

private:
    ros::NodeHandle nh_plan;
    ros::Publisher pub_cmd;
    ros::Subscriber sub_air;
};

int main(int argc, char** argv)
{
    ros::init(argc, argv, "local_path_planner");
    LocalPathPlanner local_path_planner;
    ros::Rate rate(50); // 设置发布频率为50Hz

    while (ros::ok())
    {
        ros::spinOnce();
        rate.sleep();
    }
    return 0;
}
