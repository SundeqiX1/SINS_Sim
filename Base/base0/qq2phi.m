function phi = qq2phi(qpb, qnb)
% ����qpb��qnb֮���ʧ׼�ǡ�
% ���Ա�ʾΪ as 'phi = qpb - qnb', qpb �Ǽ�����Ԫ����qnb�Ǿ�ȷ��Ԫ�� 
%
% ����: phi = qq2phi(qpb, qnb)
% ����: qpb - ����������ϵ�����㵼������ϵ����̬��Ԫ��
%         qnb - ����������ϵ�����뵼������ϵ����̬��Ԫ��
% ���: phi - �����뵼������ϵ��ʵ�ʵ�������ϵ��ʧ׼��
%              Cnp = I + (phiX)
%
% ���  qaddphi, qdelphi, aa2phi, qaddafa, qdelafa, qq2afa, qq2rv.

% �ο����ϣ��Ϲ������ڣ�����������������ҵ��ѧ��PSIN�����������ؽ̲�
% �޸ģ�����棬�������ݣ��й���ҵ��ѧ����ɽ���ܲɾ�װ��ʵ����
% ��һ�棺2021��8��24��

    dQ = qmul(qnb, qconj(qpb));
    phi = q2rv(dQ);
