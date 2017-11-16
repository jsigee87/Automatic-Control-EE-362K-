function problem3

A = [0,1,0;0,0,1;-2,3,5];
B = [0,0,0.5]';
wr = ctrb(A,B);
reachable = 0;
if (rank(wr) == size(A))
    reachable = 1;
    disp("System is reachable");
    disp(wr);
else
    disp("System is not reachable");
end

    

    