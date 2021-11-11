%辅助函数--求位置增量
function dpos=deltapos(pos)   %delta为δ
    cl=cos(pos(:,1));   %抽取pos中的第1列
    Re=6378137;  
    % pos(1,1)代表第1行第1列的元数所在位置
    dpos=[[(pos(:,1)-pos(1,1)),(pos(:,2)-pos(1,2)).*cl]*Re,pos(:,3)-pos(1,3)];  
    %matlab中的矩阵点乘(.*)和乘法(*) 。矩阵点乘：要求矩阵的行和列是完全相等的两个矩阵，对应元素相乘

