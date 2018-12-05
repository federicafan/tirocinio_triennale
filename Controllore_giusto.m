clear variables
close all
clc

format long

s=tf('s');
Ts=1e-3;
G_p=load('transfer_function');
G1=G_p.G;
ZOH=1/(1+s*Ts*0.5);
G_ZOH=G1*ZOH;

%Steady-state
Kc=4.12;
Css=-Kc/s;
Lss=Css*G_ZOH;
figure(); bode(Lss), grid on;

%Transient
Tp=mag2db(1.38);
Sp=mag2db(1.65);
wc_des=90;
figure(); nichols(Lss,'k'); hold on; t_grid(Tp); s_grid(Sp);
%return
%Real negative zero
wn1=6;
wz=wc_des/wn1;
Cz=(1+s/wz)^2;
C0=Css*Cz;
L1=C0*G_ZOH;
hold on; nichols(L1,'b');
%Closure poles
wp1=500;
Cp1=1/(1+s/wp1);
C0=C0*Cp1;
L2=C0*G_ZOH;
hold on; nichols(L2,'g');
wp2=1800;
Cp2=1/(1+s/wp2);
C0=C0*Cp2;
L3=C0*G_ZOH;
hold on; nichols(L3,'c');

%Discretizzazione
Cd=c2d(C0,Ts,'tustin') %dà uno zero in più: se utilizzo matched l'overshoot viene molto più alto

%Simulazione-modello lineare
Simulazione_lineare;
%Simulazione-seconda approssimazione
Simulazione_seconda_approssimazione;