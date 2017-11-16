function prob8
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spring mass damper solver
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



to = 0;
tf = 100;



[t,x] = ode45(@mysystem,[to tf], [0,0]);
%{
subplot(1,2,1);
plot (t,x(:,1), 'r--')
xlim([0 100]);
title ('Position vs. Time')
legend('Numerical')
subplot(1,2,2);
plot(t, analytical(t), 'b')
xlim([0 100]);
%t = linspace(0,100);
%plot (t,analytical(t), 'x', 'blue')
title ('Position vs. Time')
legend('Analytical')
%}


%this code is for a graph on a single plot

hold on;
grid on;
plot (t,x(:,1), 'r--');
%plot(t, analytical(t), 'b:')
xlim([0 100])
title('Position vs. Time for MSD System')
%legend('Numerical', 'Analytical')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculating the performance metrics for MSD System
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% damping coefficient
c = 0.25;
% spring rate
k = 3;
% mass 
m = 4;

syms wd wn zeta
wn = sqrt(k/m);
zeta = 0.5*sqrt(c.^2./(k*m));
wd = wn*sqrt(1-zeta.^2);
beta = atan(wd/wn);

risetime = (pi - beta)/wd;
settlingtime = 3/(zeta*wn);
overshoot = exp(-zeta*pi/sqrt(1-zeta.^2));

fprintf('risetime = %d\n', risetime)
fprintf('settling time = %d\n', settlingtime);
fprintf('overshoot = %d\n', overshoot);












