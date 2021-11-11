% 输入: att - att=[pitch; roll; yaw] 以弧度为单位
% 输出: Cnb - 从导航坐标系(n)到载体坐标系(b)的方向余弦矩阵,以航向角-俯仰角-横滚角
%                (3-1-2)轮换顺序
%       Cnbr - 以航向角-横滚角-俯仰角 (3-2-1) 轮换顺序的方向余弦矩阵
% 另见 a2qua, m2att, m2qua, q2att, q2mat, attsyn, rv2m.
function [sys,x0,str,ts] = a2mat(t,x,u,flag)
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
sizes.NumOutputs     = 9;
sizes.NumInputs      = 3;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t1,x,u)  
att=u;
s = sin(att); c = cos(att);
    si = s(1); sj = s(2); sk = s(3); 
    ci = c(1); cj = c(2); ck = c(3);
    Cnb = [ cj*ck-si*sj*sk, -ci*sk,  sj*ck+si*cj*sk;
            cj*sk+si*sj*ck,  ci*ck,  sj*sk-si*cj*ck;
           -ci*sj,           si,     ci*cj           ];
sys(1)=Cnb(1);
sys(2)=Cnb(2);
sys(3)=Cnb(3);
sys(4)=Cnb(4);
sys(5)=Cnb(5);
sys(6)=Cnb(6);
sys(7)=Cnb(7);
sys(8)=Cnb(8);
sys(9)=Cnb(9);

    