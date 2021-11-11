function [sys,x0,str,ts] = Data_conversion(t,x,u,flag)
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
sizes.NumInputs      = 29;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t1,x,u)  
%ax
i1=0;j1=1;k1=2;t1=1;jm1=0;ax_a=1;
ax=(00000000000000000000000000000000);
while i1<8
    i1=i1+1;
ax(j1)=mod(u(5),2);u(5)=fix(u(5)/2);
ax(j1+8)=mod(u(6),2);u(6)=fix(u(6)/2);
ax(j1+16)=mod(u(7),2);u(7)=fix(u(7)/2);
ax(j1+24)=mod(u(8),2);u(8)=fix(u(8)/2);
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
ay(j2)=mod(u(9),2);u(9)=fix(u(9)/2);
ay(j2+8)=mod(u(10),2);u(10)=fix(u(10)/2);
ay(j2+16)=mod(u(11),2);u(11)=fix(u(11)/2);
ay(j2+24)=mod(u(12),2);u(12)=fix(u(12)/2);
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
az(j3)=mod(u(13),2);u(13)=fix(u(13)/2);
az(j3+8)=mod(u(14),2);u(14)=fix(u(14)/2);
az(j3+16)=mod(u(15),2);u(15)=fix(u(15)/2);
az(j3+24)=mod(u(16),2);u(16)=fix(u(16)/2);
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
Ax(j4)=mod(u(17),2);u(17)=fix(u(17)/2);
Ax(j4+8)=mod(u(18),2);u(18)=fix(u(18)/2);
Ax(j4+16)=mod(u(19),2);u(19)=fix(u(19)/2);
Ax(j4+24)=mod(u(20),2);u(20)=fix(u(20)/2);
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
Ay(j5)=mod(u(21),2);u(21)=fix(u(21)/2);
Ay(j5+8)=mod(u(22),2);u(22)=fix(u(22)/2);
Ay(j5+16)=mod(u(23),2);u(23)=fix(u(23)/2);
Ay(j5+24)=mod(u(24),2);u(24)=fix(u(24)/2);
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
Az(j6)=mod(u(25),2);u(25)=fix(u(25)/2);
Az(j6+8)=mod(u(26),2);u(26)=fix(u(26)/2);
Az(j6+16)=mod(u(27),2);u(27)=fix(u(27)/2);
Az(j6+24)=mod(u(28),2);u(28)=fix(u(28)/2);
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
sys(1)=ax_a;
sys(2)=ay_a;
sys(3)=az_a;
sys(4)=Ax_a;
sys(5)=Ay_a;
sys(6)=Az_a;

%Êä³ö


