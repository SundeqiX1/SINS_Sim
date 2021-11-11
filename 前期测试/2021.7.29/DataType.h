#ifndef _Q_DATA_TYPE_H_
#define _Q_DATA_TYPE_H_

//signed
typedef signed char        int8;
typedef short              int16;
typedef int                int32;
typedef long long          int64;
//unsigned
typedef unsigned char      uint8;
typedef unsigned short     uint16;
typedef unsigned int       uint32;
typedef unsigned long long uint64;



typedef union //
{
    char           buf[16];//���ڽ���
    double         number[2];//���ڴ���
}Un_sendData;

#endif