clear all;
close all;
instrreset;
s=serial('com4','baudrate',115200);fopen(s);
t=0;
cnt=0;
a=[0 0 0];
A=[0 0 0];
tt=0;
while (1)
    Head = fread(s,29,'uint8');
    if (Head(1)~=uint8(119))
        continue;
    end
    tic;
    Fr=fread(s,29,'uint8');
hex=dec2hex(Fr);
h5=Fr([5]);h6=Fr([6]);h7=Fr([7]);h8=Fr([8]);
h9=Fr([9]);h10=Fr([10]);h11=Fr([11]);h12=Fr([12]);
h13=Fr([13]);h14=Fr([14]);h15=Fr([15]);h16=Fr([16]);
h17=Fr([17]);h18=Fr([18]);h19=Fr([19]);h20=Fr([20]);
h21=Fr([21]);h22=Fr([22]);h23=Fr([23]);h24=Fr([24]);
h25=Fr([25]);h26=Fr([26]);h27=Fr([27]);h28=Fr([28]);
ax=typecast(uint8(([h5 h6 h7 h8])),'single');
ay=typecast(uint8(([h9 h10 h11 h12])),'single');
az=typecast(uint8(([h13 h14 h15 h16])),'single');
Ax=typecast(uint8(([h17 h18 h19 h20])),'single');
Ay=typecast(uint8(([h21 h22 h23 h24])),'single');
Az=typecast(uint8(([h25 h26 h27 h28])),'single');
format long;ax;format long;ay;format long;az;format long;Ax;format long;Ay;format long;Az;
a=[a;ax ay az];
A=[A;Ax Ay Az];
t=t+toc;
tt=[tt;t];
end
fclose(s);
