#!/usr/bin/env python
# -*- coding:utf-8 -*-
######################Ceyhunlar Lib######################
import SH1106
import time
import config
import traceback
import RPi.GPIO as GPIO
import subprocess
import rospy
from PIL import Image
from PIL import ImageDraw
from PIL import ImageFont
from pygame import mixer, event
######################Ceyhunlar Lib######################
######################ROS Lib######################

from nav_msgs.msg import Odometry
######################ROS Lib######################


######################Declerations/inits######################

#GPIO define
RST_PIN        = 25
CS_PIN         = 8
DC_PIN         = 24

KEY_UP_PIN     = 6 
KEY_DOWN_PIN   = 19
KEY_LEFT_PIN   = 5
KEY_RIGHT_PIN  = 26
KEY_PRESS_PIN  = 13

KEY1_PIN       = 21
KEY2_PIN       = 20
KEY3_PIN       = 16


# 240x240 display with hardware SPI:
disp = SH1106.SH1106()
disp.Init()
x0=0
y1=12
font = ImageFont.load_default()
# Clear display.
disp.clear()
# time.sleep(1)

#init GPIO
# for P4:
# sudo vi /boot/config.txt
# gpio=6,19,5,26,13,21,20,16=pu
GPIO.setmode(GPIO.BCM) 
GPIO.setup(KEY_UP_PIN,      GPIO.IN, pull_up_down=GPIO.PUD_UP)    # Input with pull-up
GPIO.setup(KEY_DOWN_PIN,    GPIO.IN, pull_up_down=GPIO.PUD_UP)  # Input with pull-up
GPIO.setup(KEY_LEFT_PIN,    GPIO.IN, pull_up_down=GPIO.PUD_UP)  # Input with pull-up
GPIO.setup(KEY_RIGHT_PIN,   GPIO.IN, pull_up_down=GPIO.PUD_UP) # Input with pull-up
GPIO.setup(KEY_PRESS_PIN,   GPIO.IN, pull_up_down=GPIO.PUD_UP) # Input with pull-up
GPIO.setup(KEY1_PIN,        GPIO.IN, pull_up_down=GPIO.PUD_UP)      # Input with pull-up
GPIO.setup(KEY2_PIN,        GPIO.IN, pull_up_down=GPIO.PUD_UP)      # Input with pull-up
GPIO.setup(KEY3_PIN,        GPIO.IN, pull_up_down=GPIO.PUD_UP)      # Input with pull-up

# Create blank image for drawing.
# Make sure to create image with mode '1' for 1-bit color.

image = Image.new('1', (disp.width, disp.height), "WHITE")


draw = ImageDraw.Draw(image)
mixer.init()



# Draw a black filled box to clear the image.
# draw.rectangle((0,0,disp.width,disp.height), outline=0, fill=1)
# disp.ShowImage(disp.getbuffer(image))
# try:

######################ROS DECS######################

position = 0
c1, c2, c3, c4, c5, c6, c0 = 0, 0, 0, 0, 0, 0, 0
t1, t2, t3, t4, t5, t6, t0 = 0, 0, 0, 0, 0, 0, 0
def listener(): 
    rospy.init_node('listener', anonymous=True) 
    rospy.Subscriber("odometry/filtered", Odometry, callback) 
    rospy.spin()

######################Declerations/inits######################
#########################BULK#################################
def callback(data):
    global c0, c1, c2, c3, c4, c5, c6
    global t1, t2, t3, t4, t5, t6, t0
#############
#####while 1:
#############
    vol = 2
    count =1
    
    pos_new=0
    occ_var=0
    pay_var=0
    payment_var_info=0
    ticket_pass=0
    x_value = data.pose.pose.position.x
    y_value = data.pose.pose.position.y
