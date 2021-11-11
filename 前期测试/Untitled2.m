clear all;
close all;%清除工作空间和变量信息
instrreset;%Disconnect and delete all instrument objects
s=serial('com4','baudrate',115200);fopen(s);%读取串口数据，波特率设置为115200，串口4;
a=[0 0 0];%三轴角速度°/s
A=[0 0 0];%三轴加速度g
Fr=fread(s,29,'uint8');
sum1=sum(Fr(2:28));
p=bitand(sum1,255);
