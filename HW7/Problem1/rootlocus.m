function rootlocus
n = [1 9];
d = [1 4 11 0];
sys = tf(n, d);
rlocus(sys);
