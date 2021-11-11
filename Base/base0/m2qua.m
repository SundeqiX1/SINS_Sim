% 样例: qnb = m2qua(Cnb)
% 输入: Cnb - 从载体坐标系到导航坐标系的方向余弦矩阵
% 输出: qnb - 姿态四元数
% 另见  a2mat, a2qua, m2att, q2att, q2mat, attsyn, m2rv.
function [sys,x0,str,ts] = m2qua(t,x,u,flag)
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
sizes.NumOutputs     = 4;
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
    C11 = Cnb(1,1); C12 = Cnb(1,2); C13 = Cnb(1,3); 
    C21 = Cnb(2,1); C22 = Cnb(2,2); C23 = Cnb(2,3); 
    C31 = Cnb(3,1); C32 = Cnb(3,2); C33 = Cnb(3,3); 
    if C11>=C22+C33
        q1 = 0.5*sqrt(1+C11-C22-C33);  qq4 = 4*q1;
        q0 = (C32-C23)/qq4; q2 = (C12+C21)/qq4; q3 = (C13+C31)/qq4;
    elseif C22>=C11+C33
        q2 = 0.5*sqrt(1-C11+C22-C33);  qq4 = 4*q2;
        q0 = (C13-C31)/qq4; q1 = (C12+C21)/qq4; q3 = (C23+C32)/qq4;
    elseif C33>=C11+C22
        q3 = 0.5*sqrt(1-C11-C22+C33);  qq4 = 4*q3;
        q0 = (C21-C12)/qq4; q1 = (C13+C31)/qq4; q2 = (C23+C32)/qq4;
    else
        q0 = 0.5*sqrt(1+C11+C22+C33);  qq4 = 4*q0;
        q1 = (C32-C23)/qq4; q2 = (C13-C31)/qq4; q3 = (C21-C12)/qq4;
    end
    qnb = [q0; q1; q2; q3];
    sys(1)=qnb(1);
    sys(2)=qnb(2);
    sys(3)=qnb(3);
    sys(4)=qnb(4);
    
    

