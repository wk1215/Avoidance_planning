#!/usr/bin/env python

import rospy
from nav_msgs.msg import Path
from geometry_msgs.msg import PoseStamped, Point
from std_msgs.msg import Header
import time

def trajectory_publisher():
    rospy.init_node('trajectory_publisher', anonymous=True)
    trajectory_pub = rospy.Publisher('trajectory_path', Path, queue_size=10)

    trajectory_msg = Path()

    trajectory_positions = [
        [0.0, 0.0, 0.0],
        [1.0, 0.0, 0.0],
        [2.0, 1.0, 0.0],
        [3.0, 2.0, 0.0],
        [4.0, 2.0, 0.0]
    ]

    trajectory_msg.header = Header()
    trajectory_msg.header.stamp = rospy.Time.now()
    trajectory_msg.header.frame_id = "base_link"

    rate = rospy.Rate(20)  

    while not rospy.is_shutdown():
        trajectory_msg.header.stamp = rospy.Time.now()

        for position in trajectory_positions:
            pose = PoseStamped()
            pose.pose.position = Point(x=position[0], y=position[1], z=position[2])
            pose.header = trajectory_msg.header
            trajectory_msg.poses.append(pose)

        trajectory_pub.publish(trajectory_msg)

        trajectory_msg.poses = []  

        rate.sleep()

if __name__ == '__main__':
    try:
        trajectory_publisher()
    except rospy.ROSInterruptException:
        pass

