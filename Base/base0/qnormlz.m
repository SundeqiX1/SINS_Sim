function qnb = qnormlz(qnb)
% 四元数归一化, ||qnb||=1.
%
% 样例: qnb = qnormlz(qnb)
% 输入: qnb - 范数可能不是 1 的输入四元数
% 输出: qnb - 范数等于 1 的输入四元数
%
% 另见  vnormlz, mnormlz.

% 参考资料：严恭敏教授，陕西西安，西北工业大学，PSIN工具箱程序及相关教材
% 修改：孙德奇，江苏徐州，中国矿业大学，矿山智能采掘装备实验室
% 第一版：2021年8月24日

nm=qnb'*qnb; %共轭转置求模值
if nm<1e-6, qnb=[1;0;0;0]; %表示姿态的四元数，其模值应约为1
else
    qnb=qnb/sqrt(nm);
end