function qnb = qdelphi(qpb, phi)
%�Ӽ���õ�����Ԫ����ʧ׼�ǶȻ�þ�ȷ����Ԫ����
%���Ա�ʾΪ��qnb = qpb - phi��������qpb�Ǽ������Ԫ����phi��ʧ׼�ǡ�
%
% ����: qnb = qdelphi(qpb, phi)
% ����: qpb - ����������ϵ�����㵼������ϵ����̬��Ԫ��
%         phi - �Ӽ��㵼������ϵ�����뵼������ϵ��ʧ׼��
% ���: qnb - ����������ϵ�����뵼������ϵ����̬��Ԫ��
%
% ���� qaddphi, qq2phi, qaddafa, qdelafa, qq2afa.

% �ο����ϣ��Ϲ������ڣ�����������������ҵ��ѧ��PSIN�����������ؽ̲�
% �޸ģ�����棬�������ݣ��й���ҵ��ѧ����ɽ���ܲɾ�װ��ʵ����
% ��һ�棺2021��8��24��
    qnb = qmul(rv2q(phi), qpb);