function problem2b

n = [1];
d = [1 2 1];
sys = tf(n, d);
rlocus(sys);
figure;
step(sys);