; Auto-generated. Do not edit!


(cl:in-package mdwa_planning-msg)


;//! \htmlinclude threat_points.msg.html

(cl:defclass <threat_points> (roslisp-msg-protocol:ros-message)
  ((impact_points
    :reader impact_points
    :initarg :impact_points
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point)))
   (impact_times
    :reader impact_times
    :initarg :impact_times
    :type cl:float
    :initform 0.0))
)

(cl:defclass threat_points (<threat_points>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <threat_points>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'threat_points)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mdwa_planning-msg:<threat_points> is deprecated: use mdwa_planning-msg:threat_points instead.")))

(cl:ensure-generic-function 'impact_points-val :lambda-list '(m))
(cl:defmethod impact_points-val ((m <threat_points>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mdwa_planning-msg:impact_points-val is deprecated.  Use mdwa_planning-msg:impact_points instead.")
  (impact_points m))

(cl:ensure-generic-function 'impact_times-val :lambda-list '(m))
(cl:defmethod impact_times-val ((m <threat_points>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mdwa_planning-msg:impact_times-val is deprecated.  Use mdwa_planning-msg:impact_times instead.")
  (impact_times m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <threat_points>) ostream)
  "Serializes a message object of type '<threat_points>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'impact_points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'impact_points))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'impact_times))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <threat_points>) istream)
  "Deserializes a message object of type '<threat_points>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'impact_points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'impact_points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'impact_times) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<threat_points>)))
  "Returns string type for a message object of type '<threat_points>"
  "mdwa_planning/threat_points")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'threat_points)))
  "Returns string type for a message object of type 'threat_points"
  "mdwa_planning/threat_points")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<threat_points>)))
  "Returns md5sum for a message object of type '<threat_points>"
  "3d5e7da5fa6baa9aa54f04458b40de75")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'threat_points)))
  "Returns md5sum for a message object of type 'threat_points"
  "3d5e7da5fa6baa9aa54f04458b40de75")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<threat_points>)))
  "Returns full string definition for message of type '<threat_points>"
  (cl:format cl:nil "geometry_msgs/Point[] impact_points~%float32 impact_times~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'threat_points)))
  "Returns full string definition for message of type 'threat_points"
  (cl:format cl:nil "geometry_msgs/Point[] impact_points~%float32 impact_times~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <threat_points>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'impact_points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <threat_points>))
  "Converts a ROS message object to a list"
  (cl:list 'threat_points
    (cl:cons ':impact_points (impact_points msg))
    (cl:cons ':impact_times (impact_times msg))
))
