function problem4a

A = [3 0 1; -3 1 0; 1 0 0];
C1 = [1 0 1];
C2 = [0 1 0];
C3 = [0 0 1];
W1 = obsv(A,C1);
W2 = obsv(A,C2);
W3 = obsv(A,C3);

disp('The C1');
observable(W1,A);
disp('The C2');
observable(W2,A);
disp('The C3');
observable(W3,A);

disp('Wo,1 is');
disp(W1);
disp('Wo,2 is');
disp(W2);
disp('Wo,3 is');
disp(W3);


end

function observable(W, A)
if (rank(W) == size(A))  
    disp("system is observable");
else
    disp("system is not observable");
end
end