#!/usr/bin/env python

import rospy
from sensor_msgs.msg import Imu

def rize(data):


    with open("X.txt", "a") as xx:
        xx.write(f"{data.angular_velocity.x} \n")

    with open("Y.txt", "a") as yy:
         yy.write(f"{data.angular_velocity.y} \n")

    with open("Z.txt", "a") as zz:
         zz.write(f"{data.angular_velocity.z} \n")  

def listener():

    rospy.init_node('listener', anonymous=True)
    rospy.Subscriber("imu/data_raw", Imu, rize) 
    rospy.spin() 

if __name__ == '__main__':
    listener()
