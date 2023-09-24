#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
import numpy as np
import math
import matplotlib.pyplot as plt
from geometry_msgs.msg import PointStamped, Twist

pose_list = []
wheel_speed_L = []
wheel_speed_R= []
fl_steering_angles = []
fr_steering_angles = []
rl_steering_angles = []
rr_steering_angles = []
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

def state_calback(data):
       global wheel_speed_L,wheel_speed_R,fl_steering_angles,fr_steering_angles,rl_steering_angles,rr_steering_angles
       vel = data.linear.x
       wz = data.angular.z
       
       R=vel/wz
      #  speed_L = (np.sqrt(R**2+0.04)-0.21)*vel
      #  speed_R =  (np.sqrt(R**2+0.04)+0.21)*vel
       speed_L =vel*(R-0.21)/R
       speed_R =  vel*(R+0.21)/R
       wheel_speed_L .append(speed_L)
       wheel_speed_R.append(speed_R)
       tan_delta =0.2/R
       fl_steer=math.atan(tan_delta/(1-1.05*tan_delta))
       fr_steer=math.atan(tan_delta/(1+1.05*tan_delta))
       rl_steer =-fl_steer
       rr_steer=-fr_steer
       fl_steering_angles.append(fl_steer)
       fr_steering_angles.append(fr_steer)
       rl_steering_angles.append(rl_steer)
       rr_steering_angles.append(rr_steer)

def plot_poses():
  global pose_list,wheel_speed_L,wheel_speed_R,fl_steering_angles,fr_steering_angles,rl_steering_angles,rr_steering_angles
  if len(pose_list) > 0 : 
    plt.clf()
    plt.xlim(0, 6)  
    plt.ylim(0, 4)  
    plt.plot(np.array(pose_list)[:,0], np.array(pose_list)[:,1], '-',label='trajectory')
    plt.scatter(obstacle_point[:,0], obstacle_point[:,1], c='red', marker='x',label='barrier') 
    plt.scatter(goal_point[0], goal_point[1], c='yellow', marker='o',label='goal')  
    plt.xlabel("x/m")
    plt.ylabel("y/m")
    plt.legend()  
    plt.pause(0.001)
    plt.draw()

def plot_stat1():
    global wheel_speed_L,wheel_speed_R,fl_steering_angles,fr_steering_angles,rl_steering_angles,rr_steering_angles
    if len(wheel_speed_L) > 0 and len(wheel_speed_R):
        m_len=min(len(wheel_speed_L),len(wheel_speed_R))
        time = [t * 0.02 for t in range(m_len)]
        plt.plot(time, wheel_speed_L[:m_len], label='wheel_speed_L')
        plt.plot(time, wheel_speed_R[:m_len], label='wheel_speed_R')
        plt.pause(0.001)
        plt.draw()

def smooth_data(data, window_size):
    return np.convolve(data, np.ones(window_size)/window_size, mode='valid')

def plot_stat():
    global wheel_speed_L,wheel_speed_R
    if len(wheel_speed_L) > 0 and len(wheel_speed_R):
        m_len=min(len(wheel_speed_L),len(wheel_speed_R))
        time = [t * 0.02 for t in range(m_len)]
        
        # 平滑数据
        window_size = 5  # 可以根据需要调整窗口大小
        smoothed_wheel_speed_L = smooth_data(wheel_speed_L[:m_len], window_size)
        smoothed_wheel_speed_R = smooth_data(wheel_speed_R[:m_len], window_size)

        # 因为平滑操作会减少数据的长度，所以我们需要调整时间
        sm_len=min(len(smoothed_wheel_speed_L),len(smoothed_wheel_speed_R))
        # smoothed_time = time[:sm_len]
        smoothed_time = [t * 0.02 for t in range(sm_len)]

        plt.plot(smoothed_time, smoothed_wheel_speed_L[:sm_len], label='wheel_speed_L', color='purple')
        plt.plot(smoothed_time, smoothed_wheel_speed_R[:sm_len], label='wheel_speed_R',color='brown')
        plt.xlabel("Time/s")
        plt.ylabel("wheel speed(m/s)") 
        plt.legend()
        plt.pause(0.001)
        plt.draw()

def plot_angle():
    global fl_steering_angles,fr_steering_angles,rl_steering_angles,rr_steering_angles
    if len(fl_steering_angles) > 0 and len(fr_steering_angles) and len(rl_steering_angles) and len(rr_steering_angles):
        m_len=min(len(wheel_speed_L),len(wheel_speed_R),len(rl_steering_angles),len(rr_steering_angles))
        time = [t * 0.02 for t in range(m_len)]
        
        # 平滑数据
        window_size = 5  # 可以根据需要调整窗口大小
        smoothed_wheel_speed_fl = smooth_data(fl_steering_angles[:m_len], window_size)
        smoothed_wheel_speed_fr = smooth_data(fr_steering_angles[:m_len], window_size)
        smoothed_wheel_speed_rl = smooth_data(rl_steering_angles[:m_len], window_size)
        smoothed_wheel_speed_rr = smooth_data(rr_steering_angles[:m_len], window_size)

        # 因为平滑操作会减少数据的长度，所以我们需要调整时间
        sm_len=min(len(smoothed_wheel_speed_fl),len(smoothed_wheel_speed_fr),len(smoothed_wheel_speed_rl),len(smoothed_wheel_speed_rr))
        # smoothed_time = time[:int(sm_len)]
        smoothed_time = [t * 0.02 for t in range(sm_len)]

        plt.plot(smoothed_time, smoothed_wheel_speed_fl[:sm_len]*180/math.pi, label='wheel_angle_fl', color='green')
        plt.plot(smoothed_time, smoothed_wheel_speed_fr[:sm_len]*180/math.pi, label='wheel_angle_fr', color='red')
        plt.plot(smoothed_time, smoothed_wheel_speed_rl[:sm_len]*180/math.pi, label='wheel_angle_rl', color='purple')
        plt.plot(smoothed_time, smoothed_wheel_speed_rr[:sm_len]*180/math.pi, label='wheel_angle_rr', color='brown')
        plt.legend()
        plt.xlabel("Time/s")
        plt.ylabel("wheel angle(deg)") 
        plt.pause(0.001)
        plt.draw()

if __name__ == '__main__':
  rospy.init_node('plot_poses')
  
  pos_sub = rospy.Subscriber('/point', PointStamped, pose_callback)
  stat_sub = rospy.Subscriber('/cmd_vel',Twist, state_calback)
  rate = rospy.Rate(10)
  
  while not rospy.is_shutdown():
    # plot_poses()
    plot_poses( )
    rate.sleep()
    
  plt.show()
