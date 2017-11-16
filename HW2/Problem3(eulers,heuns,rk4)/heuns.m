function [t,y] = heuns

% This function solves equations of the type dy/dt = f(y, t)
% Method: y(new) = y(old) + slope * step size


% First define variables
clear t; clear y;

h = 1;                      % Step size
t = 0:h:2;
y = zeros(length(t));           % y = a vector
y(1) = 2;                   % y(IC) = y0
fty = @(t,y) 4*exp(0.8*t) - 0.5*y;

for i = 1: length(t)-1
    si = fty(t(i),y(i));                     % si is the slope at beg of interval
    y(i+1) = y(i) + si*h;              % find y(i+1) w/ si
    sf = fty(t(i+1),y(i+1));                 % estimate final slope
    phi = (si+sf)/2;                       % let slope be avg between i/f
    y(i+1) = y(i) + phi*h;
end

plot (t,y)

