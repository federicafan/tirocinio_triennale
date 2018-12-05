function valminimo=min_tau(y,t,h,g)
tau=y;
x=g*tau*(t-(1-exp(-t/tau))*tau);
valminimo=sum((x-h).^2);
return