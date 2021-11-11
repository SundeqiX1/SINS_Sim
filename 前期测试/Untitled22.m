clear all;
close all;%清除工作空间和变量信息
instrreset;%Disconnect and delete all instrument objects
s=serial('com4','baudrate',115200); fopen(s);%读取串口数据，波特率设置为115200，串口4;
%开始处理读取的数据
zitaijiesuan(s)
