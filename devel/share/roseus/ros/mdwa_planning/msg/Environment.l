;; Auto-generated. Do not edit!


(when (boundp 'mdwa_planning::Environment)
  (if (not (find-package "MDWA_PLANNING"))
    (make-package "MDWA_PLANNING"))
  (shadow 'Environment (find-package "MDWA_PLANNING")))
(unless (find-package "MDWA_PLANNING::ENVIRONMENT")
  (make-package "MDWA_PLANNING::ENVIRONMENT"))

(in-package "ROS")
;;//! \htmlinclude Environment.msg.html


(defclass mdwa_planning::Environment
  :super ros::object
  :slots (_barrier _dy_obs _obs_size ))

(defmethod mdwa_planning::Environment
  (:init
   (&key
    ((:barrier __barrier) (let (r) (dotimes (i 0) (push (instance mdwa_planning::Barrier :init) r)) r))
    ((:dy_obs __dy_obs) (let (r) (dotimes (i 0) (push (instance mdwa_planning::Dy_Barrier :init) r)) r))
    ((:obs_size __obs_size) 0.0)
    )
   (send-super :init)
   (setq _barrier __barrier)
   (setq _dy_obs __dy_obs)
   (setq _obs_size (float __obs_size))
   self)
  (:barrier
   (&rest __barrier)
   (if (keywordp (car __barrier))
       (send* _barrier __barrier)
     (progn
       (if __barrier (setq _barrier (car __barrier)))
       _barrier)))
  (:dy_obs
   (&rest __dy_obs)
   (if (keywordp (car __dy_obs))
       (send* _dy_obs __dy_obs)
     (progn
       (if __dy_obs (setq _dy_obs (car __dy_obs)))
       _dy_obs)))
  (:obs_size
   (&optional __obs_size)
   (if __obs_size (setq _obs_size __obs_size)) _obs_size)
  (:serialization-length
   ()
   (+
    ;; mdwa_planning/Barrier[] _barrier
    (apply #'+ (send-all _barrier :serialization-length)) 4
    ;; mdwa_planning/Dy_Barrier[] _dy_obs
    (apply #'+ (send-all _dy_obs :serialization-length)) 4
    ;; float32 _obs_size
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; mdwa_planning/Barrier[] _barrier
     (write-long (length _barrier) s)
     (dolist (elem _barrier)
       (send elem :serialize s)
       )
     ;; mdwa_planning/Dy_Barrier[] _dy_obs
     (write-long (length _dy_obs) s)
     (dolist (elem _dy_obs)
       (send elem :serialize s)
       )
     ;; float32 _obs_size
       (sys::poke _obs_size (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; mdwa_planning/Barrier[] _barrier
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _barrier (let (r) (dotimes (i n) (push (instance mdwa_planning::Barrier :init) r)) r))
     (dolist (elem- _barrier)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; mdwa_planning/Dy_Barrier[] _dy_obs
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _dy_obs (let (r) (dotimes (i n) (push (instance mdwa_planning::Dy_Barrier :init) r)) r))
     (dolist (elem- _dy_obs)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; float32 _obs_size
     (setq _obs_size (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get mdwa_planning::Environment :md5sum-) "366bf54a33961c132c7cb18ef82cb2bb")
(setf (get mdwa_planning::Environment :datatype-) "mdwa_planning/Environment")
(setf (get mdwa_planning::Environment :definition-)
      "mdwa_planning/Barrier[] barrier
mdwa_planning/Dy_Barrier[] dy_obs
float32 obs_size

================================================================================
MSG: mdwa_planning/Barrier
float64 x
float64 y

================================================================================
MSG: mdwa_planning/Dy_Barrier
float64 x
float64 y
float64 vx
float64 vy

")



(provide :mdwa_planning/Environment "366bf54a33961c132c7cb18ef82cb2bb")


