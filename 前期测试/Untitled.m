clear all;
close all;
instrreset;
disp('Press Ctrl+C to stop collecting data!')
s=serial('com4','baudrate',115200);fopen(s);
a=fread(s,28,'uint8');
hex=dec2hex(a);
h5=hex([5 33]);
h6=hex([6 34]);
h7=hex([5 35]);
h8=hex([5 36]);
H=[h5 h6 h7 h8]
ax=typecast(fliplr(uint8(H)),'single')
fclose(s);