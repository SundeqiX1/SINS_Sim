function eth = earth(pos, vn)
% �����������صĲ�����
%
% ����: eth = earth(pos, vn)
% ����: pos - ����λ��[γ�ȣ����ȣ��߶�]
%         vn - �ٶ�
% ���: eth - ��������ṹ��
%
% ���  ethinit, ethupdate, insupdate, trjsimu, etm.

% �ο����ϣ��Ϲ������ڣ�����������������ҵ��ѧ��PSIN�����������ؽ̲�
% �޸ģ�����棬�������ݣ��й���ҵ��ѧ����ɽ���ܲɾ�װ��ʵ����
% ��һ�棺2021��8��24��
global glv
    if nargin==1,  vn = [0; 0; 0];  end
    eth = glv.eth; 
    eth.pos = pos;  eth.vn = vn;
    eth.sl = sin(pos(1)); %sinL
    eth.cl = cos(pos(1)); %cosL 
    eth.tl = eth.sl/eth.cl; %tanL 
    eth.sl2 = eth.sl*eth.sl;  sl4 = eth.sl2*eth.sl2; %(sinL)^2;(sin2L)^2
    sq = 1-glv.e2*eth.sl2;  sq2 = sqrt(sq);
    eth.RMh = glv.Re*(1-glv.e2)/sq/sq2+pos(3); %����Ȧ�����ʰ뾶+���и߶� 
    eth.RNh = glv.Re/sq2+pos(3); %î��Ȧ�����ʰ뾶+���и߶�
    eth.clRNh = eth.cl*eth.RNh;
    eth.wnie = [0; glv.wie*eth.cl; glv.wie*eth.sl];%������ת���ٶ���������ֵx y z
    vE_RNh = vn(1)/eth.RNh;
    eth.wnen = [-vn(2)/eth.RMh; vE_RNh; vE_RNh*eth.tl];%�����˶��Ľ��ٶȷ������趨����+������-����
   %eth.wnen=[vn(2)/eth.RMh;-vn(1)/eth.RNh;-vn(1)/eth.RNh*eth.tl]; %��Ϊ��+������Ϊ��-��
    eth.wnin = eth.wnie + eth.wnen; %������Թ���ϵ�Ľ��ٶ�
    eth.wnien = eth.wnie + eth.wnin;  %�ɱ��������Ƶ��Ĺ�ʽ��2wie+wen
    eth.g = glv.g0*(1+5.27094e-3*eth.sl2+2.32718e-5*sl4)-3.086e-6*pos(3); % grs80
    eth.gn = [0;0;-eth.g];%ע�ⷽ��ֱ����Ϊ��-��
%   eth.gcc = eth.gn - cros(eth.wnien,vn); %��������/������/������ 
    eth.gcc =  [ eth.wnien(3)*vn(2)-eth.wnien(2)*vn(3);  % ����һ�и���
                 eth.wnien(1)*vn(3)-eth.wnien(3)*vn(1);
                 eth.wnien(2)*vn(1)-eth.wnien(1)*vn(2)+eth.gn(3) ];
    