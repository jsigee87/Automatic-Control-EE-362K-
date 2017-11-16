function [f] = cecalc(lambda)

syms f(k1, k2, k3);
 
f(k1,k2,k3) = -(lambda.^3) + (lambda.^2)*(5-k3*0.5) + lambda*(3-k2*0.5) - k1*0.5 - 2;
%disp(f);

