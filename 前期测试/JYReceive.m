clear all;
close all;
instrreset;
disp('Press Ctrl+C to stop collecting data!')
s=serial('com5','baudrate',115200) ;fopen(s) ;%Open Com Port   �뽫COM19���ɵ���ʶ�𵽵�COM�ڣ�������115000���ɴ�������Ӧ�Ĳ�����
a=fread(s,28,'int16');
fclose(s);