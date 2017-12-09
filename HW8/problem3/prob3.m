close all;
L = tf([1 2], [1 3 1 2]);
rlocus(L);
figure;
nyquist(L);
figure;
step(L);
[gm, pm, wgm, wpm] = margin(L);
%disp([num2str(gm),' ', num2str(pm), ' ', num2str(wgm), ' ', num2str(wpm)])
disp(['Gain margin is: ', num2str(wgm)]);
