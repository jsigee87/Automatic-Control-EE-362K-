function Observer = problem4d(lambda)
% lambda must be an array of 3 numbers

% design a linear observer that converges to true trajectory
% i.e. find L such that A-LC has negative eigenvalues

% the code from 4b was modified to return the transformation T

a1 = -4; a2 = 2; a3 = 1;

a = [a1; a2; a3];

% eigenvalues desired
syms p1 p2 p3;
f1 = cecalculator(lambda(1));
f2 = cecalculator(lambda(2));
f3 = cecalculator(lambda(3));
[A, b] = equationsToMatrix([f1 f2 f3], [p1 p2 p3]);
p = double(linsolve(A, b));

% We know that L = T*(p-a)

[A, C, T] = problem4b;
L = T*(p-a);
Observer = A-L*C;