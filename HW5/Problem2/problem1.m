function problem1

A = [-4 -12 -7; 1 0 0; 0 1 0];
B = [1 0 0]';
C = [0 1 3];
Wr = ctrb(A,B);
observable = 0;
if (rank(Wr) == size(A))
    observable = 1;
    disp("System is observable");
    disp(Wr);
else
    disp("System is not observable");
end