function prob6

A = [0 1; 1 -1.2];
deta = det(A);
detaT = det(A');
[V,D]= eig(A);
c = cond(A);
disp('part a.)');
disp('eigenvalues of A are');
disp(D);
disp('part b.)');
disp('the condition number of A is');
disp(c);
disp('part c.)');
disp('the determinant of A at (1,2) is');
disp(deta);
disp('part d.)');
disp('the determinant of A^T at (1,2) is');
disp(detaT);
disp('part e.)');
disp('the product of the eigenvalues is');
disp(det(D));