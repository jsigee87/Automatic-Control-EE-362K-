function zprime=mysystem(t,z)

zprime = [z(2);z(3);-4*z(1) - 0.5*z(2) - 3*z(3)];
%zprime is a column vector
