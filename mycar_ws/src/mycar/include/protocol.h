#ifndef _SERIAL_H_
#define _SERIAL_H_
#include <ros/ros.h>
#include <ros/time.h>
#include <geometry_msgs/TransformStamped.h>
#include <tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>
#include <boost/asio.hpp>
#include <geometry_msgs/Twist.h>
#include "std_msgs/String.h"//use data struct of std_msgs/String  
#include "std_msgs/Float32.h" 
#include "turtlesim/Pose.h"  
#include "protocol.h"
#include <vector>

#define  HEAD_H_W            0xAA
#define  HEAD_H_R            0xAB
#define  HEAD_L              0x01
#define  HW_ADDR             0x30
#define  Board_Type          0x0101
#define  UART_SPEED_CONTROL  0x11000001


 
void serialInit();
void writeSpeed(double Left_v, double Right_v,uint32_t cmd);
bool readSpeed(double &Left_v,double &Right_v,double &Angle,unsigned char &ctrlFlag);
uint16_t Cal_CRC(const uint8_t *ptr, uint32_t length);
bool Check_CRC(uint8_t data_h, uint8_t data_l, uint8_t *getBuf, uint16_t len);
 
void odom_pub_calcu(void);
double sin_cal(double theta);

#endif