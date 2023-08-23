#include <ros/ros.h>
#include <geometry_msgs/Twist.h>

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
        while(ros::ok)
        {
            //dwa algorithm
        
            // message  init
            geometry_msgs::Twist cmd_vel;
            float optimal_speed =1.0;
            float optimal_yaw_rate = 0.5;
            cmd_vel.linear.x = optimal_speed; 
            cmd_vel.angular.z = optimal_yaw_rate; 

             // pub message
            pub_cmd.publish(cmd_vel);
            ROS_INFO("cmd_vel : vx %.2f,  wz:  %0.2f", cmd_vel.linear.x , cmd_vel.angular.z);
            ros::spinOnce();
            loop_rate.sleep();
        }
    }

private:
    ros::NodeHandle nh_plan;
    ros::Publisher pub_cmd;
    ros::Subscriber sub_air;
    ros::Rate loop_rate{ros::Rate(10)};
    Environment  env;
    PointF start{20, 10};         //起点
    PointF destination{60,60};   // 终点
    DWA *dwa;

};

int main(int argc, char** argv)
{
    ros::init(argc, argv, "local_path_planner");
    LocalPathPlanner local_path_planner;
    //ros::Rate rate(50); // 设置发布频率为50Hz
    local_path_planner.planning();
    return 0;
}
