function problem8

syms a1      %alpha
syms b1      %beta

f(a1) = [0,1,0;0,0,1;a1,1,1];
g(b1) = [b1;0;0];
wr = [g(b1) f(a1)*g(b1) (f(a1)^2)*g(b1)];
disp(wr);
disp(det(wr));

S1 = solve(det(wr) == 0, a1);
disp('The only values of alpha that make wr not full rank are:')
disp(S1);
S2 = solve(det(wr) == 0, b1);
disp('The only values of beta that make wr not full rank are:')
disp(S2);