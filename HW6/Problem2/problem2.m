function problem2
Num = [15 15*50];
Den = [1 110 1000];
[A, B, C, D] = tf2ss(Num, Den);
disp('A is:');
disp(A);
disp('B is:');
disp(B);
disp('C is:');
disp(C);
disp('D is:');
disp(D);
disp('Eigenvalues of A are:');
disp(eig(A));
