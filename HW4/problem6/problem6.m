function [k1,k2]=problem6
syms k1 k2 k3
%part a
f1 = cecalculator(-1);
f2 = cecalculator(-3);
f3 = cecalculator(-6);

[A,b] = equationsToMatrix([f1,f2,f3], [k1,k2,k3]);
k1 = linsolve(A,b);
%disp('k is:')
%disp(k)


%part b
f4 = cecalculator(-2);
f5 = cecalculator(-1+5*j);
f6 = cecalculator(-1-5*j);
[A,b] = equationsToMatrix(f4,f5,f6);
k2 = linsolve(A,b);
%disp('k is:')
%disp(k)



