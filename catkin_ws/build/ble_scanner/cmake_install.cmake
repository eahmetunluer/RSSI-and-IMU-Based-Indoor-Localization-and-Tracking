# Install script for directory: /home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ble_scanner/msg" TYPE FILE FILES
    "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEBeacon.msg"
    "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/BLEData.msg"
    "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/msg/SimplePosition.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ble_scanner/cmake" TYPE FILE FILES "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/build/ble_scanner/catkin_generated/installspace/ble_scanner-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/devel/include/ble_scanner")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/devel/share/roseus/ros/ble_scanner")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/devel/share/common-lisp/ros/ble_scanner")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/devel/share/gennodejs/ros/ble_scanner")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/devel/lib/python3/dist-packages/ble_scanner")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/devel/lib/python3/dist-packages/ble_scanner")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/build/ble_scanner/catkin_generated/installspace/ble_scanner.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ble_scanner/cmake" TYPE FILE FILES "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/build/ble_scanner/catkin_generated/installspace/ble_scanner-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ble_scanner/cmake" TYPE FILE FILES
    "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/build/ble_scanner/catkin_generated/installspace/ble_scannerConfig.cmake"
    "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/build/ble_scanner/catkin_generated/installspace/ble_scannerConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/ble_scanner" TYPE FILE FILES "/home/crownco/Museum-Audio-Guide-and-Visitor-Monitoring-System/catkin_ws/src/ble_scanner/package.xml")
endif()

