
(cl:in-package :asdf)

(defsystem "mdwa_planning-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "threat_points" :depends-on ("_package_threat_points"))
    (:file "_package_threat_points" :depends-on ("_package"))
  ))