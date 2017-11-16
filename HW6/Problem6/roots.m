function roots
syms s;
f(s) = -s^3 -6*s^2-8*s + 1;
%disp(solve(eqn, s));
fplot(f, [-10 5]);