%名 称：Matlab串口-Lab1
%描 述：串口读，并写入txt文件里
s=serial('com3');
s.BytesAvailableFcnMode='byte';  % 串口设置
s.InputBufferSize=9600;
s.OutputBufferSize=1024;
s.BytesAvailableFcnCount=100;
s.ReadAsyncMode='continuous';
s.Terminator='CR';
fopen(s);                  %打开串口
out=fread(s,10,'uint8');   %一次读出10个字符  
fprintf('%3c',out);        %一个字符占三位输出,%c字符，%d整型
fid=fopen('serial_data.txt','w+'); % 'a+'读写方式打开，将文件指针指向文件末尾。
fprintf(fid,'%3c',out);            % 写入文件里        
fclose(fid);

fclose(s);
delete(s);