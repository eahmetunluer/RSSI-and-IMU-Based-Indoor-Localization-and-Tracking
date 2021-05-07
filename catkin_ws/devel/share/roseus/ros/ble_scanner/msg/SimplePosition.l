;; Auto-generated. Do not edit!


(when (boundp 'ble_scanner::SimplePosition)
  (if (not (find-package "BLE_SCANNER"))
    (make-package "BLE_SCANNER"))
  (shadow 'SimplePosition (find-package "BLE_SCANNER")))
(unless (find-package "BLE_SCANNER::SIMPLEPOSITION")
  (make-package "BLE_SCANNER::SIMPLEPOSITION"))

(in-package "ROS")
;;//! \htmlinclude SimplePosition.msg.html


(defclass ble_scanner::SimplePosition
  :super ros::object
  :slots (_x_position _y_position ))

(defmethod ble_scanner::SimplePosition
  (:init
   (&key
    ((:x_position __x_position) "")
    ((:y_position __y_position) "")
    )
   (send-super :init)
   (setq _x_position (string __x_position))
   (setq _y_position (string __y_position))
   self)
  (:x_position
   (&optional __x_position)
   (if __x_position (setq _x_position __x_position)) _x_position)
  (:y_position
   (&optional __y_position)
   (if __y_position (setq _y_position __y_position)) _y_position)
  (:serialization-length
   ()
   (+
    ;; string _x_position
    4 (length _x_position)
    ;; string _y_position
    4 (length _y_position)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _x_position
       (write-long (length _x_position) s) (princ _x_position s)
     ;; string _y_position
       (write-long (length _y_position) s) (princ _y_position s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _x_position
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _x_position (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _y_position
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _y_position (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get ble_scanner::SimplePosition :md5sum-) "aab86a45c2e294c1cd32aeeb0e43f193")
(setf (get ble_scanner::SimplePosition :datatype-) "ble_scanner/SimplePosition")
(setf (get ble_scanner::SimplePosition :definition-)
      "string x_position
string y_position

")



(provide :ble_scanner/SimplePosition "aab86a45c2e294c1cd32aeeb0e43f193")


