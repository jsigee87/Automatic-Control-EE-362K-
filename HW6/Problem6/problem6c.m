function problem6c

syms s;
N(s) = (s+10)*(s+6);
D(s) = s*(s+2)*(s+4);
K(s) = -(D(s)/N(s));
dK(s) = diff(K, s)
fplot(dK(s), [-21 -20]);