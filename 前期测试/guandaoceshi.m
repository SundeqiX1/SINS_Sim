clear all;
close all;%��������ռ�ͱ�����Ϣ
instrreset;%Disconnect and delete all instrument objects
s=serial('com4','baudrate',115200); fopen(s);%��ȡ�������ݣ�����������Ϊ115200������4;
a=[0 0 0];%������ٶȡ�/s
A=[0 0 0];%������ٶ�g
%��ʼ�����ȡ������
while (1)
        Head = fread(s,29,'uint8');
    if (Head(1)==uint8(119))%�ж�����֡ͷ�Ƿ�Ϊ77
        sum1=sum(Head(2:28));
        p=bitand(sum1,255);
        if (p==Head(29))%�ж�У��λ�Ƿ�����
        %����任
Fr=Head;
hex=dec2hex(Fr);
ax=typecast(uint8([Fr(5) Fr(6) Fr(7) Fr(8)]),'single');
ay=typecast(uint8([Fr(9) Fr(10) Fr(11) Fr(12)]),'single');
az=typecast(uint8([Fr(13) Fr(14) Fr(15) Fr(16)]),'single');
Ax=typecast(uint8([Fr(17) Fr(18) Fr(19) Fr(20)]),'single');
Ay=typecast(uint8([Fr(21) Fr(22) Fr(23) Fr(24)]),'single');
Az=typecast(uint8([Fr(25) Fr(26) Fr(27) Fr(28)]),'single');
format long;ax;format long;ay;format long;az;format long;Ax;format long;Ay;format long;Az;
a=[a;ax ay az];
A=[A;Ax Ay Az];
        else
             fclose(s);
             close all;
             instrreset;
             s=serial('com4','baudrate',115200);
             fopen(s);
            continue
        end
        end    
end

