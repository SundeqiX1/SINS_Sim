function eth = earth(pos, vn)
% 计算与地球相关的参数。
%
% 样例: eth = earth(pos, vn)
% 输入: pos - 地理位置[纬度；经度；高度]
%         vn - 速度
% 输出: eth - 地球参数结构体
%
% 另见  ethinit, ethupdate, insupdate, trjsimu, etm.

% 参考资料：严恭敏教授，陕西西安，西北工业大学，PSIN工具箱程序及相关教材
% 修改：孙德奇，江苏徐州，中国矿业大学，矿山智能采掘装备实验室
% 第一版：2021年8月24日
global glv
    if nargin==1,  vn = [0; 0; 0];  end
    eth = glv.eth; 
    eth.pos = pos;  eth.vn = vn;
    eth.sl = sin(pos(1)); %sinL
    eth.cl = cos(pos(1)); %cosL 
    eth.tl = eth.sl/eth.cl; %tanL 
    eth.sl2 = eth.sl*eth.sl;  sl4 = eth.sl2*eth.sl2; %(sinL)^2;(sin2L)^2
    sq = 1-glv.e2*eth.sl2;  sq2 = sqrt(sq);
    eth.RMh = glv.Re*(1-glv.e2)/sq/sq2+pos(3); %子午圈主曲率半径+飞行高度 
    eth.RNh = glv.Re/sq2+pos(3); %卯酉圈主曲率半径+飞行高度
    eth.clRNh = eth.cl*eth.RNh;
    eth.wnie = [0; glv.wie*eth.cl; glv.wie*eth.sl];%地球自转角速度三个分量值x y z
    vE_RNh = vn(1)/eth.RNh;
    eth.wnen = [-vn(2)/eth.RMh; vE_RNh; vE_RNh*eth.tl];%载体运动的角速度分量，设定东“+”西“-”。
   %eth.wnen=[vn(2)/eth.RMh;-vn(1)/eth.RNh;-vn(1)/eth.RNh*eth.tl]; %西为“+”，东为“-”
    eth.wnin = eth.wnie + eth.wnen; %载体相对惯性系的角速度
    eth.wnien = eth.wnie + eth.wnin;  %由比力方程推导的公式，2wie+wen
    eth.g = glv.g0*(1+5.27094e-3*eth.sl2+2.32718e-5*sl4)-3.086e-6*pos(3); % grs80
    eth.gn = [0;0;-eth.g];%注意方向垂直向下为“-”
%   eth.gcc = eth.gn - cros(eth.wnien,vn); %考虑重力/哥氏力/向心力 
    eth.gcc =  [ eth.wnien(3)*vn(2)-eth.wnien(2)*vn(3);  % 比上一行更快
                 eth.wnien(1)*vn(3)-eth.wnien(3)*vn(1);
                 eth.wnien(2)*vn(1)-eth.wnien(1)*vn(2)+eth.gn(3) ];
    