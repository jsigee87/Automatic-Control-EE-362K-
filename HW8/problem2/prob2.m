clear all;
close all;
K = 4.25;

sys = tf(K, [1 -2]);
nyquist(sys);

[gm, pm, wgm, wpm] = margin(sys);

disp(['Gain margin is: ', num2str(wgm)]);
disp(['Phase margin is: ', num2str(wpm)]);