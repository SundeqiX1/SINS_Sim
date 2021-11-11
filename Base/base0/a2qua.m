% 输入: att - att=[pitch; roll; yaw] 以弧度为单位
% 输出: qnb - 姿态四元数
% 另见  a2qua1, a2mat, m2att, m2qua, q2att, q2mat, attsyn, rv2q.
function [sys,x0,str,ts] = a2qua(t,x,u,flag)
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
sizes.NumInputs      = 3;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t1,x,u)  
att=u;
att2 = att/2;
    s = sin(att2); c = cos(att2);
    sp = s(1); sr = s(2); sy = s(3); 
    cp = c(1); cr = c(2); cy = c(3); 
    qnb = [ cp*cr*cy - sp*sr*sy;
            sp*cr*cy - cp*sr*sy;
            cp*sr*cy + sp*cr*sy;
            cp*cr*sy + sp*sr*cy ];
sys(1)=qnb(1);
sys(2)=qnb(2);
sys(3)=qnb(3);
sys(4)=qnb(4);


    
    