function qpb = qaddphi(qnb, phi)
%从精确的四元数和失准角度获得计算的四元数。
%可以表示为“qpb=qnb+phi”，其中qnb是精确的四元数，phi是失准角。
%
% 样例: qpb = qaddphi(qnb, phi)
% 输入: qnb - 从载体坐标系到理想导航坐标系的姿态四元数
%         phi - 从实际导航坐标系到理想导航坐标系的失准角
%              
% 输出: qpb - 从载体坐标系到实际导航坐标系的E姿态四元数
%
% 另见 qdelphi, qq2phi, qaddafa, qdelafa, qq2afa, aaddmu.

% 参考资料：严恭敏教授，陕西西安，西北工业大学，PSIN工具箱程序及相关教材
% 修改：孙德奇，江苏徐州，中国矿业大学，矿山智能采掘装备实验室
% 第一版：2021年8月24日
    qpb = qmul(rv2q(-phi),qnb);
