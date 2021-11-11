function [x,y,z]=geo2xyz(B,L,h)
    a=6378137;
    f=1/298.257224;
    b=a-a*f;
    e=sqrt(a^2-b^2)/a;
    N=a./(sqrt(1-e^2.*(sin(B)).^2));
    x=(N+h).*cos(B).*cos(L);
    y=(N+h).*cos(B).*sin(L);
    z=(N*(1-e^2)+h).*sin(B);
end

