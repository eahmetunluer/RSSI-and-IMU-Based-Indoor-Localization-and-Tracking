;; Auto-generated. Do not edit!


(when (boundp 'ble_scanner::BLEBeacon)
  (if (not (find-package "BLE_SCANNER"))
    (make-package "BLE_SCANNER"))
  (shadow 'BLEBeacon (find-package "BLE_SCANNER")))
(unless (find-package "BLE_SCANNER::BLEBEACON")
  (make-package "BLE_SCANNER::BLEBEACON"))

(in-package "ROS")
;;//! \htmlinclude BLEBeacon.msg.html


(defclass ble_scanner::BLEBeacon
  :super ros::object
  :slots (_mac_address _rssi ))

(defmethod ble_scanner::BLEBeacon
  (:init
   (&key
    ((:mac_address __mac_address) "")
    ((:rssi __rssi) "")
    )
   (send-super :init)
   (setq _mac_address (string __mac_address))
   (setq _rssi (string __rssi))
   self)
  (:mac_address
   (&optional __mac_address)
   (if __mac_address (setq _mac_address __mac_address)) _mac_address)
  (:rssi
   (&optional __rssi)
   (if __rssi (setq _rssi __rssi)) _rssi)
  (:serialization-length
   ()
   (+
    ;; string _mac_address
    4 (length _mac_address)
    ;; string _rssi
    4 (length _rssi)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _mac_address
       (write-long (length _mac_address) s) (princ _mac_address s)
     ;; string _rssi
       (write-long (length _rssi) s) (princ _rssi s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _mac_address
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _mac_address (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _rssi
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _rssi (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get ble_scanner::BLEBeacon :md5sum-) "41e9b6b85696be601788ac9adc1e5c81")
(setf (get ble_scanner::BLEBeacon :datatype-) "ble_scanner/BLEBeacon")
(setf (get ble_scanner::BLEBeacon :definition-)
      "string mac_address # MAC address of an access point
string rssi         # signal strength [RSSI]

")



(provide :ble_scanner/BLEBeacon "41e9b6b85696be601788ac9adc1e5c81")


