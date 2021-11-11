function [phim,dvbm]=cnscl(wm, vm)
% 多子样补偿算法，
% 在时间段T内进行N次采样，采样间隔为h=T/N,
% 每个采样间隔内的角增量称为子样
%
%样例: [phim,dvbm]=cnscl(wm, vm)
% 输入: wm - 角度增量
%       vm - 速度增量
% 输出: phim - 圆锥补偿后的旋转矢量
%       dvbm - 圆旋转和划船补偿后的速度增量     
%
% 另见  qaddphi, qdelphi, aa2phi, qaddafa, qdelafa, qq2afa, qq2rv.
% 参考资料：严恭敏教授，陕西西安，西北工业大学，PSIN工具箱程序及相关教材
% 修改：孙德奇，江苏徐州，中国矿业大学，矿山智能采掘装备实验室
% 第一版：2021年8月24日

cs=[ [2,  0,  0,  0,  0  ]/3
     [9,  27,  0,  0,  0  ]/20
     [54,  92,  214,  0,  0  ]/105
     [250,  525,  650,  1375,  0  ]/504
     [2315,  4558,  7296,  7834,  15797  ]/4620 ]; %2-6子样补偿系数  p2.6.2 （表2.6.2  2.6.3）
 wmm=sum(wm,1); vmm=sum(vm,1); %sum(A,1) 对 A 的列中的连续元素进行求和并返回一个包含每列之和的行向量。
 dphim=zeros(1,3);  %zeron（1,3）创建 由零组成的1*3向量。 （0,0,0）
 scullm=zeros(1,3);
 n=size(wm,1); %获取vm的行数,并赋值给n，为子样数 
 if n>1
     csw=cs(n-1,1:n-1)*wm(1:n-1,:); csv =cs(n-1, 1: n-1)*vm(1:n-1 ,:);
     dphim=cross(csw,wm(n,:));  %圆锥补偿量   %wm(n,:) 取第n行的所有元素
     scullm=cross(csw,vm(n,:))+cross(csv,wm(n,:)); %划船补偿量
 end
 phim =(wmm+dphim)';     
 dvbm =(vmm+0.5*cross(wmm,vmm)+scullm)';  