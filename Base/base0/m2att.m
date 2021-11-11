% 输入: Cnb -从导航坐标系(n)到载体坐标系(b)的方向余弦矩阵
% 输出: att - att=[pitch; roll; yaw] ,以航向角-俯仰角-横滚角
%                (3-1-2)轮换顺序
%          attr - 以航向角-横滚角-俯仰角 (3-2-1) 轮换顺序

%另见  a2mat, a2qua, m2qua, q2att, q2mat, attsyn, m2rv, incline.
function [sys,x0,str,ts] = m2att(t,x,u,flag)
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
sizes.NumOutputs     = 3;
sizes.NumInputs      = 9;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t1,x,u)  
Cnb=[u(1),u(4),u(7);
    u(2),u(5),u(8);
    u(3),u(6),u(9)];
    att = [ asin(Cnb(3,2));
            atan2(-Cnb(3,1),Cnb(3,3)); 
            atan2(-Cnb(1,2),Cnb(2,2)) ];
sys(1)=att(1);
sys(2)=att(2);
sys(3)=att(3);

