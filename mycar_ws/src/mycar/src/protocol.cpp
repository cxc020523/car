
#include "protocol.h"
 
using namespace std;
using namespace boost::asio;

boost::asio::io_service iosev;

boost::asio::serial_port sp(iosev, "/dev/ttyUSB0");
boost::system::error_code err;

union sendData
{
	short speed;
	unsigned char data_speed[2];
}leftVelSet,rightVelSet;
 

union receiveData
{
	short d;
	unsigned char data[2];
}leftVelNow,rightVelNow,angleNow;
 

const uint16_t crc_table[16]=
{
  //CRC-16
  0x0000,0x1021,0x2042,0x3063,0x4084,0x50A5,0x60C6,0x70E7,
  0x8108,0x9129,0xA14A,0xB16B,0xC18C,0xD1AD,0xE1CE,0xF1EF
};

uint16_t Cal_CRC(const uint8_t *ptr, uint32_t length)
{
  static uint16_t crc;
  static uint8_t dat;

  crc=0xffff;
  if(length > 0)
  {
    while(length--)
    {
      dat=((uint8_t)(crc >> 12));
      crc <<= 4;
      crc ^= crc_table[dat ^ ((*ptr) >> 4)];

      dat=((uint8_t)(crc >> 12));
      crc <<= 4;
      crc ^= crc_table[dat ^ (*ptr & 0x0f)];
      ptr++;
    }
  }
  return crc;
}

bool Check_CRC(uint8_t data_h, uint8_t data_l, uint8_t *getBuf, uint16_t len)
{
  uint16_t checkCrc;
  checkCrc = (uint16_t)data_h << 8;
  checkCrc += data_l;
  uint16_t getCrc = Cal_CRC(getBuf, len);

  if(getCrc == checkCrc)
  {
    ROS_INFO("get checkdata %4x correctly!\n", getCrc);
    return true;
  }
  else  
    return false;
}

void serialInit()
{
  sp.set_option(serial_port::baud_rate(115200));
  sp.set_option(serial_port::flow_control(serial_port::flow_control::none));
  sp.set_option(serial_port::parity(serial_port::parity::none));
  sp.set_option(serial_port::stop_bits(serial_port::stop_bits::one));
  sp.set_option(serial_port::character_size(8));    
}
 

void writeSpeed(double Left_v, double Right_v,uint32_t cmd)
{
  unsigned char buf[128] = {0};

  leftVelSet.speed = Left_v;//mm/s
  rightVelSet.speed= Right_v;

  uint16_t length = 4;                 
  unsigned char speed[4];
  for(int i = 0; i < 2; i++)
  {
    speed[i] = leftVelSet.data_speed[i];
    speed[i+2] = rightVelSet.data_speed[i];
  }
  
  uint16_t bufLen = length + 0x0D;

  buf[0] = HEAD_H_W;
  buf[1] = HEAD_L;
  buf[2] = (uint8_t)(bufLen>>8);  // Len H
  buf[3] = (uint8_t)(bufLen);     // Len L
  buf[4] = HW_ADDR;     // Len L
  buf[5] = (uint8_t)((Board_Type>>8)&0x00FF);  // type id H
  buf[6] = (uint8_t)(Board_Type&0x00FF);  // type id L
  buf[7] = (uint8_t)((cmd>>24)&0x000000FF); // Cmd 3
  buf[8] = (uint8_t)((cmd>>16)&0x000000FF); // Cmd 2
  buf[9] = (uint8_t)((cmd>>8)&0x000000FF);  // Cmd 1
  buf[10] = (uint8_t)(cmd&0x000000FF);      // Cmd 0

  memcpy(buf+11, speed, length);

  buf[bufLen-2] = (uint8_t)((Cal_CRC(buf, bufLen-2)>>8)&0x00FF);
  buf[bufLen-1] = (uint8_t)(Cal_CRC(buf, bufLen-2)&0x00FF);    
  
  boost::asio::write(sp, boost::asio::buffer(buf));
}

bool readSpeed(double &Left_v,double &Right_v,double &Angle,unsigned char &ctrlFlag)
{
  unsigned char checkSum;
  unsigned char buf[1024]={0};
  boost::array<uint8_t, 15> receive_array;

  try
  {
    boost::asio::read(sp, boost::asio::buffer(receive_array));
  }  
  catch(boost::system::system_error &err)
  {
    ROS_INFO("read_until error");
  }   

  uint16_t length = receive_array.size();   
  
  for(int i = 0; i < length; i++)
  {
    buf[i] = receive_array[i];
  }

  if (buf[0]!= HEAD_H_R || buf[1] != HEAD_L)  
  {
    ROS_ERROR("Received message header error!");
    return false;
  }

  if(Check_CRC(buf[length - 2], buf[length - 1], buf, length))
  {
    ROS_ERROR("Received data check sum error!");
    return false;
  }
                            

  for(int i = 0; i < 2; i++)
  {
    leftVelNow.data[i]  = buf[i + 11]; 
    rightVelNow.data[i] = buf[i + 13]; 
    angleNow.data[i]    = buf[i + 15]; 
  }

  
  ctrlFlag = buf[9];
  
  Left_v  =-leftVelNow.d;
  Right_v =-rightVelNow.d;
  Angle   = angleNow.d;

  return true;
}

