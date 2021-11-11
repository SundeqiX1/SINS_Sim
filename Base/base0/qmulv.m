% 输入: q - 变换四元数
%         vi - 要转换的向量
% 输出: vo - 输出向量，使得 vo = q*vi*共轭(q)
% 另见  q2mat, qconj, qmul.
function [sys,x0,str,ts] = qmulv(t,x,u,flag)
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
sizes.NumInputs      = 7;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t1,x,u)  
q=u(1:4);
vi=u(5:7);
    qo1 =              - q(2) * vi(1) - q(3) * vi(2) - q(4) * vi(3);
    qo2 = q(1) * vi(1)                + q(3) * vi(3) - q(4) * vi(2);
    qo3 = q(1) * vi(2)                + q(4) * vi(1) - q(2) * vi(3);
    qo4 = q(1) * vi(3)                + q(2) * vi(2) - q(3) * vi(1);
    vo = vi;
    vo(1) = -qo1 * q(2) + qo2 * q(1) - qo3 * q(4) + qo4 * q(3);
    vo(2) = -qo1 * q(3) + qo3 * q(1) - qo4 * q(2) + qo2 * q(4);
    vo(3) = -qo1 * q(4) + qo4 * q(1) - qo2 * q(3) + qo3 * q(2);
sys(1)=vo(1);
sys(2)=vo(2);
sys(3)=vo(3);
