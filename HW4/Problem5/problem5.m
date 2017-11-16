function problem5

A = [0, 1, 0; 0, 0, 1; -2, 3, 5];
B = [0; 0; 0.5];
Atilda = [5, 3, -2; 1, 0, 0; 0, 1, 0;];    %RCF
Btilda = [1; 0; 0];                  %RCF

wr = ctrb(A, B);
%wr = [B A*B (A^2)*B];
wrtilda = ctrb(Atilda, Btilda);

disp('wr is')
disp(wr)
disp('wrtilda is')
disp(wrtilda)

%wrtilda = [Btilda Atilda*Btilda (Atilda.^2)*Btilda];
T = wrtilda/wr;
disp(T*B);
disp(T*A/T);
disp('Transformation matrix is');
disp(T);
