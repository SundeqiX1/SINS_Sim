function m = rv2m(rv)
% ����תʸ��ת��Ϊ�任����
%
% ����: m = rv2m(rv)
% ����: rv - ��תʸ��
% ���: m - ��Ӧ�ķ������Ҿ���,����
%     m = I + sin(|rv|)/|rv|*(rvx) + [1-cos(|rv|)]/|rv|^2*(rvx)^2
%    ����rvx��rv�ķ��Գ���
%    rvx=askew(rv);
% ���  m2rv, rv2q, q2rv, a2mat, rotv.

% �ο����ϣ��Ϲ������ڣ�����������������ҵ��ѧ��PSIN�����������ؽ̲�
% �޸ģ�����棬�������ݣ��й���ҵ��ѧ����ɽ���ܲɾ�װ��ʵ����
% ��һ�棺2021��8��23��
   %%
	xx = rv(1)*rv(1); yy = rv(2)*rv(2); zz = rv(3)*rv(3);
	n2 = xx+yy+zz;  %���Ч��תʸ����ģ��
    if n2<1.e-8     %���ģ����С�������̩��չ��ǰ���������Ǻ���
        a = 1-n2*(1/6-n2/120); b = 0.5-n2*(1/24-n2/720);  % a->1, b->0.5
    else
        n = sqrt(n2);
        a = sin(n)/n;  b = (1-cos(n))/n2;
    end
    %%
    %��������Ѿ�д�õ��Ӻ�������������д��
    %rvx=askew(rv); %������ά�����ķ��Գ�������
    % m = eye(3) + a*(rvx) + b*(rvx)^2; %eye(3)Ϊ3*3�ĵ�λ����I��
    %%
	arvx = a*rv(1);  arvy = a*rv(2);  arvz = a*rv(3);
	bxx = b*xx;  bxy = b*rv(1)*rv(2);  bxz = b*rv(1)*rv(3);
	byy = b*yy;  byz = b*rv(2)*rv(3);  bzz = b*zz;
	m = zeros(3,3);
	m(1)=1     -byy-bzz; m(4)= -arvz+bxy;     m(7)=  arvy+bxz;
	m(2)=  arvz+bxy;     m(5)=1     -bxx-bzz; m(8)= -arvx+byz;
	m(3)= -arvy+bxz;     m(6)=  arvx+byz;     m(9)=1     -bxx-byy;

