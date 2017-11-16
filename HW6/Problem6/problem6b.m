function problem6b
clear all;
k = linspace(1, 10, 0.5);
for i = 1:length(k)
    num = [k(i) 16/k(i) 60/k(i)];
    den = [1 6 8 0];
    sys = tf(num, den);
    step(sys, 'b');
    hold on;
end
