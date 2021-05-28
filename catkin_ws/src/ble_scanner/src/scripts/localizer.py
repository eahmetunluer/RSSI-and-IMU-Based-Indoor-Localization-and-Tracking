#!/usr/bin/env python

import rospy
import rssi

from ble_scanner.msg import *
from visualization_msgs.msg import Marker
from rssi import RSSI_Localizer
from std_msgs.msg import String
#from geometry_msgs.msg import PoseWithCovarianceStamped
from nav_msgs.msg import Odometry

accessPoints=[{
    'signalAttenuation': 4.322, 
    'location': {
    'y': 1.034, 
	'x': 2.56
    }, 
    'reference': {
        'distance': 1, 
        'signal': -52
    }, 
    'name': 'iBeacon1'
},

    {
    'signalAttenuation': 4.33,#5.1,#1.99, 
    'location': {
	'y': -2.13, 
	'x':  -2.4
    }, 
    'reference': {
        'distance': 1, 
        'signal': -45
    }, 
    'name': 'iBeacon2'
},

    {
         'signalAttenuation': 4.33,#2.325, 
         'location': {
             'y': -1.26, 
             'x': 0.98
         }, 
         'reference': {
             'distance': 1, 
             'signal': -56#-60
         }, 
         'name': 'iBeacon3'
},

{
    'signalAttenuation': 4.3219, 
    'location': {
        'y': -3.4, 
	'x': -6.6
    }, 
    'reference': {
        'distance': 1, 
        'signal': -45#-52
    }, 
    'name': 'iBeacon4'
},

    {
    'signalAttenuation': 4.33,#4.6541, 
    'location': {
	'y': -4.4, 
	'x': -3.8
    }, 
    'reference': {
        'distance': 1, 
        'signal': -45#-49
    }, 
    'name': 'iBeacon5'
},

    {
         'signalAttenuation': 4.33,#3.16267,
         'location': {
             'y': 1.93, 
             'x': -0.51
         }, 
         'reference': {
             'distance': 1, 
             'signal': -52
         }, 
         'name': 'iBeacon6'
     }
]


pub = rospy.Publisher('ble_position', Odometry, queue_size=10)
odom = Odometry()

tmp_accessPoints = []
Xk=[0,0,0,0,0,0]
Pk=[5, 5, 5, 5, 5, 5]
def callback(data):
    global Xk
    global Pk
    Q=1e-5  
    R=10
    current_time = rospy.Time.now()
    global tmp_accessPoints
    tmp_accessPoints = []
    result = []
    cnt=0     
    th={"34:14:b5:41:a4:a7" : "iBeacon1","34:14:b5:41:d1:fd" : "iBeacon2","34:14:b5:41:e3:db" : "iBeacon3", "34:14:b5:41:a2:3a" : "iBeacon4","34:14:b5:41:d7:6b" : "iBeacon5","34:14:b5:41:d1:b1" : "iBeacon6"}
    for j in th.keys():
        ttt=1
        device = {"quality" : '43'}
        for dev in data.data:
            if dev.mac_address == j and ttt==1 and dev.rssi!='':
                ttt=0
                measured_rssi = int(dev.rssi)
                ### KALMAN (https://www.researchgate.net/publication/283564070_Enhanced_Localization_for_Indoor_Construction)
                Pkdel=Pk[cnt]+Q
                Kk=Pkdel/(Pkdel+R)
                Xk[cnt]=Xk[cnt]+Kk*(measured_rssi-Xk[cnt])
                Pk[cnt]=(1-Kk)*Pkdel
                ###
                device['signal']=Xk[cnt]
                #device['signal']=measured_rssi
                device["ssid"] = th[j]
                result.append(device)
                tmp_accessPoints.append(accessPoints[cnt])
        cnt+=1
    rssi_values = [x["signal"] for x in result]

    ##### POSITION
    if len(rssi_values)>2:
        rssi_localizer_instance = RSSI_Localizer(tmp_accessPoints)
        position = rssi_localizer_instance.getNodePosition(rssi_values)
        odom.header.stamp = current_time
        odom.header.frame_id = "odom"
        odom.child_frame_id = "base_link"
        odom.pose.pose.position.x = float(position[0])
        odom.pose.pose.position.y = float(position[1])
        odom.pose.pose.position.z = float(0)
        odom.pose.covariance=[0.6361,0,0,0,0,0,0,0.0065,0,0,0,0,0,0,0.00023,0,0,0,0,0,0,1.0502,0,0,0,0,0,0,0.0065,0,0,0,0,0,0,0.00023]
        pub.publish(odom)

def listener():

    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber('ble_data', BLEData, callback)

    rospy.spin()


if __name__ == '__main__':
    listener()