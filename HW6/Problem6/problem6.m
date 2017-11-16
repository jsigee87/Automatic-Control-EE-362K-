function problem6
dk = 0.5;
k = -20.67 - dk;

num = k*[1 16 60];
den = k*[1 6 8 0];

h = tf(num, 1+ den);
rlocus(h);
%bode(h);
