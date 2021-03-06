function q = rv2q(rv)
%将旋转矢量转换为变换四元数.
%
% 样例: q = rv2q(rv)
% 输入: rv - 旋转矢量
% 输出: q - 对应的四元数, 例如
%             q = [ cos(|rv|/2); sin(|rv|/2)/|rv|*rv ]
% 
% 另见  q2rv, rv2m, m2rv, a2qua, rotv, qupdt.

% 参考资料：严恭敏教授，陕西西安，西北工业大学，PSIN工具箱程序及相关教材
% 修改：孙德奇，江苏徐州，中国矿业大学，矿山智能采掘装备实验室
% 第一版：2021年8月23日
    q = zeros(4,1);
    n2 = rv(1)*rv(1) + rv(2)*rv(2) + rv(3)*rv(3);
    if n2<1.0e-8  % cos(n/2)=1-n2/8+n4/384; sin(n/2)/n=1/2-n2/48+n4/3840
        q(1) = 1-n2*(1/8-n2/384); s = 1/2-n2*(1/48-n2/3840);
    else
        n = sqrt(n2); n_2 = n/2;
        q(1) = cos(n_2); s = sin(n_2)/n;
    end
    q(2) = s*rv(1); q(3) = s*rv(2); q(4) = s*rv(3);
