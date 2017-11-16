function zprime1 = mysystem1(t,z)

A = [0,1,0;0,0,1;-2,3,5];
B = [0;0;0.5];
C = [1,0,0];

[k1,k2] = problem6;

yr = 1;
kr = -1/(C/(A-B*k1')*B);

zprime1 = (A - B*k1')*z + B*kr*yr;

