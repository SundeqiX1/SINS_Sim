clear all;
close all;%��������ռ�ͱ�����Ϣ
instrreset;%Disconnect and delete all instrument objects
s=serial('com4','baudrate',115200);fopen(s);%��ȡ�������ݣ�����������Ϊ115200������4;
a=[0 0 0];%������ٶȡ�/s
A=[0 0 0];%������ٶ�g
Fr=fread(s,29,'uint8');
sum1=sum(Fr(2:28));
p=bitand(sum1,255);
