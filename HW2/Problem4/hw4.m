function [error] = hw4

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HW question 4 - Error calculation of RK4 analysis of ODE (f_ty) and 
% analytical solution (f_t = y)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f_ty = @(t,y) (1+t)*sqrt(y);            %%ODE
tf = 2.5;
h = 2.5;
ic = 1;


[t1, y1] = rk4(f_ty,h,tf,ic);              %%RK4 approximation of solution
n = length(t1);
rkans = y1(n);
f_t = @(t) ((t+(t.^2)/2)/2).^2;
ans = f_t(2.5);
error = abs((f_t(2.5) - rkans))/f_t(2.5);


