
function redo
close all;

A = [3 0 1; -3 1 0; 1 0 0 ];
B = [1;0;0];
C = [0 1 0];

%check observability
Wo = obsv(A, C);
disp('rank Wo is: ');
disp(rank(Wo));

%pole placement
L = (place(A', C', [-2 -4 -6]))';
disp('L is: ');
disp(L);

%check eigenvalues
disp('Eigenvalues of A-LC are: ');
disp(eig(A-L*C));


%%%%%%%%%%% Plotting Zero State Response %%%%%%%%%%%
[t1,z1] = ode45(@ss1, [0 2], [0 0 0]);
[t2,z2] = ode45(@sserror, [0 2], [0 0 0]);
zerror = interp1(t2, z2, t1);
zhat = z1-zerror;
figure;
subplot(2,3,1); semilogy(t1, z1(:,1), 'b'); hold on;
subplot(2,3,1); semilogy(t1, zhat(:,1), '--r');
xlabel('Time');
ylabel('State 1');
ylim([10.^(-10) 10.^2]);
legend('Actual','Estimated', 'Location', 'southeast');

subplot(2,3,2); plot(t1, z1(:,2), 'b'); hold on;
subplot(2,3,2); plot(t1, zhat(:,2), '--r');
xlabel('Time');
ylabel('State 2');
xlim([0 1]);
legend('Actual','Estimated', 'Location', 'southwest');

subplot(2,3,3); plot(t1, z1(:,3), 'b'); hold on;
subplot(2,3,3); plot(t1, zhat(:,3), '--r');
xlabel('Time');
ylabel('State 3');
xlim([0 2]);
legend('Actual','Estimated', 'Location', 'northwest');


%%%%%%%%%%%%%%%%%% Plotting IC response %%%%%%%%%%%%%
clear all;
[t1,z1] = ode45(@ss1, [0 2], [1 1 1]);
[t2,z2] = ode45(@sserror, [0 2], [1 1 1]);
zerror = interp1(t2, z2, t1);
zhat = z1-zerror;
subplot(2,3,4); plot(t1, z1(:,1), 'b'); hold on;
subplot(2,3,4); plot(t1, zhat(:,1), '--r');
xlabel('Time');
ylabel('State 1');
xlim([0 1]);
legend('Actual','Estimated', 'Location', 'northwest');

subplot(2,3,5); plot(t1, z1(:,2), 'b'); hold on;
subplot(2,3,5); plot(t1, zhat(:,2), '--r');
xlabel('Time');
ylabel('State 2');
xlim([0 1]);
legend('Actual','Estimated', 'Location', 'southwest');

subplot(2,3,6); plot(t1, z1(:,3), 'b'); hold on;
subplot(2,3,6); plot(t1, zhat(:,3), '--r');
xlabel('Time');
ylabel('State 3');
xlim([0 1.5]);
legend('Actual','Estimated', 'Location', 'northwest');
suptitle({'Plots of All System States;','Actual vs. Estimator','Zero State and IC Responses'})


%%%%%%%%%%%%%%%% Plotting Error %%%%%%%%%%%%%
[t2,z2] = ode45(@sserror, [0 30], [0 0 0]);
figure;
subplot(1,3,1); plot(t2,z2(:,1));
xlabel('Time')
ylabel('State 1');
subplot(1,3,2); plot(t2,z2(:,2));
xlabel('Time')
ylabel('State 2');
subplot(1,3,3); plot(t2,z2(:,3));
xlabel('Time')
ylabel('State 3');
suptitle('Error in Estimator')

end

function zprime = ss1(t,z)
    A = [3 0 1; -3 1 0; 1 0 0 ];
    B = [1;0;0];
    zprime = A*z+B;
end
function error = sserror(t,z)
    A = [3 0 1; -3 1 0; 1 0 0 ];
    B = [1;0;0];
    C = [0 1 0];
    L = (place(A', C', [-2 -4 -6]))';    
    Ao = (A-L*C);
    error = Ao*z +B;
end
