function compcontroller
close all;

t = 0:0.1: 30;
%system parameters
ko = 0.1;
k1 = 0.1;
k2 = 0.5;
bo = 1.5;

%system matrices
A = [-ko-k1, k1; k2, -k2];
B = [bo; 0];
C = [1 0];

%desired output
yr = 10*ones(length(t), 1);

Wo = obsv(A, C);
Wr = ctrb(A, B);
disp('Wo is: ');
disp(Wo);
disp(['rank Wo is ', num2str(rank(Wo))]);
disp('Wr is: ');
disp(Wr);
disp(['rank Wr is ', num2str(rank(Wr))]);

Lt = place(A', C', [-1 + 0.1*j; -1 - 0.1*j]);
L = Lt';
K = place(A, B, [-0.5 -1]);
%disp(['cond no of L is: ', num2str(cond(L))]);
%disp(['cond no of K is: ', num2str(cond(K))]);
disp('Eigenvalues of A-BK are: ');
disp(eig(A-B*K));
disp('Eigenvalues of A-LC are: ');
disp(eig(A-L*C));

%kr derivation
kr = -1/(C*inv(A-B*K)*B);

% augmented system
Aa = [A-B*K B*K; zeros(2,2) A-L*C];
Ba = [B*kr; zeros(2,1)];
Ca = [C zeros(size(C)); zeros(size(C)) C];

%Aa = [A-B*k];
%Ba = B*kr;
sys1 = ss(Aa, Ba, Ca, 0);
%{
Ae = (A-L*C)*e;
Be = B*K;
Ce = [1 1];
%}
[z1, t1, x1] = lsim(sys1, yr, t, [5 5 5 5]);
observer1 = x1(:,1)- x1(:,3);
actual1 = x1(:,1);
observer2 = x1(:,2)- x1(:,4);
actual2 = x1(:,2);
subplot(1,2,1);
plot(t1, actual1, 'b', t1, observer1, '--r');
xlabel('Time (seconds)');
ylabel('Concentration in Vessel 2 (mL/L)');
legend('Actual State 1', 'Estimate State 1');
ylim([-1 15]);
subplot(1,2,2);
plot(t1, actual2, 'b', t1, observer2, '--r');
xlabel('Time (seconds)');
ylabel('Concentration in Vessel 1 (mL/L)');
ylim([-1 15]);
legend('Actual State 2', 'Estimate State 2');
suptitle('Concentration in Vessels 1 and 2 with Controller');





