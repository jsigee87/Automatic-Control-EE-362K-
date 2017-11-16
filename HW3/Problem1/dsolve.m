syms x(t) c m k
eqn = diff(x,t,2) == -c/m*diff(x,t) -k/m*x;
Dx = diff(x,t);
ic = [x(0) == 0, Dx(0) == 0];
Sol(t) = dsolve(eqn,ic);
