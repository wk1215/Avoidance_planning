#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
import numpy as np
import math
import matplotlib.pyplot as plt
from geometry_msgs.msg import PointStamped, Twist
from mdwa_planning.msg import Environment

pose_list = []
env_list = []
obstacle_point =np.array( [[2*0.6, 5*0.6],[5*0.6,3.5*0.6],[6*0.6,0.6],[6*0.6,4.5*0.6]])
goal_point = [8*0.6, 3*0.6]   
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

def env_callback(data):
  global env_list
  env_list =[]
  for  i in range(len(data.barrier)):
     barrier = [data.barrier[i].x,data.barrier[i].y]
     env_list.append(barrier)

  for j in range(len(data.dy_obs)):
     dy_barrier = [data.dy_obs[j].x,data.dy_obs[j].y]
     env_list.append(dy_barrier)


def plot_poses():
  global pose_list,env_list
  if len(pose_list) > 0  and len(env_list)>0: 
    plt.clf()
    plt.xlim(0, 6)  
    plt.ylim(0, 4)  
    plt.plot(np.array(pose_list)[:,0], np.array(pose_list)[:,1], '-',label='trajectory')
    # plt.scatter(np.array(obstacle_point)[0:4,0], np.array(obstacle_point)[0:4,1], c='red', marker='x',label='obstacle') 
    plt.scatter(np.array(env_list)[0:4,0], np.array(env_list)[0:4,1], c='red', marker='x',label='obstacle') 
    plt.scatter(np.array(env_list)[4:6,0], np.array(env_list)[4:6,1], c='red', marker='o',label='moving obstacle') 

    plt.scatter(goal_point[0], goal_point[1], c='yellow', marker='*',label='goal')  
    plt.xlabel("x/m")
    plt.ylabel("y/m")
    plt.legend()  
    plt.pause(0.001)
    plt.draw()

if __name__ == '__main__':
  rospy.init_node('plot_poses')
  
  pos_sub = rospy.Subscriber('/point', PointStamped, pose_callback)
  obs_sub = rospy.Subscriber('/env_pub',Environment,env_callback)
  # stat_sub = rospy.Subscriber('/cmd_vel',Twist, state_calback)
  rate = rospy.Rate(10)
  
  while not rospy.is_shutdown():
    # plot_poses()
    plot_poses( )
    rate.sleep( )
    
  plt.show()
