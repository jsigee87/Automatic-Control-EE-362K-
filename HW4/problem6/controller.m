function controller

clear all;
[t,z] = ode45('mysystem1', [0 30], [0 0]);
plot(t, z(:,1));
hold on;
[t1,z1] = ode45('mysystem2', [0 30], [0 0]);
plot(t1, z1(:,1));
hold on;