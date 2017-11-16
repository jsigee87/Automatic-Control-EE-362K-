function problem1

A = [0 1 0 ; 0 0 1; 3 2 -1];
B = [0;0;1];
C = [2 0 0];
D = 1;
syms s;
sI = [s 0 0; 0 s 0; 0 0 s];

disp('H(s) is: ');
disp(C*inv(sI-A)*B + D);
