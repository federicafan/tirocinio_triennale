function valminimo=km_min2(x,I,z,m,g);
Km=x(1);
zcomp=x(2);

Fmric=Km*(I.^2)./((z-zcomp).^2);
valminimo=sum(((m*g)-Fmric).^2);
return