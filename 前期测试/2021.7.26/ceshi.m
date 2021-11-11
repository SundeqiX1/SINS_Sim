Fr(4)=156;Fr(5)=37;Fr(6)=158;Fr(7)=188;
i=0;j=1;k=2;t=1;jm=0;ax_a=1;
ax=(00000000000000000000000000000000);
while i<8
    i=i+1;
ax(j)=mod(Fr(4),2);Fr(4)=fix(Fr(4)/2);
ax(j+8)=mod(Fr(5),2);Fr(5)=fix(Fr(5)/2);
ax(j+16)=mod(Fr(6),2);Fr(6)=fix(Fr(6)/2);
ax(j+24)=mod(Fr(7),2);Fr(7)=fix(Fr(7)/2);
j=j+1;
end
ax=fliplr(ax);
while k<10
 jm=jm+ax(k)*power(2,9-k) ;
 k=k+1;
end
jm=jm-127;
bx(1)=1;bx(2:24)=ax(10:32);
while t<24
    ax_a=ax_a+bx(t+1)/power(2,t);
    t=t+1;
end
ax_a=ax_a*power(2,jm);
if ax(1)==1
    ax_a=-1*ax_a;
end
