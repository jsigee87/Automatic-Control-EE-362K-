function xprime =mysystem(t,x)

u = 1;
%A = [5,3,-2;1,0,0;0,1,0;];    %RCF
%B = [1,0,0]';                  %RCF
A = [0, 1, 0; 0, 0 1; -2, 3, 5];
B = [0, 0, 0.5]';
C = [1,0,0];
D = 0;

xprime = A*x + B*u;

