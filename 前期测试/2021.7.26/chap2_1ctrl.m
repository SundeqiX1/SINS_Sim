function [sys,x0,str,ts] = chap2_1ctrl(t,x,u,flag)
switch flag
case 0
    [sys,x0,str,ts]=mdlInitializeSizes;
case 3
    sys=mdlOutputs(t,x,u);
case {2,4,9}
    sys=[];
otherwise
    error(['Unhandled flag = ',num2str(flag)]);
end
function [sys,x0,str,ts]=mdlInitializeSizes
sizes = simsizes;
sizes.NumContStates  = 0;
sizes.NumDiscStates  = 0;
sizes.NumOutputs     = 6;
sizes.NumInputs      = 0;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t1,x,u)
clear all;
close all;
instrreset;
s=serial('com4','baudrate',115200); fopen(s);
       
Head = fread(s,29,'uint8');
if (Head(1)==uint8(119))%判断数据帧头是否为77
        sum1=sum(Head(2:28));
        p=bitand(sum1,255);
        if (p==Head(29))%判断校验位是否正常
        %坐标变换
        Fr=Head;
%ax
i1=0;j1=1;k1=2;t1=1;jm1=0;ax_a=1;
ax=(00000000000000000000000000000000);
while i1<8
    i1=i1+1;
ax(j1)=mod(Fr(5),2);Fr(5)=fix(Fr(5)/2);
ax(j1+8)=mod(Fr(6),2);Fr(6)=fix(Fr(6)/2);
ax(j1+16)=mod(Fr(7),2);Fr(7)=fix(Fr(7)/2);
ax(j1+24)=mod(Fr(8),2);Fr(8)=fix(Fr(8)/2);
j1=j1+1;
end
ax=fliplr(ax);
while k1<10
 jm1=jm1+ax(k1)*power(2,9-k1) ;
 k1=k1+1;
end
jm1=jm1-127;
bx(1)=1;bx(2:24)=ax(10:32);
while t1<24
    ax_a=ax_a+bx(t1+1)/power(2,t1);
    t1=t1+1;
end
ax_a=ax_a*power(2,jm1);
if ax(1)==1
    ax_a=-1*ax_a;
end
%ay
i2=0;j2=1;k2=2;t2=1;jm2=0;ay_a=1;
ay=(00000000000000000000000000000000);
while i2<8
    i2=i2+1;
ay(j2)=mod(Fr(9),2);Fr(9)=fix(Fr(9)/2);
ay(j2+8)=mod(Fr(10),2);Fr(10)=fix(Fr(10)/2);
ay(j2+16)=mod(Fr(11),2);Fr(11)=fix(Fr(11)/2);
ay(j2+24)=mod(Fr(12),2);Fr(12)=fix(Fr(12)/2);
j2=j2+1;
end
ay=fliplr(ay);
while k2<10
 jm2=jm2+ay(k2)*power(2,9-k2) ;
 k2=k2+1;
end
jm2=jm2-127;
by(1)=1;by(2:24)=ay(10:32);
while t2<24
    ay_a=ay_a+by(t2+1)/power(2,t2);
    t2=t2+1;
end
ay_a=ay_a*power(2,jm2);
if ay(1)==1
    ay_a=-1*ay_a;
end
%az
i3=0;j3=1;k3=2;t3=1;jm3=0;az_a=1;
az=(00000000000000000000000000000000);
while i3<8
    i3=i3+1;
az(j3)=mod(Fr(13),2);Fr(13)=fix(Fr(13)/2);
az(j3+8)=mod(Fr(14),2);Fr(14)=fix(Fr(14)/2);
az(j3+16)=mod(Fr(15),2);Fr(15)=fix(Fr(15)/2);
az(j3+24)=mod(Fr(16),2);Fr(16)=fix(Fr(16)/2);
j3=j3+1;
end
az=fliplr(az);
while k3<10
 jm3=jm3+az(k3)*power(2,9-k3) ;
 k3=k3+1;
