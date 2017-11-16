function partdsolution


[t1, z1] = ode45('system1', [0 1], [0 0 0]);
[t2, z2] = ode45('system2', [0 1], [0 0 0]);
subplot(1,2,1);
plot(t1, z1(:,2), '*r', t2, z2(:,2), '-b');
title('Estimator and system response to step input')
legend('True Trajectory', 'Estimator Trajectory', 'Location', 'southwest');
xlabel('Time');
ylabel('State 1');

[t1, z1] = ode45('system1', [0 1], [1 1 1]);
[t2, z2] = ode45('system2', [0 1], [1 1 1]);
subplot(1,2,2);
plot(t1, z1(:,2), '*r', t2, z2(:,2), '-b');
title('Estimator and system response to IC [1 1 1]')
legend('True Trajectory', 'Estimator Trajectory', 'Location', 'northwest');
xlabel('Time');
ylabel('State 1');

end



    

