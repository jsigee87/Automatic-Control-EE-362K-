function [y] = eulers

% This function solves equations of the type dy/dt = f(y, t)
% Method: y(new) = y(old) + slope * step size


% First define variables
clear t
clear y

h = 0.5;          % Step size
t = 0:h:2;

y = zeros(1, length(t));   % y = a vector
y(1) = 2;       % y(IC) = y0

for i = 1: length(t)-1
    phi = 4*exp(0.8*t(i)) - 0.5 * y(i);
    y(1, i+1) = y(1, i) + phi * h;
end


plot(t,y)


