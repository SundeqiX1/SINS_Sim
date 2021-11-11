% ����: qi - ������Ԫ��
% ���: qo - �����Ԫ�� ,��� qi = [qi(1); qi(2:4)]
%              ��ô qo = [qi(1); -qi(2:4)]
% ��� qeye, qmul, qmulv.
function [sys,x0,str,ts] = qconj(t,x,u,flag)
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
sizes.NumInputs      = 4;
sizes.DirFeedthrough = 1;
sizes.NumSampleTimes = 0;
sys = simsizes(sizes);
x0  = [];
str = [];
ts  = [];
function sys=mdlOutputs(t1,x,u)  
sys(1)=u(1);
sys(2)=-u(2);
sys(3)=-u(3);
sys(4)=-u(4);
    
    