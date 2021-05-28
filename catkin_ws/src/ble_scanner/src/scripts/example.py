#!/usr/bin/env python

import rospy
import time
import threading

from MinIMU_v5_pi import MinIMU_v5_pi
from sensor_msgs.msg import Imu
from sensor_msgs.msg import MagneticField
from std_msgs.msg import String
#from geometry_msgs.msg import Vector3Stamped

imuData=Imu()
magData=MagneticField()
#magData=Vector3Stamped()
pub_Imu = rospy.Publisher('imu/data_raw', Imu, queue_size=10)
pub_Mag = rospy.Publisher('imu/mag', MagneticField, queue_size=10)

magx_max=0.5308837890625
magx_min=-0.0865478515625
magy_max=-0.2818603515625
magy_min=-0.8355712890625
magz_max=0.8919677734375
magz_min=0.3597412109375

#pub_Strx = rospy.Publisher('stringx', String, queue_size=10)
#pub_Stry = rospy.Publisher('stringy', String, queue_size=10)
#pub_Strz = rospy.Publisher('stringz', String, queue_size=10)
#pub_vector3= rospy.Publisher('imu/mag', Vector3Stamped, queue_size=10)

cnt=0

def getData():
	cnt=0         
	yaw = IMU.prevYaw[0]
	angle = IMU.prevAngle[0]
	[Gx_w, Gy_w, Gz_w] = IMU.readGyro()
	[Mx, My, Mz] = IMU.readMagnetometer()
	[Ax, Ay, Az] = IMU.readAccelerometer()
	current_time = rospy.Time.now()
	#seconds = current_time.to_sec()
	#nanosec = current_time.to_nsec()
		
	imuData.angular_velocity.x=(Gx_w)*3.14159265 / 180 - 0.0398989952#- 0.046290265326#*(-0.000152716)
	imuData.angular_velocity.y=(Gy_w)*3.14159265 / 180 +0.14861256014112 #+ 0.148910471424#*(-0.000152716)
	imuData.angular_velocity.z=(Gz_w)*3.14159265 / 180 + 0.040392916075774 #+ 0.041820742546#*(-0.000152716)
	#pub_Str.publish(str(imuData.angular_velocity.z))
	
	imuData.linear_acceleration.x=Ax#*0.00059820565
	imuData.linear_acceleration.y=Ay#*0.00059820565
	imuData.linear_acceleration.z=Az#*0.00059820565
	imuData.linear_acceleration_covariance=[0.00026, 0, 0, 0, 0.000277, 0, 0, 0, 0.00011]

	imuData.header.seq = cnt
	imuData.header.stamp = current_time
	imuData.header.frame_id = "base_link"

	magData.header.seq = cnt
	magData.header.stamp = current_time
	magData.header.frame_id = "base_link"
	'''
	if(Mx>magx_max):
		magx_max=Mx
	elif(Mx<magx_min):
		magx_min=Mx
	if(My>magy_max):
		magy_max=My
	elif(My<magy_min):
		magy_min=My
	if(Mz>magz_max):
		magz_max=Mz
	elif(Mz<magx_min):
		magz_min=Mz
	'''
	magData.magnetic_field.x= 2*(Mx-magx_min)/(magx_max-magx_min)-1  #Mx/10000#*0.0000000146156
	magData.magnetic_field.y=2*(My-magy_min)/(magy_max-magy_min)-1#My/10000#*0.0000000146156
	magData.magnetic_field.z=2*(Mz-magz_min)/(magz_max-magz_min)-1#Mz/10000#*0.0000000146156

	#magData.vector.x=Mx#*0.0000000146156
	#magData.vector.y=My#*0.0000000146156
	#magData.vector.z=Mz#*0.0000000146156
	#pub_Strx.publish(str(Mx))
	#pub_Stry.publish(str(My))
	#pub_Strz.publish(str(Mz))
	pub_Imu.publish(imuData)
	pub_Mag.publish(magData)
	#pub_vector3.publish(magData)

	'''
	print "Gyro"		
	print Gx_w, Gy_w, Gz_w
	print('')	
	print "Accelerometer"		
	print Ax, Ay, Az
	print('')		
	print "Magnetometer"		
	print Mx, My, Mz
	print('')
	print('')
	#print yaw
	#print angle
	'''


if __name__ == "__main__":
	rospy.init_node("IMU_Driver")
	rate = rospy.Rate(30)
	print("IMU node has started successfully!")
	IMU = MinIMU_v5_pi()
	#IMU.trackYaw()
	#IMU.trackAngle()
	while not rospy.is_shutdown():
		try:
			getDataThread = threading.Thread(target=getData)
			getDataThread.daemon = True
			getDataThread.start()
			rate.sleep()
		except:
			rate.sleep()
			continue