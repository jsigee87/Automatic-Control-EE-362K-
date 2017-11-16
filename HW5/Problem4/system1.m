function zprime=system1(t,z)
A = [3 0 1; -3 1 0; 1 0 0 ]
%A = [4, 1, 0; -2, 0 1; -1, 0, 0];   %ocf--requires plotting z(:,1)
B = [1;0;0];
zprime = A*z + B;
end