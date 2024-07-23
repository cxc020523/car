# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mycar: 1 messages, 0 services")

set(MSG_I_FLAGS "-Imycar:/home/cxc/car/mycar_ws/src/mycar/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mycar_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/cxc/car/mycar_ws/src/mycar/msg/speed.msg" NAME_WE)
add_custom_target(_mycar_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mycar" "/home/cxc/car/mycar_ws/src/mycar/msg/speed.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(mycar
  "/home/cxc/car/mycar_ws/src/mycar/msg/speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mycar
)

### Generating Services

### Generating Module File
_generate_module_cpp(mycar
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mycar
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mycar_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mycar_generate_messages mycar_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cxc/car/mycar_ws/src/mycar/msg/speed.msg" NAME_WE)
add_dependencies(mycar_generate_messages_cpp _mycar_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mycar_gencpp)
add_dependencies(mycar_gencpp mycar_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mycar_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(mycar
  "/home/cxc/car/mycar_ws/src/mycar/msg/speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mycar
)

### Generating Services

### Generating Module File
_generate_module_eus(mycar
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mycar
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(mycar_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(mycar_generate_messages mycar_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cxc/car/mycar_ws/src/mycar/msg/speed.msg" NAME_WE)
add_dependencies(mycar_generate_messages_eus _mycar_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mycar_geneus)
add_dependencies(mycar_geneus mycar_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mycar_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(mycar
  "/home/cxc/car/mycar_ws/src/mycar/msg/speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mycar
)

### Generating Services

### Generating Module File
_generate_module_lisp(mycar
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mycar
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(mycar_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(mycar_generate_messages mycar_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cxc/car/mycar_ws/src/mycar/msg/speed.msg" NAME_WE)
add_dependencies(mycar_generate_messages_lisp _mycar_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mycar_genlisp)
add_dependencies(mycar_genlisp mycar_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mycar_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(mycar
  "/home/cxc/car/mycar_ws/src/mycar/msg/speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mycar
)

### Generating Services

### Generating Module File
_generate_module_nodejs(mycar
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mycar
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(mycar_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(mycar_generate_messages mycar_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cxc/car/mycar_ws/src/mycar/msg/speed.msg" NAME_WE)
add_dependencies(mycar_generate_messages_nodejs _mycar_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mycar_gennodejs)
add_dependencies(mycar_gennodejs mycar_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mycar_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(mycar
  "/home/cxc/car/mycar_ws/src/mycar/msg/speed.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mycar
)

### Generating Services

### Generating Module File
_generate_module_py(mycar
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mycar
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mycar_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mycar_generate_messages mycar_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/cxc/car/mycar_ws/src/mycar/msg/speed.msg" NAME_WE)
add_dependencies(mycar_generate_messages_py _mycar_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mycar_genpy)
add_dependencies(mycar_genpy mycar_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mycar_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mycar)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mycar
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(mycar_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mycar)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/mycar
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(mycar_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mycar)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mycar
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(mycar_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mycar)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/mycar
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(mycar_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mycar)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mycar\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mycar
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(mycar_generate_messages_py std_msgs_generate_messages_py)
endif()
