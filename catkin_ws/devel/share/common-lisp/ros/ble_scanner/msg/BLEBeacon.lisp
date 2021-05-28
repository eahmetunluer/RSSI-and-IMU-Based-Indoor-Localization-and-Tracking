; Auto-generated. Do not edit!


(cl:in-package ble_scanner-msg)


;//! \htmlinclude BLEBeacon.msg.html

(cl:defclass <BLEBeacon> (roslisp-msg-protocol:ros-message)
  ((mac_address
    :reader mac_address
    :initarg :mac_address
    :type cl:string
    :initform "")
   (rssi
    :reader rssi
    :initarg :rssi
    :type cl:string
    :initform ""))
)

(cl:defclass BLEBeacon (<BLEBeacon>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <BLEBeacon>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'BLEBeacon)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ble_scanner-msg:<BLEBeacon> is deprecated: use ble_scanner-msg:BLEBeacon instead.")))

(cl:ensure-generic-function 'mac_address-val :lambda-list '(m))
(cl:defmethod mac_address-val ((m <BLEBeacon>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ble_scanner-msg:mac_address-val is deprecated.  Use ble_scanner-msg:mac_address instead.")
  (mac_address m))

(cl:ensure-generic-function 'rssi-val :lambda-list '(m))
(cl:defmethod rssi-val ((m <BLEBeacon>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ble_scanner-msg:rssi-val is deprecated.  Use ble_scanner-msg:rssi instead.")
  (rssi m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <BLEBeacon>) ostream)
  "Serializes a message object of type '<BLEBeacon>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'mac_address))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'mac_address))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'rssi))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'rssi))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <BLEBeacon>) istream)
  "Deserializes a message object of type '<BLEBeacon>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mac_address) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'mac_address) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'rssi) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'rssi) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<BLEBeacon>)))
  "Returns string type for a message object of type '<BLEBeacon>"
  "ble_scanner/BLEBeacon")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'BLEBeacon)))
  "Returns string type for a message object of type 'BLEBeacon"
  "ble_scanner/BLEBeacon")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<BLEBeacon>)))
  "Returns md5sum for a message object of type '<BLEBeacon>"
  "41e9b6b85696be601788ac9adc1e5c81")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'BLEBeacon)))
  "Returns md5sum for a message object of type 'BLEBeacon"
  "41e9b6b85696be601788ac9adc1e5c81")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<BLEBeacon>)))
  "Returns full string definition for message of type '<BLEBeacon>"
  (cl:format cl:nil "string mac_address # MAC address of an access point~%string rssi         # signal strength [RSSI]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'BLEBeacon)))
  "Returns full string definition for message of type 'BLEBeacon"
  (cl:format cl:nil "string mac_address # MAC address of an access point~%string rssi         # signal strength [RSSI]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <BLEBeacon>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'mac_address))
     4 (cl:length (cl:slot-value msg 'rssi))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <BLEBeacon>))
  "Converts a ROS message object to a list"
  (cl:list 'BLEBeacon
    (cl:cons ':mac_address (mac_address msg))
    (cl:cons ':rssi (rssi msg))
))
