# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mdwa_planning: 4 messages, 0 services")

set(MSG_I_FLAGS "-Imdwa_planning:/home/wk/planning_ros/src/mdwa_planning/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/melodic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mdwa_planning_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/Dy_Barrier.msg" NAME_WE)
add_custom_target(_mdwa_planning_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mdwa_planning" "/home/wk/planning_ros/src/mdwa_planning/msg/Dy_Barrier.msg" ""
)

get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/Environment.msg" NAME_WE)
add_custom_target(_mdwa_planning_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mdwa_planning" "/home/wk/planning_ros/src/mdwa_planning/msg/Environment.msg" "mdwa_planning/Dy_Barrier:mdwa_planning/Barrier"
)

get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/threat_points.msg" NAME_WE)
add_custom_target(_mdwa_planning_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mdwa_planning" "/home/wk/planning_ros/src/mdwa_planning/msg/threat_points.msg" "geometry_msgs/Point"
)

get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/Barrier.msg" NAME_WE)
add_custom_target(_mdwa_planning_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mdwa_planning" "/home/wk/planning_ros/src/mdwa_planning/msg/Barrier.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/Dy_Barrier.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mdwa_planning
)
_generate_msg_cpp(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/Environment.msg"
  "${MSG_I_FLAGS}"
  "/home/wk/planning_ros/src/mdwa_planning/msg/Dy_Barrier.msg;/home/wk/planning_ros/src/mdwa_planning/msg/Barrier.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mdwa_planning
)
_generate_msg_cpp(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/threat_points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mdwa_planning
)
_generate_msg_cpp(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/Barrier.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mdwa_planning
)

### Generating Services

### Generating Module File
_generate_module_cpp(mdwa_planning
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mdwa_planning
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mdwa_planning_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mdwa_planning_generate_messages mdwa_planning_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/Dy_Barrier.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_cpp _mdwa_planning_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/Environment.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_cpp _mdwa_planning_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/threat_points.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_cpp _mdwa_planning_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/Barrier.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_cpp _mdwa_planning_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mdwa_planning_gencpp)
add_dependencies(mdwa_planning_gencpp mdwa_planning_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mdwa_planning_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/Dy_Barrier.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mdwa_planning
)
_generate_msg_eus(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/Environment.msg"
  "${MSG_I_FLAGS}"
  "/home/wk/planning_ros/src/mdwa_planning/msg/Dy_Barrier.msg;/home/wk/planning_ros/src/mdwa_planning/msg/Barrier.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mdwa_planning
)
_generate_msg_eus(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/threat_points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mdwa_planning
)
_generate_msg_eus(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/Barrier.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mdwa_planning
)

### Generating Services

### Generating Module File
_generate_module_eus(mdwa_planning
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mdwa_planning
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(mdwa_planning_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(mdwa_planning_generate_messages mdwa_planning_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/Dy_Barrier.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_eus _mdwa_planning_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/Environment.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_eus _mdwa_planning_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/threat_points.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_eus _mdwa_planning_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/Barrier.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_eus _mdwa_planning_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mdwa_planning_geneus)
add_dependencies(mdwa_planning_geneus mdwa_planning_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mdwa_planning_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/Dy_Barrier.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mdwa_planning
)
_generate_msg_lisp(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/Environment.msg"
  "${MSG_I_FLAGS}"
  "/home/wk/planning_ros/src/mdwa_planning/msg/Dy_Barrier.msg;/home/wk/planning_ros/src/mdwa_planning/msg/Barrier.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mdwa_planning
)
_generate_msg_lisp(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/threat_points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mdwa_planning
)
_generate_msg_lisp(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/Barrier.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mdwa_planning
)

### Generating Services

### Generating Module File
_generate_module_lisp(mdwa_planning
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mdwa_planning
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(mdwa_planning_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(mdwa_planning_generate_messages mdwa_planning_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/Dy_Barrier.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_lisp _mdwa_planning_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/Environment.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_lisp _mdwa_planning_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/threat_points.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_lisp _mdwa_planning_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/Barrier.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_lisp _mdwa_planning_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mdwa_planning_genlisp)
add_dependencies(mdwa_planning_genlisp mdwa_planning_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mdwa_planning_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/Dy_Barrier.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mdwa_planning
)
_generate_msg_nodejs(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/Environment.msg"
  "${MSG_I_FLAGS}"
  "/home/wk/planning_ros/src/mdwa_planning/msg/Dy_Barrier.msg;/home/wk/planning_ros/src/mdwa_planning/msg/Barrier.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mdwa_planning
)
_generate_msg_nodejs(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/threat_points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mdwa_planning
)
_generate_msg_nodejs(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/Barrier.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mdwa_planning
)

### Generating Services

### Generating Module File
_generate_module_nodejs(mdwa_planning
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mdwa_planning
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(mdwa_planning_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(mdwa_planning_generate_messages mdwa_planning_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/Dy_Barrier.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_nodejs _mdwa_planning_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/Environment.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_nodejs _mdwa_planning_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/threat_points.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_nodejs _mdwa_planning_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/Barrier.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_nodejs _mdwa_planning_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mdwa_planning_gennodejs)
add_dependencies(mdwa_planning_gennodejs mdwa_planning_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mdwa_planning_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/Dy_Barrier.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mdwa_planning
)
_generate_msg_py(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/Environment.msg"
  "${MSG_I_FLAGS}"
  "/home/wk/planning_ros/src/mdwa_planning/msg/Dy_Barrier.msg;/home/wk/planning_ros/src/mdwa_planning/msg/Barrier.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mdwa_planning
)
_generate_msg_py(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/threat_points.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/melodic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mdwa_planning
)
_generate_msg_py(mdwa_planning
  "/home/wk/planning_ros/src/mdwa_planning/msg/Barrier.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mdwa_planning
)

### Generating Services

### Generating Module File
_generate_module_py(mdwa_planning
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mdwa_planning
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mdwa_planning_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mdwa_planning_generate_messages mdwa_planning_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/Dy_Barrier.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_py _mdwa_planning_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/Environment.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_py _mdwa_planning_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/threat_points.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_py _mdwa_planning_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/wk/planning_ros/src/mdwa_planning/msg/Barrier.msg" NAME_WE)
add_dependencies(mdwa_planning_generate_messages_py _mdwa_planning_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mdwa_planning_genpy)
add_dependencies(mdwa_planning_genpy mdwa_planning_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mdwa_planning_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mdwa_planning)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mdwa_planning
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(mdwa_planning_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(mdwa_planning_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mdwa_planning)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mdwa_planning
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(mdwa_planning_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(mdwa_planning_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mdwa_planning)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mdwa_planning
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(mdwa_planning_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(mdwa_planning_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mdwa_planning)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mdwa_planning
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(mdwa_planning_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(mdwa_planning_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mdwa_planning)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mdwa_planning\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mdwa_planning
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(mdwa_planning_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(mdwa_planning_generate_messages_py geometry_msgs_generate_messages_py)
endif()
