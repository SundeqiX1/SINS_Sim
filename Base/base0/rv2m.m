function m = rv2m(rv)
% 将旋转矢量转换为变换矩阵。
%
% 样例: m = rv2m(rv)
% 输入: rv - 旋转矢量
% 输出: m - 对应的方向余弦矩阵,例如
%     m = I + sin(|rv|)/|rv|*(rvx) + [1-cos(|rv|)]/|rv|^2*(rvx)^2
%    其中rvx是rv的反对称阵
%    rvx=askew(rv);
% 另见  m2rv, rv2q, q2rv, a2mat, rotv.

% 参考资料：严恭敏教授，陕西西安，西北工业大学，PSIN工具箱程序及相关教材
% 修改：孙德奇，江苏徐州，中国矿业大学，矿山智能采掘装备实验室
% 第一版：2021年8月23日
   %%
	xx = rv(1)*rv(1); yy = rv(2)*rv(2); zz = rv(3)*rv(3);
	n2 = xx+yy+zz;  %求等效旋转矢量的模方
    if n2<1.e-8     %如果模方很小，则可用泰勒展开前几项求三角函数
        a = 1-n2*(1/6-n2/120); b = 0.5-n2*(1/24-n2/720);  % a->1, b->0.5
    else
        n = sqrt(n2);
        a = sin(n)/n;  b = (1-cos(n))/n2;
    end
    %%
    %如果调用已经写好的子函数可以这样编写：
    %rvx=askew(rv); %调用三维向量的反对称阵函数；
    % m = eye(3) + a*(rvx) + b*(rvx)^2; %eye(3)为3*3的单位矩阵I；
    %%
	arvx = a*rv(1);  arvy = a*rv(2);  arvz = a*rv(3);
	bxx = b*xx;  bxy = b*rv(1)*rv(2);  bxz = b*rv(1)*rv(3);
	byy = b*yy;  byz = b*rv(2)*rv(3);  bzz = b*zz;
	m = zeros(3,3);
	m(1)=1     -byy-bzz; m(4)= -arvz+bxy;     m(7)=  arvy+bxz;
	m(2)=  arvz+bxy;     m(5)=1     -bxx-bzz; m(8)= -arvx+byz;
	m(3)= -arvy+bxz;     m(6)=  arvx+byz;     m(9)=1     -bxx-byy;

