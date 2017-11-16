function scratch
syms x;
f = @(x) 4*x*(1-x*2);
t =0:0.01:1;
%cdf = D'(pdf)
plot(t,f,'b');
title('Plot of PDF and CDF')


