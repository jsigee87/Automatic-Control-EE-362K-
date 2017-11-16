function problem5

[t,z] = ode45('compcontroller', [0 30], [0 0]);
disp(t);
disp(z);