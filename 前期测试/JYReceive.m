clear all;
close all;
instrreset;
disp('Press Ctrl+C to stop collecting data!')
s=serial('com5','baudrate',115200) ;fopen(s) ;%Open Com Port   请将COM19换成电脑识别到的COM口，波特率115000换成传感器对应的波特率
a=fread(s,28,'int16');
fclose(s);