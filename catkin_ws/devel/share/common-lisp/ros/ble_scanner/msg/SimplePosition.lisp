; Auto-generated. Do not edit!


(cl:in-package ble_scanner-msg)


;//! \htmlinclude SimplePosition.msg.html

(cl:defclass <SimplePosition> (roslisp-msg-protocol:ros-message)
  ((x_position
    :reader x_position
    :initarg :x_position
    :type cl:string
    :initform "")
   (y_position
    :reader y_position
    :initarg :y_position
    :type cl:string
    :initform ""))
)

(cl:defclass SimplePosition (<SimplePosition>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SimplePosition>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SimplePosition)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ble_scanner-msg:<SimplePosition> is deprecated: use ble_scanner-msg:SimplePosition instead.")))

(cl:ensure-generic-function 'x_position-val :lambda-list '(m))
(cl:defmethod x_position-val ((m <SimplePosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ble_scanner-msg:x_position-val is deprecated.  Use ble_scanner-msg:x_position instead.")
  (x_position m))

(cl:ensure-generic-function 'y_position-val :lambda-list '(m))
(cl:defmethod y_position-val ((m <SimplePosition>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ble_scanner-msg:y_position-val is deprecated.  Use ble_scanner-msg:y_position instead.")
  (y_position m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SimplePosition>) ostream)
  "Serializes a message object of type '<SimplePosition>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'x_position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'x_position))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'y_position))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'y_position))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SimplePosition>) istream)
  "Deserializes a message object of type '<SimplePosition>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'x_position) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'x_position) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'y_position) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'y_position) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SimplePosition>)))
  "Returns string type for a message object of type '<SimplePosition>"
  "ble_scanner/SimplePosition")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SimplePosition)))
  "Returns string type for a message object of type 'SimplePosition"
  "ble_scanner/SimplePosition")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SimplePosition>)))
  "Returns md5sum for a message object of type '<SimplePosition>"
  "aab86a45c2e294c1cd32aeeb0e43f193")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SimplePosition)))
  "Returns md5sum for a message object of type 'SimplePosition"
  "aab86a45c2e294c1cd32aeeb0e43f193")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SimplePosition>)))
  "Returns full string definition for message of type '<SimplePosition>"
  (cl:format cl:nil "string x_position~%string y_position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SimplePosition)))
  "Returns full string definition for message of type 'SimplePosition"
  (cl:format cl:nil "string x_position~%string y_position~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SimplePosition>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'x_position))
     4 (cl:length (cl:slot-value msg 'y_position))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SimplePosition>))
  "Converts a ROS message object to a list"
  (cl:list 'SimplePosition
    (cl:cons ':x_position (x_position msg))
    (cl:cons ':y_position (y_position msg))
))
