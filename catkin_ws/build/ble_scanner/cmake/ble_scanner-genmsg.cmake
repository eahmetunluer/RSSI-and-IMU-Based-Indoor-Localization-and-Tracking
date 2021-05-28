# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "ble_scanner: 3 messages, 0 services")

set(MSG_I_FLAGS "-Ible_scanner:/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(ble_scanner_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEBeacon.msg" NAME_WE)
add_custom_target(_ble_scanner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ble_scanner" "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEBeacon.msg" ""
)

get_filename_component(_filename "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEData.msg" NAME_WE)
add_custom_target(_ble_scanner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ble_scanner" "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEData.msg" "ble_scanner/BLEBeacon:std_msgs/Header"
)

get_filename_component(_filename "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/SimplePosition.msg" NAME_WE)
add_custom_target(_ble_scanner_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "ble_scanner" "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/SimplePosition.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(ble_scanner
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEBeacon.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ble_scanner
)
_generate_msg_cpp(ble_scanner
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEData.msg"
  "${MSG_I_FLAGS}"
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEBeacon.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ble_scanner
)
_generate_msg_cpp(ble_scanner
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/SimplePosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ble_scanner
)

### Generating Services

### Generating Module File
_generate_module_cpp(ble_scanner
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ble_scanner
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(ble_scanner_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(ble_scanner_generate_messages ble_scanner_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEBeacon.msg" NAME_WE)
add_dependencies(ble_scanner_generate_messages_cpp _ble_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEData.msg" NAME_WE)
add_dependencies(ble_scanner_generate_messages_cpp _ble_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/SimplePosition.msg" NAME_WE)
add_dependencies(ble_scanner_generate_messages_cpp _ble_scanner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ble_scanner_gencpp)
add_dependencies(ble_scanner_gencpp ble_scanner_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ble_scanner_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(ble_scanner
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEBeacon.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ble_scanner
)
_generate_msg_eus(ble_scanner
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEData.msg"
  "${MSG_I_FLAGS}"
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEBeacon.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ble_scanner
)
_generate_msg_eus(ble_scanner
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/SimplePosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ble_scanner
)

### Generating Services

### Generating Module File
_generate_module_eus(ble_scanner
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ble_scanner
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(ble_scanner_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(ble_scanner_generate_messages ble_scanner_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEBeacon.msg" NAME_WE)
add_dependencies(ble_scanner_generate_messages_eus _ble_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEData.msg" NAME_WE)
add_dependencies(ble_scanner_generate_messages_eus _ble_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/SimplePosition.msg" NAME_WE)
add_dependencies(ble_scanner_generate_messages_eus _ble_scanner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ble_scanner_geneus)
add_dependencies(ble_scanner_geneus ble_scanner_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ble_scanner_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(ble_scanner
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEBeacon.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ble_scanner
)
_generate_msg_lisp(ble_scanner
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEData.msg"
  "${MSG_I_FLAGS}"
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEBeacon.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ble_scanner
)
_generate_msg_lisp(ble_scanner
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/SimplePosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ble_scanner
)

### Generating Services

### Generating Module File
_generate_module_lisp(ble_scanner
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ble_scanner
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(ble_scanner_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(ble_scanner_generate_messages ble_scanner_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEBeacon.msg" NAME_WE)
add_dependencies(ble_scanner_generate_messages_lisp _ble_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEData.msg" NAME_WE)
add_dependencies(ble_scanner_generate_messages_lisp _ble_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/SimplePosition.msg" NAME_WE)
add_dependencies(ble_scanner_generate_messages_lisp _ble_scanner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ble_scanner_genlisp)
add_dependencies(ble_scanner_genlisp ble_scanner_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ble_scanner_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(ble_scanner
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEBeacon.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ble_scanner
)
_generate_msg_nodejs(ble_scanner
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEData.msg"
  "${MSG_I_FLAGS}"
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEBeacon.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ble_scanner
)
_generate_msg_nodejs(ble_scanner
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/SimplePosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ble_scanner
)

### Generating Services

### Generating Module File
_generate_module_nodejs(ble_scanner
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ble_scanner
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(ble_scanner_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(ble_scanner_generate_messages ble_scanner_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEBeacon.msg" NAME_WE)
add_dependencies(ble_scanner_generate_messages_nodejs _ble_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEData.msg" NAME_WE)
add_dependencies(ble_scanner_generate_messages_nodejs _ble_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/SimplePosition.msg" NAME_WE)
add_dependencies(ble_scanner_generate_messages_nodejs _ble_scanner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ble_scanner_gennodejs)
add_dependencies(ble_scanner_gennodejs ble_scanner_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ble_scanner_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(ble_scanner
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEBeacon.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ble_scanner
)
_generate_msg_py(ble_scanner
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEData.msg"
  "${MSG_I_FLAGS}"
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEBeacon.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ble_scanner
)
_generate_msg_py(ble_scanner
  "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/SimplePosition.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ble_scanner
)

### Generating Services

### Generating Module File
_generate_module_py(ble_scanner
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ble_scanner
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(ble_scanner_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(ble_scanner_generate_messages ble_scanner_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEBeacon.msg" NAME_WE)
add_dependencies(ble_scanner_generate_messages_py _ble_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEData.msg" NAME_WE)
add_dependencies(ble_scanner_generate_messages_py _ble_scanner_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/SimplePosition.msg" NAME_WE)
add_dependencies(ble_scanner_generate_messages_py _ble_scanner_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(ble_scanner_genpy)
add_dependencies(ble_scanner_genpy ble_scanner_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS ble_scanner_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ble_scanner)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/ble_scanner
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(ble_scanner_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ble_scanner)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/ble_scanner
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(ble_scanner_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ble_scanner)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/ble_scanner
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(ble_scanner_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ble_scanner)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/ble_scanner
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(ble_scanner_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ble_scanner)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ble_scanner\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/ble_scanner
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(ble_scanner_generate_messages_py std_msgs_generate_messages_py)
endif()
