function problem4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part A Step Response
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[t,y] = ode45('mysystem', [0 30], [1 0 1]);

subplot(2,2,1);
semilogy(t,y(:,1));
xlabel('Time (seconds)');
ylabel('State 1');
subplot(2,2,2);
semilogy(t,y(:,2));
xlabel('Time (seconds)');
ylabel('State 2');
subplot(2,2,3);
semilogy(t,y(:,3));
xlabel('Time (seconds)');
ylabel('State 3');
suptitle('State Response to step input');

%}
%{
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Part B Impulse Response
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A = [0, 1, 0; 0, 0, 1; -2, 3, 5];
B = [0, 0, 0.5]';
%A = [-5,-3,2;1,0,0;0,1,0;];    %RCF
%B = [1,0,0]';                  %RCF
C = [1,0,0];
D = 0;
t = 0:0.1:30;
u = zeros(1, length(t));
u(1) = 3;                %impulse of value 3
sys1 = ss(A, B, C, D);
C = [0,1,0];
sys2 = ss(A, B, C, D);
C = [0,0,1];
sys3 = ss(A, B, C, D);
z1 = lsim(sys1, u, t, [1 0 1]);
z2 = lsim(sys2, u, t, [1 0 1]);
z3 = lsim(sys3, u, t, [1 0 1]);
subplot(2,2,1);
plot(t,z1(:,1));
xlabel('Time (seconds)');
ylabel('State 1');
subplot(2,2,2);
plot(t,z2(:,1));
xlabel('Time (seconds)');
ylabel('State 2');
subplot(2,2,3);
plot(t,z3(:,1));
xlabel('Time (seconds)');
ylabel('State 3');
suptitle('Impulse response');
%}

