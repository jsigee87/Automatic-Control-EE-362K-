function zprime = MSD(t,z)
k = 4;
b = 0.25;
m = 20;
zprime = [z(2); -k/m*z(1)+ -b/m*z(2)];