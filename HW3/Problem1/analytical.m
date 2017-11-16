function f_t = analytical(t)
%ic = [1,1];

% damping coefficient
c = 0.25;
% spring rate
k = 3;
% mass 
m = 4;

%syms zeta wn wd t
zeta = 0.5*sqrt((c.^2)/(k*m));
wn = sqrt(k/m);
wd = wn*sqrt(1-zeta.^2);
b = zeta*wn/wd + 1/wd;

%%analytical solution
f_t = exp(-zeta*wn*t).*(cos(wd*t) + b*sin(wd*t));