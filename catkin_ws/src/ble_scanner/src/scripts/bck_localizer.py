#!/usr/bin/env python

import rospy
import rssi

from ble_scanner.msg import *
from visualization_msgs.msg import Marker
from rssi import RSSI_Localizer
from std_msgs.msg import String
from geometry_msgs.msg import PoseWithCovarianceStamped

#markerBeacon4 = Marker()
#markerBeacon4.pose.position.x = 0
#markerBeacon4.pose.position.y = 0
#markerBeacon4.pose.position.z = 0
#markerBeacon4.pose.orientation.x=0
#markerBeacon4.pose.orientation.y=0
#markerBeacon4.pose.orientation.z=0
#markerBeacon4.pose.orientation.w=1
#markerBeacon4.scale.x =0.2
#markerBeacon4.scale.y =0.2
#markerBeacon4.scale.z =2
#markerBeacon4.color.a = 1.0
#markerBeacon4.header.frame_id="my_frame"
#markerBeacon4.type = markerBeacon4.CUBE
#markerBeacon4.action = markerBeacon4.ADD
#
#markerBeacon5 = Marker()
#markerBeacon5.pose.position.x = 1.5
#markerBeacon5.pose.position.y = 2.75
#markerBeacon5.pose.position.z = 0
#markerBeacon5.pose.orientation.x=0
#markerBeacon5.pose.orientation.y=0
#markerBeacon5.pose.orientation.z=0
#markerBeacon5.pose.orientation.w=1
#markerBeacon5.scale.x =0.2
#markerBeacon5.scale.y =0.2
#markerBeacon5.scale.z =2
#markerBeacon5.color.a = 1.0
#markerBeacon5.header.frame_id="my_frame"
#markerBeacon5.type = markerBeacon5.CUBE
#markerBeacon5.action = markerBeacon5.ADD
#
#markerBeacon6 = Marker()
#markerBeacon6.pose.position.x = 3
#markerBeacon6.pose.position.y = 0
#markerBeacon6.pose.position.z = 0
#markerBeacon6.pose.orientation.x=0
#markerBeacon6.pose.orientation.y=0
#markerBeacon6.pose.orientation.z=0
#markerBeacon6.pose.orientation.w=1
#markerBeacon6.scale.x =0.2
#markerBeacon6.scale.y =0.2
#markerBeacon6.scale.z =2
#markerBeacon6.color.a = 1.0
#markerBeacon6.header.frame_id="my_frame"
#markerBeacon6.type = markerBeacon6.CUBE
#markerBeacon6.action = markerBeacon6.ADD

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


#print(accessPoints[0])

'''
accessPoint = {
     'signalAttenuation': 3, 
     'location': {
         'y': 1, 
         'x': 1
     }, 
     'reference': {
         'distance': 4, 
         'signal': -50
     }, 
     'name': 'dd-wrt'
}
signalStrength = -40

distance = rssi_localizer_instance.getDistanceFromAP(accessPoint, signalStrength)
#print(distance["distance"])
'''
#######################################################################
pub = rospy.Publisher('ble/position', PoseWithCovarianceStamped, queue_size=10)
#pub4 = rospy.Publisher('beacon4', Marker, queue_size=10)
#pub5= rospy.Publisher('beacon5', Marker, queue_size=10)
#pub6 = rospy.Publisher('beacon6', Marker, queue_size=10)
#pub7 = rospy.Publisher('SimplePositionData', SimplePosition, queue_size=10)

pos = PoseWithCovarianceStamped()
#SPOS=SimplePosition()
#marker = Marker()
#marker.pose.position.z = 0
#marker.pose.orientation.x=0
#marker.pose.orientation.y=0
#marker.pose.orientation.z=0
#marker.pose.orientation.w=1
#marker.scale.x =0.2
#marker.scale.y =0.2
#marker.scale.z =0.2
#marker.color.a = 1.0
#marker.header.frame_id="my_frame"
#marker.type = marker.SPHERE
#marker.action = marker.ADD

buff = []
tmp_accessPoints = []
distBuff = []
threshHold = -5
distThreshHold = 0.40
def callback(data):
    current_time = rospy.Time.now()
    global buff
    global tmp_accessPoints
    tmp_accessPoints = []
    result = []
    cnt=0
    #"34:14:b5:41:a4:a7" : "iBeacon1","34:14:b5:41:d1:fd" : "iBeacon2","34:14:b5:41:e3:db" : "iBeacon3", 
    th={"34:14:b5:41:a2:3a" : "iBeacon4","34:14:b5:41:d7:6b" : "iBeacon5","34:14:b5:41:d1:b1" : "iBeacon6"}
    for j in th.keys():
        ttt=1
        device = {"quality" : '43'}
        for dev in data.data:
            if dev.mac_address == j and ttt==1 and dev.rssi!='':
                ttt=0
                device['signal'] = int(dev.rssi)
                device["ssid"] = th[j]
                result.append(device)
                tmp_accessPoints.append(accessPoints[cnt])
                cnt+=1
    rssi_values = [x["signal"] for x in result]
    #print(rssi_values)

