function problem6
%{
 Given motor drive of two disks with spring between:
 Open Loop eigenvalues: 0, 0, -0.05 +- j
 Desired state feedback controller eigenvalues:
    -2, -1, -1 +- j
 Desired observer eigenvalues:
    -4, -2, -2 +- 2j
%}


%derivation of system equations
J1 = 10/9;          %inertia of disk 1
J2 = 10;            %inertia of disk 2
c = 0.1;            %spring constant
k = 1;              %friction
k1 = 1;             %motor constant
wo = sqrt(k*(J1 + J2)/(J1*J2));

%{
Let    z1 = disk1 position
        z2 = disk2 position
        z3 = disk1 normalized ang. velocity
        z4 = disk2 normalized ang. velocity
%}
% define SS model
A = [0 0 wo 0;  0 0 0 wo; 
    -k/(wo*J1) k/(J1*wo) -c/J1 c/J1;
    k/(wo*J2) -k/(wo*J2) c/J2 -c/J2];
B = [0; k1/(wo*J1); 0; 0];
C = [0 0 1 0];

%desired output and time
t = 0:0.1:30;
yr = ones(1, length(t));

%check observability, reachability
Wo = obsv(A, C);
Wr = ctrb(A, B);
disp('Wo is: ');
disp(Wo);
disp(['rank Wo is ', num2str(rank(Wo))]);
disp('Wr is: ');
disp(Wr);
disp(['rank Wr is ', num2str(rank(Wr))]);

%disp(cond(A));
%disp(A);

%desired controller eigenvalues
p1 = [-2 -1 -1+j -1-j];

%desired observer eigenvalues
p2 = [ -4 -2 -2+2*j -2-2*j];

%assign poles for K, L
%K = place(A,B,p1);
Lt = place(A',C',p2);
L = Lt';

%kr term
kr = -1/(C*inv(A-B*K)*B);

% augmented system
Aa = [A-B*K B*K; zeros(4,4) A-L*C];
Ba = [B*kr; zeros(4,1)];
Ca = [C zeros(size(C)); zeros(size(C)) C];

sys1 = ss(Aa, Ba, Ca, 0);

ic = zeros(1, size(Aa,1));


%%this assumes ic = 0, yr is step, and output of interest is theta, disk 2
[z, t, x] = lsim(sys1, yr, t, ic);
observer = x(:,3) - x(:,7);
actual = x(:,3);
plot(t,actual, 'xb', t, observer, 'r');






end

