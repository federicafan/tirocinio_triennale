%%Transient, tracking error, control input
r_s=1;
rho=1;
rho_ramp=0;
t_stop=0.4;
min_step=1e-5;
max_step=1e-4;
sim('Levitatore_lin');
figure();
plot(r.time,r.data,'r','Linewidth',1.5);
hold on;
plot(y.time,y.data,'b','Linewidth',1.5);
title('Step response'); xlabel('Time (s)'); ylabel ('r(t),y(t)'); legend('r(t)','y(t)'); grid on;
figure();
plot(u.time,u.data,'r','Linewidth',1.5); title('Control input'); xlabel('Time (s)'); ylabel('u(t)'); grid on;
figure();
plot(e.time,e.data,'r','Linewidth',1.5); hold on; plot(e.time,e.data,'bo','Linewidth',1.5); title('Tracking error with step reference'); xlabel('Time (s)'); ylabel('e(t)'); grid on;
legend('e(t)','e_s(t)');
%%Ramp Response
r_s=-1;
rho=0;
rho_ramp=1;
sim('Levitatore_lin');
figure();
plot(r.time,r.data,'r','Linewidth',1.5);
hold on;
plot(y.time,y.data,'b','Linewidth',1.5);
title('Ramp response'); xlabel('Time (s)'); ylabel('r(t),y(t)'); legend('r(t)','y(t)','Location','best'); grid on;