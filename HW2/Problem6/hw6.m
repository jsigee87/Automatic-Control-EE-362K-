function hw6

%first round of subplots for k = 2;
subplot(2,2,1);
[t,y] = ode45(@MSD,[0 1],[0 4]);
plot (t,y(:,1),t,y(:,2))
xlabel('Time (s)')
legend('Position','Velocity', 'Location','southeast')
title('Time Span 1 Second')

clear t; clear y;
subplot(2,2,2);
[t,y] = ode45(@MSD,[0 5],[0 4]);
plot (t,y(:,1),t,y(:,2))
xlabel('Time (s)')
legend('Position','Velocity', 'Location','northeast')
title('Time Span 5 Seconds')

clear t; clear y;
subplot(2,2,3);
[t,y] = ode45(@MSD,[0 30],[0 4]);
plot (t,y(:,1),t,y(:,2))
xlabel('Time (s)')
legend('Position','Velocity', 'Location','northeast')
title('Time Span 30 Seconds')

clear t; clear y;
subplot(2,2,4);
[t,y] = ode45(@MSD,[0 60],[0 4]);
plot (t,y(:,1),t,y(:,2))
xlabel('Time (s)')
legend('Position','Velocity', 'Location','northeast')
title('Time Span 60 Seconds')