################################################################################
    xbeacon1, ybeacon1= 2.56, 1.034 #beacon1
    xbeacon2, ybeacon2= -2.4, -2.13 #beacon2
    xbeacon3, ybeacon3= 0.98, -1.26 #beacon3
    xbeacon4, ybeacon4= -6.6, -3.4 #beacon4
    xbeacon5, ybeacon5= -3.8, -4.4 #beacon5
    xbeacon6, ybeacon6= -0.51, 1.93 #beacon6
    global position
    if ((x_value-xbeacon1)**2+(y_value-ybeacon1)**2)**0.5<1.2:
        position=1
        mixer.music.load("conuigi_london.mp3")
    elif ((x_value-xbeacon2)**2+(y_value-ybeacon2)**2)**0.5<1.2:
        position=2
        mixer.music.load("leonardo_devirgin.mp3")
    elif ((x_value-xbeacon3)**2+(y_value-ybeacon3)**2)**0.5<1.2:
        position=3
        mixer.music.load("rembrand_london.mp3")
    elif ((x_value-xbeacon4)**2+(y_value-ybeacon4)**2)**0.5<1.2:
        position=4
        mixer.music.load("stjerome.mp3")
    elif ((x_value-xbeacon5)**2+(y_value-ybeacon5)**2)**0.5<1.2:
        position=5
        mixer.music.load("wiltondip_london.mp3")
    elif ((x_value-xbeacon6)**2+(y_value-ybeacon6)**2)**0.5<1.2:
        position=6
        mixer.music.load("van_gogh_sunflower.mp3")
    print(f"Position: {position}")

#payment code for screen

    pay_var=0 #adjusted manually, 0:payment is done, 1:payment is not done
    section=0
    x_treshold=-1.8  #edip ayarla
    y_treshold=-1.8  #ahmet ayarla
    if x_value<x_treshold and y_value<y_treshold:  #ünlüer tresholdları ayarla
        section=2
    else:
        section=1

    if section==2: 
        pay_var=pay_var
    else:
        pay_var=0


#occupancy code for screen

    occupancy_number_1=0 #adjusted for some specific number
    occupancy_number_2=0
    occupancy_limit=3
    occ_var=0

    if occupancy_number_1>occupancy_limit and section==1:
        occ_var=1 #1:warning
    elif occupancy_number_2>occupancy_limit and section==2:
        occ_var=1 #1:warning
    else:
        occ_var=0 #0:no warning

################################################################################

