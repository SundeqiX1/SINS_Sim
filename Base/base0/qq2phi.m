function phi = qq2phi(qpb, qnb)
% 计算qpb和qnb之间的失准角。
% 可以表示为 as 'phi = qpb - qnb', qpb 是计算四元数，qnb是精确四元数 
%
% 样例: phi = qq2phi(qpb, qnb)
% 输入: qpb - 从载体坐标系到计算导航坐标系的姿态四元数
%         qnb - 从载体坐标系到理想导航坐标系的姿态四元数
% 输出: phi - 从理想导航坐标系到实际导航坐标系的失准角
%              Cnp = I + (phiX)
%
% 另见  qaddphi, qdelphi, aa2phi, qaddafa, qdelafa, qq2afa, qq2rv.

% 参考资料：严恭敏教授，陕西西安，西北工业大学，PSIN工具箱程序及相关教材
% 修改：孙德奇，江苏徐州，中国矿业大学，矿山智能采掘装备实验室
% 第一版：2021年8月24日

    dQ = qmul(qnb, qconj(qpb));
    phi = q2rv(dQ);
