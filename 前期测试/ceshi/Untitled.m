%�� �ƣ�Matlab����-Lab1
%�� �������ڶ�����д��txt�ļ���
s=serial('com3');
s.BytesAvailableFcnMode='byte';  % ��������
s.InputBufferSize=9600;
s.OutputBufferSize=1024;
s.BytesAvailableFcnCount=100;
s.ReadAsyncMode='continuous';
s.Terminator='CR';
fopen(s);                  %�򿪴���
out=fread(s,10,'uint8');   %һ�ζ���10���ַ�  
fprintf('%3c',out);        %һ���ַ�ռ��λ���,%c�ַ���%d����
fid=fopen('serial_data.txt','w+'); % 'a+'��д��ʽ�򿪣����ļ�ָ��ָ���ļ�ĩβ��
fprintf(fid,'%3c',out);            % д���ļ���        
fclose(fid);

fclose(s);
delete(s);