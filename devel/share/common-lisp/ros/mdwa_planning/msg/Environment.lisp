; Auto-generated. Do not edit!


(cl:in-package mdwa_planning-msg)


;//! \htmlinclude Environment.msg.html

(cl:defclass <Environment> (roslisp-msg-protocol:ros-message)
  ((barrier
    :reader barrier
    :initarg :barrier
    :type (cl:vector mdwa_planning-msg:Barrier)
   :initform (cl:make-array 0 :element-type 'mdwa_planning-msg:Barrier :initial-element (cl:make-instance 'mdwa_planning-msg:Barrier)))
   (dy_obs
    :reader dy_obs
    :initarg :dy_obs
    :type (cl:vector mdwa_planning-msg:Dy_Barrier)
   :initform (cl:make-array 0 :element-type 'mdwa_planning-msg:Dy_Barrier :initial-element (cl:make-instance 'mdwa_planning-msg:Dy_Barrier)))
   (obs_size
    :reader obs_size
    :initarg :obs_size
    :type cl:float
    :initform 0.0))
)

(cl:defclass Environment (<Environment>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Environment>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Environment)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mdwa_planning-msg:<Environment> is deprecated: use mdwa_planning-msg:Environment instead.")))

(cl:ensure-generic-function 'barrier-val :lambda-list '(m))
(cl:defmethod barrier-val ((m <Environment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mdwa_planning-msg:barrier-val is deprecated.  Use mdwa_planning-msg:barrier instead.")
  (barrier m))

(cl:ensure-generic-function 'dy_obs-val :lambda-list '(m))
(cl:defmethod dy_obs-val ((m <Environment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mdwa_planning-msg:dy_obs-val is deprecated.  Use mdwa_planning-msg:dy_obs instead.")
  (dy_obs m))

(cl:ensure-generic-function 'obs_size-val :lambda-list '(m))
(cl:defmethod obs_size-val ((m <Environment>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mdwa_planning-msg:obs_size-val is deprecated.  Use mdwa_planning-msg:obs_size instead.")
  (obs_size m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Environment>) ostream)
  "Serializes a message object of type '<Environment>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'barrier))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'barrier))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'dy_obs))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'dy_obs))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'obs_size))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Environment>) istream)
  "Deserializes a message object of type '<Environment>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'barrier) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'barrier)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'mdwa_planning-msg:Barrier))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'dy_obs) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'dy_obs)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'mdwa_planning-msg:Dy_Barrier))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'obs_size) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Environment>)))
  "Returns string type for a message object of type '<Environment>"
  "mdwa_planning/Environment")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Environment)))
  "Returns string type for a message object of type 'Environment"
  "mdwa_planning/Environment")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Environment>)))
  "Returns md5sum for a message object of type '<Environment>"
  "366bf54a33961c132c7cb18ef82cb2bb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Environment)))
  "Returns md5sum for a message object of type 'Environment"
  "366bf54a33961c132c7cb18ef82cb2bb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Environment>)))
  "Returns full string definition for message of type '<Environment>"
  (cl:format cl:nil "mdwa_planning/Barrier[] barrier~%mdwa_planning/Dy_Barrier[] dy_obs~%float32 obs_size~%~%================================================================================~%MSG: mdwa_planning/Barrier~%float64 x~%float64 y~%~%================================================================================~%MSG: mdwa_planning/Dy_Barrier~%float64 x~%float64 y~%float64 vx~%float64 vy~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Environment)))
  "Returns full string definition for message of type 'Environment"
  (cl:format cl:nil "mdwa_planning/Barrier[] barrier~%mdwa_planning/Dy_Barrier[] dy_obs~%float32 obs_size~%~%================================================================================~%MSG: mdwa_planning/Barrier~%float64 x~%float64 y~%~%================================================================================~%MSG: mdwa_planning/Dy_Barrier~%float64 x~%float64 y~%float64 vx~%float64 vy~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Environment>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'barrier) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'dy_obs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Environment>))
  "Converts a ROS message object to a list"
  (cl:list 'Environment
    (cl:cons ':barrier (barrier msg))
    (cl:cons ':dy_obs (dy_obs msg))
    (cl:cons ':obs_size (obs_size msg))
))
