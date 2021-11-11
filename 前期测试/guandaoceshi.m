clear all;
close all;%清除工作空间和变量信息
instrreset;%Disconnect and delete all instrument objects
s=serial('com4','baudrate',115200); fopen(s);%读取串口数据，波特率设置为115200，串口4;
a=[0 0 0];%三轴角速度°/s
A=[0 0 0];%三轴加速度g
%开始处理读取的数据
while (1)
        Head = fread(s,29,'uint8');
    if (Head(1)==uint8(119))%判断数据帧头是否为77
        sum1=sum(Head(2:28));
        p=bitand(sum1,255);
        if (p==Head(29))%判断校验位是否正常
        %坐标变换
Fr=Head;
hex=dec2hex(Fr);
ax=typecast(uint8([Fr(5) Fr(6) Fr(7) Fr(8)]),'single');
ay=typecast(uint8([Fr(9) Fr(10) Fr(11) Fr(12)]),'single');
az=typecast(uint8([Fr(13) Fr(14) Fr(15) Fr(16)]),'single');
Ax=typecast(uint8([Fr(17) Fr(18) Fr(19) Fr(20)]),'single');
Ay=typecast(uint8([Fr(21) Fr(22) Fr(23) Fr(24)]),'single');
Az=typecast(uint8([Fr(25) Fr(26) Fr(27) Fr(28)]),'single');
format long;ax;format long;ay;format long;az;format long;Ax;format long;Ay;format long;Az;
a=[a;ax ay az];
A=[A;Ax Ay Az];
        else
             fclose(s);
             close all;
             instrreset;
             s=serial('com4','baudrate',115200);
             fopen(s);
            continue
        end
        end    
end

