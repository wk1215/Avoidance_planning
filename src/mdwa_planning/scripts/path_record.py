#!/usr/bin/env python

import rospy
import numpy as np
import matplotlib.pyplot as plt
from geometry_msgs.msg import PointStamped

pose_list = []

def pose_callback(data):
  global pose_list
  pose = [data.point.x, data.point.y]
  pose_list.append(pose)

def plot_poses():
  global pose_list
  if len(pose_list) > 0: 
    plt.clf()
    plt.plot(np.array(pose_list)[:,0], np.array(pose_list)[:,1], '.')
    plt.pause(0.001)
    plt.draw()

if __name__ == '__main__':
  rospy.init_node('plot_poses')
  
  sub = rospy.Subscriber('/point', PointStamped, pose_callback)
  
  rate = rospy.Rate(100)
  
  while not rospy.is_shutdown():
    plot_poses()
    rate.sleep()
    
  plt.show()
