function problem1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spring mass damper solver
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



to = 0;
tf = 100;



[t,x] = ode45('myode',[to tf], [1,1]);

subplot(1,2,1);
plot (t,x(:,1), 'r--')
xlim([0 100]);
title ('Position vs. Time')
legend('Analytical')
subplot(1,2,2);
plot(t, analytical(t), 'b')
xlim([0 100]);
%t = linspace(0,100);
%plot (t,analytical(t), 'x', 'blue')
title ('Position vs. Time')
legend('Numerical')



%this code is for a graph on a single plot
%{
hold on;
plot (t,x(:,1), 'r--');
plot(t, analytical(t), 'b:')
title('Position vs. Time for MSD System')
legend('Numerical', 'Analytical')
%}
