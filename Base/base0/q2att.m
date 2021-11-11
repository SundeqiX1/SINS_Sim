%function att = q2att(qnb)

% 样例: att = q2att(qnb)
% 输入: qnb - 姿态四元数
% 输出: att - 欧拉角 att=[pitch; roll; yaw] 弧度制
% 另见  a2mat, a2qua, m2att, m2qua, q2mat, q2att1, attsyn, q2rv, incline.
function [sys,x0,str,ts] = q2att(t,x,u,flag)
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
sizes.NumInputs      = 4;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t1,x,u)
qnb=u;
    q11 = qnb(1)*qnb(1); q12 = qnb(1)*qnb(2); q13 = qnb(1)*qnb(3); q14 = qnb(1)*qnb(4); 
    q22 = qnb(2)*qnb(2); q23 = qnb(2)*qnb(3); q24 = qnb(2)*qnb(4);     
    q33 = qnb(3)*qnb(3); q34 = qnb(3)*qnb(4);  
    q44 = qnb(4)*qnb(4);
    C12=2*(q23-q14);
    C22=q11-q22+q33-q44;
    C31=2*(q24-q13); C32=2*(q34+q12); C33=q11-q22-q33+q44;
    att = [ asin(C32); 
            atan2(-C31,C33); 
            atan2(-C12,C22) ];
sys(1)=att(1);
sys(2)=att(2);
sys(3)=att(3);
    