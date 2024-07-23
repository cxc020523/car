#include "ros/ros.h"  
#include <geometry_msgs/Twist.h>
#include <tf/transform_broadcaster.h>
#include <nav_msgs/Odometry.h>
#include <string>        
#include <iostream>
#include <cstdio>
#include <unistd.h>
#include <math.h>
#include "protocol.h"
#include <fcntl.h>
#include <stdio.h>   
#include <string.h>
#include "mycar/speed.h"

using namespace std;

/********************   底盘参数   *********************************/
float D = 0.18;    // 轮间距
float linear_temp = 9, angular_temp = 9;
float reductionSpeedRatio = 26.666; // 减速比

/********************   速度参数   *********************************/

float left_speed = 0, right_speed = 0, left_speed_temp, right_speed_temp;
unsigned char control_flag=0x07;


double left_speed_now=0.0;
double right_speed_now=0.0;
double angle=0.0;
double last_angle=0.0;
unsigned char testRece4=0x00;


void callback(const geometry_msgs::Twist& cmd_input)
{
	cout << "linear_temp: " << linear_temp << "    " << "angular_temp: " << angular_temp << endl;

	linear_temp = cmd_input.linear.x;
	angular_temp = cmd_input.angular.z;
	
	cout << "linear_temp: " << linear_temp << "    " << "angular_temp: " << angular_temp << endl;
		
	left_speed = (linear_temp - 0.5f * angular_temp * D) * 1000; //mm/s
	right_speed = (linear_temp + 0.5f * angular_temp * D) * 1000; //mm/s
	
	//left_speed_temp = left_speed * reductionSpeedRatio ; //r/min
	//right_speed_temp = right_speed * reductionSpeedRatio ;

    writeSpeed(left_speed, right_speed, UART_SPEED_CONTROL);
}

int main(int argc, char** argv)
{
	ros::init(argc, argv, "base_controller");
	ros::NodeHandle n;  

	ros::Subscriber sub = n.subscribe("cmd_vel", 20, callback); 
	ros::NodeHandle nh;  
    ros::Publisher pub = nh.advertise<mycar::speed>("/car_state",10);  
	
	mycar::speed p;


    ros::Rate loop_rate(50);
    ros::Time current_time, last_time;

    current_time = ros::Time::now();

    last_time = ros::Time::now();
    
    serialInit();
    ROS_INFO("we start\n");
    while(ros::ok())
    {
        ros::spinOnce();
        current_time = ros::Time::now();
		
	    readSpeed(left_speed_now,right_speed_now,angle,testRece4);
		
        double dt = (current_time - last_time).toSec();
       
		p.vx=0.5*0.225*(right_speed_now+left_speed_now)/60;
		
		p.w=((angle-last_angle)*0.01745329/88)/dt;
		pub.publish(p);
		last_angle=angle;
		last_time =current_time ;
        
		ROS_INFO("we receive 1 %f,%f,%f,%f\n",p.vx,p.w,angle,dt);
	    ROS_INFO("we receive 2 %f,%f,%f,%d\n",left_speed_now,right_speed_now,angle,testRece4);
 
        loop_rate.sleep();
    }
    return 0;
}

