function [yt]=yt
clear t; clear y;
t = linspace(0,2);
yt = (4/1.3)*(exp(0.8*t)-exp(-0.5*t)) + 2*exp(-0.5*t);

plot(t, yt);
