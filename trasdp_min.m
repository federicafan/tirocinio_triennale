function valminimo=trasdp_min(x,Vz,z,z0);

c=(Vz(1)+Vz(end))/2;
h=Vz(1)-c;
beta=(h/c)^4-1;
zp=x(1);
b=abs(beta^(1/4)*(z0-zp));
Vzric=h*(z-zp)./((z-zp).^4+b^4).^(1/4)+c;

valminimo=sum((Vzric-Vz).^2);
return