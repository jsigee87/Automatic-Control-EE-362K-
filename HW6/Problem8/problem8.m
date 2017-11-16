function problem8
figure
n = -1*[0 1 16 60];
d = -1*[1 6 8 0];
h = tf(n, d);
%pzmap(h);
%step(h);
rlocus(h);

%{
gain = linspace(0, 10);
for i =1:length(gain)
    n = -gain(i)*[0 1 16 60];
    d = -gain(i)*[1 6 8 0];
    h = tf(n, 1 + d);
    pzmap(h);
    hold on;
end

%}

%{
[A, B, C, D] = tf2ss(n, 1 + d);
sys = ss(A, B, C, 0);
%}