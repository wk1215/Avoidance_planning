;; Auto-generated. Do not edit!


(when (boundp 'mdwa_planning::threat_points)
  (if (not (find-package "MDWA_PLANNING"))
    (make-package "MDWA_PLANNING"))
  (shadow 'threat_points (find-package "MDWA_PLANNING")))
(unless (find-package "MDWA_PLANNING::THREAT_POINTS")
  (make-package "MDWA_PLANNING::THREAT_POINTS"))

(in-package "ROS")
;;//! \htmlinclude threat_points.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass mdwa_planning::threat_points
  :super ros::object
  :slots (_impact_points _impact_times ))

(defmethod mdwa_planning::threat_points
  (:init
   (&key
    ((:impact_points __impact_points) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Point :init) r)) r))
    ((:impact_times __impact_times) 0.0)
    )
   (send-super :init)
   (setq _impact_points __impact_points)
   (setq _impact_times (float __impact_times))
   self)
  (:impact_points
   (&rest __impact_points)
   (if (keywordp (car __impact_points))
       (send* _impact_points __impact_points)
     (progn
       (if __impact_points (setq _impact_points (car __impact_points)))
       _impact_points)))
  (:impact_times
   (&optional __impact_times)
   (if __impact_times (setq _impact_times __impact_times)) _impact_times)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point[] _impact_points
    (apply #'+ (send-all _impact_points :serialization-length)) 4
    ;; float32 _impact_times
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point[] _impact_points
     (write-long (length _impact_points) s)
     (dolist (elem _impact_points)
       (send elem :serialize s)
       )
     ;; float32 _impact_times
       (sys::poke _impact_times (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point[] _impact_points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _impact_points (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _impact_points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; float32 _impact_times
     (setq _impact_times (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mdwa_planning::threat_points :md5sum-) "3d5e7da5fa6baa9aa54f04458b40de75")
(setf (get mdwa_planning::threat_points :datatype-) "mdwa_planning/threat_points")
(setf (get mdwa_planning::threat_points :definition-)
      "geometry_msgs/Point[] impact_points
float32 impact_times
================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :mdwa_planning/threat_points "3d5e7da5fa6baa9aa54f04458b40de75")


