function [t,y]=rk4(F_ty,h,tf,ic)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Pass in an ODE F_ty and a step size h, this method returns two
% vectors, t and y which you can plot as classical fourth order Runge Kutta
% solutions to your ODE F_ty
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear y;
t = 0:h:tf;                     %Time span of interest
y = zeros(1,length(t));
y(1)=ic;                      %Initial Condition

for i=1:length(t)-1
    k1 = F_ty(t(i), y(i));
    k2 = 2 * F_ty(t(i) + 0.5*h, y(i) + 0.5*h*k1);
    k3 = 2 * F_ty(t(i) + 0.5*h, y(i) + 0.5*h*k2);
    k4 = F_ty(t(i) + h, y(i) + h*k3);
    y(i+1) = y(i) + h*(k1 + k2 + k3 + k4)/6;
end