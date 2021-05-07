;; Auto-generated. Do not edit!


(when (boundp 'ble_scanner::BLEData)
  (if (not (find-package "BLE_SCANNER"))
    (make-package "BLE_SCANNER"))
  (shadow 'BLEData (find-package "BLE_SCANNER")))
(unless (find-package "BLE_SCANNER::BLEDATA")
  (make-package "BLE_SCANNER::BLEDATA"))

(in-package "ROS")
;;//! \htmlinclude BLEData.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ble_scanner::BLEData
  :super ros::object
  :slots (_header _data ))

(defmethod ble_scanner::BLEData
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:data __data) (let (r) (dotimes (i 0) (push (instance ble_scanner::BLEBeacon :init) r)) r))
    )
   (send-super :init)
   (setq _header __header)
   (setq _data __data)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:data
   (&rest __data)
   (if (keywordp (car __data))
       (send* _data __data)
     (progn
       (if __data (setq _data (car __data)))
       _data)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; ble_scanner/BLEBeacon[] _data
    (apply #'+ (send-all _data :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; ble_scanner/BLEBeacon[] _data
     (write-long (length _data) s)
     (dolist (elem _data)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; ble_scanner/BLEBeacon[] _data
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _data (let (r) (dotimes (i n) (push (instance ble_scanner::BLEBeacon :init) r)) r))
     (dolist (elem- _data)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get ble_scanner::BLEData :md5sum-) "732afaf871b82fdd6eb3501993799354")
(setf (get ble_scanner::BLEData :datatype-) "ble_scanner/BLEData")
(setf (get ble_scanner::BLEData :definition-)
      "Header header       # timestamp
BLEBeacon[] data  # BLE data of all beacons

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

================================================================================
MSG: ble_scanner/BLEBeacon
string mac_address # MAC address of an access point
string rssi         # signal strength [RSSI]

")



(provide :ble_scanner/BLEData "732afaf871b82fdd6eb3501993799354")


