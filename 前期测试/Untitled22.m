clear all;
close all;%��������ռ�ͱ�����Ϣ
instrreset;%Disconnect and delete all instrument objects
s=serial('com4','baudrate',115200); fopen(s);%��ȡ�������ݣ�����������Ϊ115200������4;
%��ʼ�����ȡ������
zitaijiesuan(s)
