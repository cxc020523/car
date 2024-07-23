;; Auto-generated. Do not edit!


(when (boundp 'mycar::speed)
  (if (not (find-package "MYCAR"))
    (make-package "MYCAR"))
  (shadow 'speed (find-package "MYCAR")))
(unless (find-package "MYCAR::SPEED")
  (make-package "MYCAR::SPEED"))

(in-package "ROS")
;;//! \htmlinclude speed.msg.html


(defclass mycar::speed
  :super ros::object
  :slots (_vx _vy _w ))

(defmethod mycar::speed
  (:init
   (&key
    ((:vx __vx) 0.0)
    ((:vy __vy) 0.0)
    ((:w __w) 0.0)
    )
   (send-super :init)
   (setq _vx (float __vx))
   (setq _vy (float __vy))
   (setq _w (float __w))
   self)
  (:vx
   (&optional __vx)
   (if __vx (setq _vx __vx)) _vx)
  (:vy
   (&optional __vy)
   (if __vy (setq _vy __vy)) _vy)
  (:w
   (&optional __w)
   (if __w (setq _w __w)) _w)
  (:serialization-length
   ()
   (+
    ;; float32 _vx
    4
    ;; float32 _vy
    4
    ;; float32 _w
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _vx
       (sys::poke _vx (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _vy
       (sys::poke _vy (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _w
       (sys::poke _w (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _vx
     (setq _vx (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _vy
     (setq _vy (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _w
     (setq _w (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mycar::speed :md5sum-) "f3691ef5f5de1a108d3f9cc106129c39")
(setf (get mycar::speed :datatype-) "mycar/speed")
(setf (get mycar::speed :definition-)
      "float32 vx
float32 vy
float32 w

")



(provide :mycar/speed "f3691ef5f5de1a108d3f9cc106129c39")


