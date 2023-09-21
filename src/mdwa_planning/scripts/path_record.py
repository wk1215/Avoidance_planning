#!/usr/bin/env python

import rospy
import numpy as np
import matplotlib.pyplot as plt
from geometry_msgs.msg import PointStamped, Twist

pose_list = []
obstacle_point =np.array( [[2*0.6, 5*0.6],[5*0.6,3.5*0.6],[6*0.6,0.6]])
goal_point = [9*0.6, 3*0.6]   
cur_pose = None
threshold = 0.1

def pose_callback(data):
  global pose_list,cur_pose
  pose = [data.point.x, data.point.y]

  if cur_pose is not None:
    distance =np.linalg.norm(np.array(pose)-np.array(cur_pose))
    if distance < threshold:
      return 
  pose_list.append(pose)
  cur_pose = pose

def plot_poses():
  global pose_list
  if len(pose_list) > 0 : 
    plt.clf()
    plt.xlim(0, 8)  
    plt.ylim(0, 4)  
    plt.plot(np.array(pose_list)[:,0], np.array(pose_list)[:,1], '.')
    plt.scatter(obstacle_point[:,0], obstacle_point[:,1], c='red', marker='x') 
    plt.scatter(goal_point[0], goal_point[1], c='yellow', marker='o')  
    plt.pause(0.001)
    plt.draw()

if __name__ == '__main__':
  rospy.init_node('plot_poses')
  
  pos_sub = rospy.Subscriber('/point', PointStamped, pose_callback)
  
  rate = rospy.Rate(10)
  
  while not rospy.is_shutdown():
    plot_poses()
    rate.sleep()
    
  plt.show()
