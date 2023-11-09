; Auto-generated. Do not edit!


(cl:in-package mdwa_planning-msg)


;//! \htmlinclude Barrier.msg.html

(cl:defclass <Barrier> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0))
)

(cl:defclass Barrier (<Barrier>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Barrier>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Barrier)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mdwa_planning-msg:<Barrier> is deprecated: use mdwa_planning-msg:Barrier instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Barrier>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mdwa_planning-msg:x-val is deprecated.  Use mdwa_planning-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Barrier>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mdwa_planning-msg:y-val is deprecated.  Use mdwa_planning-msg:y instead.")
  (y m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Barrier>) ostream)
  "Serializes a message object of type '<Barrier>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Barrier>) istream)
  "Deserializes a message object of type '<Barrier>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Barrier>)))
  "Returns string type for a message object of type '<Barrier>"
  "mdwa_planning/Barrier")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Barrier)))
  "Returns string type for a message object of type 'Barrier"
  "mdwa_planning/Barrier")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Barrier>)))
  "Returns md5sum for a message object of type '<Barrier>"
  "209f516d3eb691f0663e25cb750d67c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Barrier)))
  "Returns md5sum for a message object of type 'Barrier"
  "209f516d3eb691f0663e25cb750d67c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Barrier>)))
  "Returns full string definition for message of type '<Barrier>"
  (cl:format cl:nil "float64 x~%float64 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Barrier)))
  "Returns full string definition for message of type 'Barrier"
  (cl:format cl:nil "float64 x~%float64 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Barrier>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Barrier>))
  "Converts a ROS message object to a list"
  (cl:list 'Barrier
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
))
