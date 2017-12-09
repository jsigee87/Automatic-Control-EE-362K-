function breakawaypoints

syms s;
%{
N(s) = s + 9;
D(s) = s*(s^2 + 4*s + 11);
p(s) = -D(s)./N(s);
fplot(diff(p(s)), [-20  20]);
%}
f(s) = (s*(s.^2+4))/(s.^2-(31/3)*s+12);
fplot(f(s), [-0.2, 0.2]);
