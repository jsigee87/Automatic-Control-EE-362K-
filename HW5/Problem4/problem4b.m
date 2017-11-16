function [A, C, T] = problem4b

A = [3 0 1; -3 1 0; 1 0 0];
C = [0 1 0];
Atilda = [4, 1, 0; -2, 0 1; -1, 0, 0];
Ctilda = [1 0 0];

wo = obsv(A,C);
wotilda = obsv(Atilda, Ctilda);

T = inv(wo)*wotilda;
%disp('The transformation T is')
%disp(T)
