function problem2
k0 = 0.1;
k1 = 0.1;
k2 = 0.5;
b0 = 1.5;

a = [-k0-k1, k1; k2, -k2];
b = [b0, 0]';
c = [0, 1];
d =  0;
sys = ss(a, b, c, d);

t = 0:0.1:60;
u = ones(1, length(t));
u = u./10;
%%%%Step Response
subplot(2,2,1);
plot(t, lsim(sys, u, t));
xlabel('Time (minutes)');
ylabel('Input Response');
title('Step Response');
xlim([0 60]);
ylim([0 2]);

%%%%%Step Input
subplot(2,2,3);
plot(t, u);
xlabel('Time (minutes)');
ylabel('Input');
title('Input')
xlim([0 60]);
ylim([0 0.4]);

for i = 1: 51
    u(i) = 0.3;
end

%%%%%Pulse Response
subplot(2,2,2);
plot(t, lsim(sys, u, t));
xlabel('Time (minutes)');
ylabel('System Response');
title('System Response');
xlim([0 60]);
ylim([0 2]);

%%%%%Pulse Input
subplot(2,2,4);
plot(t, u);
xlabel('Time (minutes)');
ylabel('Input');
title('Input');
xlim([0 60]);
ylim([0 0.4]);

