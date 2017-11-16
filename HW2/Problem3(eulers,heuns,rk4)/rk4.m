function [y] = rk4

clear t;clear y;
h=2;
t = 0:h:2;
y = zeros(1,length(t));
y(1)=2;             %Initial Condition
F_ty = @(t,y) (4)*exp(0.8*t) - 0.5*y;

for i=1:length(t)-1
    k1 = F_ty(t(i), y(i));
    k2 = 2 * F_ty(t(i) + 0.5*h, y(i) + 0.5*h*k1);
    k3 = 2 * F_ty(t(i) + 0.5*h, y(i) + 0.5*h*k2);
    k4 = F_ty(t(i) + h, y(i) + h*k3);
    y(i+1) = y(i) + h*(k1 + k2 + k3 + k4)/6;
end

plot(t,y);


    


