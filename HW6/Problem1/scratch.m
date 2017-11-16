function scratch

syms f(x,y);
f(x,y) = (y.^2)/4*x;

fsurf(f, [0 1]);