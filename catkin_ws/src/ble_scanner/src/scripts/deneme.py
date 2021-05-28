#!/usr/bin/env python

import rospy
import time

from MinIMU_v5_pi import MinIMU_v5_pi


def main():
	#Setup the MinIMU_v5_pi
	IMU = MinIMU_v5_pi()
	
	#Initiate tracking of Yaw on the IMU
	IMU.trackYaw()
	IMU.trackAngle()

	while True: #Main loop             
		time.sleep(0.1)
		yaw = IMU.prevYaw[0]
		angle = IMU.prevAngle[0]
		[Gx_w, Gy_w, Gz_w] = IMU.readGyro()
		[Mx, My, Mz] = IMU.readMagnetometer()
		[Ax, Ay, Az] = IMU.readAccelerometer()
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


if __name__ == "__main__":
	main()


