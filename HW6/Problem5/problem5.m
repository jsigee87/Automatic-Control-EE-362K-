function problem5

num = [20/10 20 0];
den = [1 10*2 10^2];
h = tf(num, den);
bode(h);