##### DISTANCE
#    accessPoint1 = {
#        'signalAttenuation':3.33 , 
#        'location': {
#	    'y': 0, 
#            'x': 0
#        }, 
#        'reference': {
#            'distance': 1, 
#            'signal': -56
#        }, 
#        'name': 'dd-wrt'
#   }
#    accessPoint2 = {
#        'signalAttenuation':3.33 , 
#        'location': {
#	    'y': 2.75, 
#            'x': 1.5
#        }, 
#        'reference': {
#            'distance': 1, 
#            'signal': -56
#        }, 
#        'name': 'dd-wrt'
#   }
#    accessPoint3 = {
#        'signalAttenuation':3.33 , 
#        'location': {
#	    'y': 0, 
#            'x': 3
#        }, 
#        'reference': {
#            'distance': 1, 
#            'signal': -56
#        }, 
#        'name': 'dd-wrt'
#   }
    #summ=0;
    #######if len(rssi_values)==3:
	######distance1 = rssi_localizer_instance.getDistanceFromAP(accessPoint3, rssi_values[2])
	#distance2 = rssi_localizer_instance.getDistanceFromAP(accessPoint2, rssi_values[1])
	#distance2 = rssi_localizer_instance.getDistanceFromAP(accessPoint2, rssi_values[1])
	#distance3 = rssi_localizer_instance.getDistanceFromAP(accessPoint3, rssi_values[2])
	#######print(distance1['distance'])
	#print("Beacon4 distance" , distance1['distance'])
	#print("Beacon5 distance" , distance2['distance'])
	#print("Beacon6 distance" , distance3['distance'])
	#print("\n")
	#if len(distBuff)==0:
	#    distBuff.append(distance)
	#print(type(float(distBuff[0])))
	#for i in range(len(distBuff)):
	#    summ=summ+distBuff[i]
	#distAvg = summ/len(distBuff)
	#distAvg = [sum(col)/len(col) for col in zip(*distBuff)]
        #distBuff.append(distance)
        #if len(distBuff)>=15:
	#    distBuff.pop(0)	
	#    if not (distAvg + distThreshHold > distance > distAvg - distThreshHold):	        
	#	    print(distAvg)
	#    else:
	#	    print(distance['distance'])
	#else:
	#    print(distance['distance'])

#####


##### POSITION

    
    if len(rssi_values)>2:
        '''	
	    if len(buff)==0:
	        buff.append(rssi_values)
	    avg = [sum(col)/len(col) for col in zip(*buff)]
            buff.append(rssi_values)
	    rssi_tmp=[]
	    #print(buff)
            if len(buff)>=10:
	        buff.pop(0)	
	        for i in range(len(rssi_values)):
	    	print(i)
	            if not (avg[i] + threshHold < rssi_values[i] < avg[i] - threshHold):	        
	    	    rssi_tmp.append(avg[i])
	    	else:
	    	    rssi_tmp.append(rssi_values[i])
	    else:
	        rssi_tmp=rssi_values
            '''
        rssi_localizer_instance = RSSI_Localizer(tmp_accessPoints)
        #print(tmp_accessPoints)
        position = rssi_localizer_instance.getNodePosition(rssi_values)
        pos.header.stamp = current_time
        pos.header.frame_id = "rssi_link"
        pos.pose.pose.position.x = float(position[0])
        pos.pose.pose.position.y = float(position[1])
        pos.pose.pose.position.z = float(0)
        pos.pose.covariance=[0.1,0,0,0,0,0,0,0.1,0,0,0,0,0,0,0.1,0,0,0,0,0,0,0.1,0,0,0,0,0,0,0.1,0,0,0,0,0,0,0.1]
        pub.publish(pos)
        #print("OLD: {}            NEW: {}\n".format(rssi_values,rssi_tmp))
        #SPOS.x_position = str(position[0])
        #SPOS.y_position = str(position[1])
        #print(SPOS)	
        #marker.pose.position.x = position[0]	
        #marker.pose.position.y = position[1]
        #print(str(float(position[0])) + "\t"+ str(float(position[1])))
        #pub4.publish(markerBeacon4)
        #pub5.publish(markerBeacon5)
        #pub6.publish(markerBeacon6)
        #pub.publish(marker)
        #pub7.publish(SPOS)    
        #print(float(position[0]),float(position[1]))
#####
def listener():

    rospy.init_node('listener', anonymous=True)

    rospy.Subscriber('ble_data', BLEData, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

    


if __name__ == '__main__':
    listener()

'''
if __name__ == '__main__':

    try:
        talker()
    except rospy.ROSInterruptException:
        pass
'''


'''
ap_info = [
         {
             'ssid':'ucrwpa',
             'quality':'43/70',
             'signal':-66
         },
         {
             'ssid':'dd-wrt',
             'quality':'30/70',
             'signal':-66
         },
         {
             'ssid':'dd2-wrt',
             'quality':'30/70',
             'signal':-66
         }
     ] '''


###############################################################
'''
accessPoint2 = {
     'signalAttenuation':3.33 , 
     'location': {
         'y': 0, 
         'x': 1.5
     }, 
     'reference': {
         'distance': 1, 
         'signal': -56
     }, 
     'name': 'dd-wrt'
}
signalStrength = -66
distance = rssi_localizer_instance.getDistanceFromAP(accessPoint2, signalStrength)
print(distance)



'''




###################################################################



