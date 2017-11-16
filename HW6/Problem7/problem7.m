function problem7

gain = -0.005;
n = gain*[0 1 16 60];
d = gain*[1 6 8 0];
[A, B, C, D] = tf2ss(n, 1 + d);
sys = ss(A, B, C, 0);
disp(eig(A));
step(sys);
