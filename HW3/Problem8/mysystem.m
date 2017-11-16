function xprime = mysystem(t,x)

% damping coefficient
c = 0.25;
% spring rate
k = 3;
% mass 
m = 4;

xprime = [x(2); (-k/m)*x(1) + (-c/m)*x(2) + 1];