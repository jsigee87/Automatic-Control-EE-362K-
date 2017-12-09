function findroots

syms s;
f(s) = s^3 + (31/2)*s^2+36*s+99/2;
%disp(diff(f(s)));
fplot(f(s), [-13.1 -13]);