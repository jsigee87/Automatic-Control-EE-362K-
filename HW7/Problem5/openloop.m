% function [CLsys] =openloop
clear all;
close all;

n1 = 6.72*10.4*[1 20 30];
d1 = [1 0];
C = tf(n1, d1);
n2 = [1];
d2 = [1 3.6 9];
P = tf(n2, d2);
OLsys = C*P;

CLsys = feedback(C*P, 1);
step(P/(1+P), 'r--', CLsys, 'b:');
legend("Process", "Process with Controller");
figure;
rlocus(C*P);

figure;
step(CLsys);
