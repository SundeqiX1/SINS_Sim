function qnb = qdelphi(qpb, phi)
%从计算得到的四元数和失准角度获得精确的四元数。
%可以表示为“qnb = qpb - phi”，其中qpb是计算的四元数，phi是失准角。
%
% 样例: qnb = qdelphi(qpb, phi)
% 输入: qpb - 从载体坐标系到计算导航坐标系的姿态四元数
%         phi - 从计算导航坐标系到理想导航坐标系的失准角
% 输出: qnb - 从载体坐标系到理想导航坐标系的姿态四元数
%
% 另见 qaddphi, qq2phi, qaddafa, qdelafa, qq2afa.

% 参考资料：严恭敏教授，陕西西安，西北工业大学，PSIN工具箱程序及相关教材
% 修改：孙德奇，江苏徐州，中国矿业大学，矿山智能采掘装备实验室
% 第一版：2021年8月24日
    qnb = qmul(rv2q(phi), qpb);