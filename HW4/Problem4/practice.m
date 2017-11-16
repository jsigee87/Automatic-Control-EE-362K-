function practice

A = [0,1,0;0,0,1;-2,3,5];
B = [0,0,0.5]';
C = [1,0,0];
D = 0;
sys = ss(A, B, C, D);
csys = canon(sys,'companion');
