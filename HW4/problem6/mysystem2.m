function zprime2 = mysystem2(t,z)

A = [0,1,0;0,0,1;-2,3,5];
B = [0;0;0.5];
C = [1,0,0];

[k1,k2] = problem6;

yr = 1;
kr = -1/(C*inv(A-B*(k2'))*B);

zprime2 = (A - B*k2)*z + B*kr*yr;

t = 0:0.1:30;
plot(t, kr*yr);