end
jm3=jm3-127;
bz(1)=1;bz(2:24)=az(10:32);
while t3<24
    az_a=az_a+bz(t3+1)/power(2,t3);
    t3=t3+1;
end
az_a=az_a*power(2,jm3);
if az(1)==1
    az_a=-1*az_a;
end
%Ax
i4=0;j4=1;k4=2;t4=1;jm4=0;Ax_a=1;
Ax=(00000000000000000000000000000000);
while i4<8
    i4=i4+1;
Ax(j4)=mod(Fr(17),2);Fr(17)=fix(Fr(17)/2);
Ax(j4+8)=mod(Fr(18),2);Fr(18)=fix(Fr(18)/2);
Ax(j4+16)=mod(Fr(19),2);Fr(19)=fix(Fr(19)/2);
Ax(j4+24)=mod(Fr(20),2);Fr(20)=fix(Fr(20)/2);
j4=j4+1;
end
Ax=fliplr(Ax);
while k4<10
 jm4=jm4+Ax(k4)*power(2,9-k4) ;
 k4=k4+1;
end
jm4=jm4-127;
bx(1)=1;bx(2:24)=Ax(10:32);
while t4<24
    Ax_a=Ax_a+bx(t4+1)/power(2,t4);
    t4=t4+1;
end
Ax_a=Ax_a*power(2,jm4);
if Ax(1)==1
    Ax_a=-1*Ax_a;
end
%Ay
i5=0;j5=1;k5=2;t5=1;jm5=0;Ay_a=1;
Ay=(00000000000000000000000000000000);
while i5<8
    i5=i5+1;
Ay(j5)=mod(Fr(21),2);Fr(21)=fix(Fr(21)/2);
Ay(j5+8)=mod(Fr(22),2);Fr(22)=fix(Fr(22)/2);
Ay(j5+16)=mod(Fr(23),2);Fr(23)=fix(Fr(23)/2);
Ay(j5+24)=mod(Fr(24),2);Fr(24)=fix(Fr(24)/2);
j5=j5+1;
end
Ay=fliplr(Ay);
while k5<10
 jm5=jm5+Ay(k5)*power(2,9-k5) ;
 k5=k5+1;
end
jm5=jm5-127;
by(1)=1;by(2:24)=Ay(10:32);
while t5<24
    Ay_a=Ay_a+by(t5+1)/power(2,t5);
    t5=t5+1;
end
Ay_a=Ay_a*power(2,jm5);
if ay(1)==1
    Ay_a=-1*Ay_a;
end
%Az
i6=0;j6=1;k6=2;t6=1;jm6=0;Az_a=1;
Az=(00000000000000000000000000000000);
while i6<8
    i6=i6+1;
Az(j6)=mod(Fr(25),2);Fr(25)=fix(Fr(25)/2);
Az(j6+8)=mod(Fr(26),2);Fr(26)=fix(Fr(26)/2);
Az(j6+16)=mod(Fr(27),2);Fr(27)=fix(Fr(27)/2);
Az(j6+24)=mod(Fr(28),2);Fr(28)=fix(Fr(28)/2);
j6=j6+1;
end
Az=fliplr(Az);
while k6<10
 jm6=jm6+Az(k6)*power(2,9-k6) ;
 k6=k6+1;
end
jm6=jm6-127;
bz(1)=1;bz(2:24)=Az(10:32);
while t6<24
    Az_a=Az_a+bz(t6+1)/power(2,t6);
    t6=t6+1;
end
Az_a=Az_a*power(2,jm6);
if Az(1)==1
    Az_a=-1*Az_a;
end
else
             fclose(s);
             close all;
             instrreset;
             s=serial('com4','baudrate',115200);
             fopen(s);
        end
        end    
sys(1)=ax_a;
sys(2)=ay_a;
sys(3)=az_a;
sys(4)=Ax_a;
sys(5)=Ay_a;
sys(6)=Az_a;
%输出


