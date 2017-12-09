function problem2

n = [4];
d = [1 2 4];
sys = tf(n, d);
rlocus(sys);
figure;
step(sys);