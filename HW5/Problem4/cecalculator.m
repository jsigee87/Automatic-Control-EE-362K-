function [f] = cecalculator(lambda)

syms p1 p2 p3;
 
f = (lambda.^3) + (lambda.^2)*(p1) + lambda*(p2) + p3;

