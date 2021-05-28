#!/usr/bin/env python

import rospy
import rssi

from ble_scanner.msg import *
from visualization_msgs.msg import Marker
from rssi import RSSI_Localizer
from std_msgs.msg import String
from geometry_msgs.msg import PoseWithCovarianceStamped

accessPoints=[{
    'signalAttenuation': 3.33, 
    'location': {
        'y': 0, 
	'x': 0
    }, 
    'reference': {
        'distance': 1, 
        'signal': -56
    }, 
    'name': 'iBeacon1'
},

    {
    'signalAttenuation': 3.33, 
    'location': {
	'y': 2.75, 
	'x': 1.5
    }, 
    'reference': {
        'distance': 1, 
        'signal': -56
    }, 
    'name': 'iBeacon2'
},

    {
         'signalAttenuation': 3.33, 
         'location': {
             'y': 0, 
             'x': 3
         }, 
         'reference': {
             'distance': 1, 
             'signal': -56
         }, 
         'name': 'iBeacon3'
},

{
    'signalAttenuation': 1.9, 
    'location': {
        'y': 0.69, 
	'x': 2.589
    }, 
    'reference': {
        'distance': 1, 
        'signal': -56
    }, 
    'name': 'iBeacon4'
},

    {
    'signalAttenuation': 2.4, 
    'location': {
	'y': -1.93, 
	'x': -2.3
    }, 
    'reference': {
        'distance': 1, 
        'signal': -56
    }, 
    'name': 'iBeacon5'
},

    {
         'signalAttenuation': 1.5,
         'location': {
             'y': 1.03, 
             'x': -1.78
         }, 
         'reference': {
             'distance': 1, 
             'signal': -56
         }, 
         'name': 'iBeacon6'
     }

]


pub = rospy.Publisher('ble_position', PoseWithCovarianceStamped, queue_size=10)
pos = PoseWithCovarianceStamped()

tmp_accessPoints = []
Xk=[-45, -45, -45, -45, -45, -45]
Pk=[0.1, 0.1, 0.1, 0.1, 0.1, 0.1]
def callback(data):
    global Xk
    global Pk
    Q=1e-5  
    R=3
    current_time = rospy.Time.now()
    global tmp_accessPoints
    tmp_accessPoints = []
    result = []
    cnt=0     
    th={"aa:aa:b5:41:a4:a7" : "iBeacon1","aa:aa:b5:41:d1:fd" : "iBeacon2","aa:aa:b5:41:e3:db" : "iBeacon3", "34:14:b5:41:a2:3a" : "iBeacon4","34:14:b5:41:d7:6b" : "iBeacon5","34:14:b5:41:d1:b1" : "iBeacon6"}
    for j in th.keys():
        ttt=1
        device = {"quality" : '43'}
        for dev in data.data:
            if dev.mac_address == j and ttt==1 and dev.rssi!='':
                ttt=0
                measured_rssi = int(dev.rssi)
                ### KALMAN
                Pkdel=Pk[cnt]+Q
                Kk=Pkdel/(Pkdel+R)
                Xk[cnt]=Xk[cnt]+Kk*(measured_rssi-Xk[cnt])
                Pk[cnt]=(1-Kk)*Pkdel
                ###
                device['signal']=Xk[cnt]
                device["ssid"] = th[j]
                result.append(device)
                tmp_accessPoints.append(accessPoints[cnt])
        cnt+=1
    rssi_values = [x["signal"] for x in result]

    ##### POSITION
    if len(rssi_values)>2:
        rssi_localizer_instance = RSSI_Localizer(tmp_accessPoints)
        position = rssi_localizer_instance.getNodePosition(rssi_values)
        pos.header.stamp = current_time
        pos.header.frame_id = "base_link"
        pos.pose.pose.position.x = float(position[0])
        pos.pose.pose.position.y = float(position[1])
        pos.pose.pose.position.z = float(0)
        pos.pose.covariance=[0.001,0,0,0,0,0,0,0.001,0,0,0,0,0,0,0.001,0,0,0,0,0,0,0.001,0,0,0,0,0,0,0.001,0,0,0,0,0,0,0.001]
        pub.publish(pos)

def listener():

    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber('ble_data', BLEData, callback)

    rospy.spin()


if __name__ == '__main__':
    listener()