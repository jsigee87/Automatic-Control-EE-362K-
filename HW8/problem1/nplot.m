%{
Use Nyquist Plot to determine stability for gains K from
1 to 10. Determine gain margin for each K. Determine K for 
which system is neutrally stable. Then determine range of K for
system stability.
%}

clear all;
close all;
K = 1:1:10;
warning('off', 'all')

for i = 1:10
    n = K(i);
    d = [2 3 1 K(i)];
    sys = tf(n, d);
    subplot(4,3,i);
    nyquist(sys);
    title(['Gain = ', num2str(i)]);
    [gm] = margin(sys);
    disp(['For gain K = ', num2str(i), ' the gain margin is ', num2str(gm)]);
end
for i = 1:10
    
end
set(0, 'defaultTextInterpreter','latex');
suptitle('Nyquist Plots of $\frac{K}{s(s+1)(2s+1)+K}$')