#the part below is to arrange location
    if occ_var == 0:
        if pay_var == 0 or ticket_pass==1:
            draw.rectangle((0,0,128,48),outline=1,fill=1)
            draw.text((x0,0), f"Section:{section} Item:{position}", font=font, fill=0)
            draw.text((x0, y1),   "Play-KEY1\n" , font=font, fill=0)
            draw.text((x0, y1*2),   "Pause-KEY2\n", font=font, fill=0)
            draw.text((x0, y1*3),"Unpause-KEY3\n", font=font, fill=0)
            
            '''
            if position==1:
                c2, c3, c4, c5, c6, c0 = 0, 0, 0, 0, 0, 0
                c1=c1+1
                if c1>3:
                    pos_new=1
                    t2, t3, t4, t5, t6, t0 = 0, 0, 0, 0, 0, 0
                    if t1==0:
                        mixer.music.load("conuigi_london.mp3")
                    t1=1
            elif position==2:
                c1, c3, c4, c5, c6, c0 = 0, 0, 0, 0, 0, 0
                c2=c2+1
                if c2>3:
                    pos_new=2
                    t1, t3, t4, t5, t6, t0 = 0, 0, 0, 0, 0, 0
                    if t2==0:
                        mixer.music.load("leonardo_devirgin.mp3")
                    t2=1
            elif position==3:
                c2, c1, c4, c5, c6, c0 = 0, 0, 0, 0, 0, 0
                c3=c3+1
                if c3>3:
                    t2, t1, t4, t5, t6, t0 = 0, 0, 0, 0, 0, 0
                    if t3==0:
                        mixer.music.load("rembrand_london.mp3")
                    t3=1
                    pos_new=3
            elif position==4:
                c2, c3, c1, c5, c6, c0 = 0, 0, 0, 0, 0, 0
                c4=c4+1
                if c4>3:
                    t2, t3, t1, t5, t6, t0 = 0, 0, 0, 0, 0, 0
                    pos_new=4
                    if t4==0:
                        mixer.music.load("stjerome.mp3")
                    t4=1
            elif position==5:
                c2, c3, c4, c1, c6, c0 = 0, 0, 0, 0, 0, 0
                c5=c5+1
                if c5>3:
                    t2, t3, t4, t1, t6, t0 = 0, 0, 0, 0, 0, 0
                    pos_new=5
                    if t5==0:
                        mixer.music.load("wiltondip_london.mp3")
                    t5=1
            elif position==6:
                c2, c3, c4, c5, c1, c0 = 0, 0, 0, 0, 0, 0
                c6=c6+1
                if c6>3:
                    t2, t3, t4, t5, t1, t0 = 0, 0, 0, 0, 0, 0
                    pos_new=6
                    if t6==0:
                        mixer.music.load("van_gogh_sunflower.mp3")
                    t6=1
            else:
                c2, c3, c4, c5, c6, c1 = 0, 0, 0, 0, 0, 0
                c0=c0+1
                if c0>3:
                    pos_new=0	
            print(f"Pos_new: {pos_new}")
            '''
            #the part below is to load music for location

            #if pos_new==1:
            #    mixer.music.load("mp3deneme.mp3")
            #elif pos_new==2:	
            #    mixer.music.load("ibo.mp3")
            #elif pos_new==3:
            #    mixer.music.load("canisi.mp3")
            #elif pos_new==4:
            #    mixer.music.load("killa.mp3")
            #elif pos_new==5:
            #    mixer.music.load("benjamin.mp3")
            #elif pos_new==6:
            #    mixer.music.load("yorgunum.mp3")	

            if GPIO.input(KEY1_PIN): # button is released
                draw.text((x0, y1),   "              \n" , font=font, fill=0)
            
            else: # button is pressed:
                print ("KEY1")
                mixer.music.set_volume(vol)
                mixer.music.play()
            if GPIO.input(KEY2_PIN): # button is released
                draw.text((x0, y1*2),"                                \n" , font=font, fill=255)
            else: # button is pressed:
                # fill=1) #B button filled
            
                mixer.music.pause()
                    
                print ("KEY2")
                

            if GPIO.input(KEY3_PIN): # button is released
                draw.text((x0, y1*3),"                 \n", font=font, fill=0)
            
            else: # button is pressed:
                print ("KEY3")
                mixer.music.unpause()

        
            if GPIO.input(KEY_UP_PIN):	
                pass
            else:
                print ("KEY_up")
                if vol < 10:
                    vol=vol+0.5
                else:
                    vol=vol   
                mixer.music.set_volume(vol)
            if GPIO.input(KEY_DOWN_PIN):	
                pass
            else:
                print ("KEY_down")
                if vol > 0:
                    vol=vol-0.5
                else:
                    vol=vol   
                mixer.music.set_volume(vol)
        
        
            if GPIO.input(KEY_LEFT_PIN):
                pass	
            else: # button is pressed:

                
                mixer.music.set_pos((mixer.music.get_pos()*1e-3)-100)
                print ("KEY_left")
            
            if GPIO.input(KEY_RIGHT_PIN):
                pass	
            else: # button is pressed:
                
                mixer.music.set_pos((mixer.music.get_pos()*1e-3)+100)
                print ("KEY_right")
        else:
            draw.rectangle((0,36,128,48),outline=1,fill=1)
            draw.text((x0, y1),"Payment Warning!", font=font, fill=0)
            draw.text((x0, y1*2),"You will be charged", font=font, fill=0)
            print("Payment Warning!")
            payment_var_info=payment_var_info+1
            if payment_var_info>100:
                ticket_pass = 1
    else:
        print("Occupancy Warning ! You should wait or go to other section ") 
        draw.rectangle((0,12,128,24),outline=1,fill=1)
        draw.text((x0, y1),"Occupancy Warning!", font=font, fill=0)   
        draw.text((x0, y1*2),"Wait or Try Later!", font=font, fill=0)         
                
    disp.ShowImage(disp.getbuffer(image))

#########################BULK#################################

if __name__ == '__main__':
    listener()