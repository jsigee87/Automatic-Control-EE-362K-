function [pop]=epidemic(c)
%input is rate of immunization/day
clear z;
clear pop;
z = [10000,10,0,0]';

% z1 = initial uninfected pop
% z2 = initial infected pop
% z3 = initial immunized/cured
% z4 = dead

a=1; b=10;           %#/100/day die, infected, immunized
d=50; e=25;         %#/100/day of infected who die or are cured
f=1;                %#/100/day of immune who die
u(1) = 10; u(2) = 10; %#/uninfected and infected added per day.
A = [ -a-b-c 0 0 0; b -d-e 0 0; c e -f 0; a d f 0; ]./100;
B = [ 1 0; 0 1; 0 0; 0 0 ];
%C = [ eye(3) zeros(3,1) ];
day =1:200;
for i=1:length(day)-1
    z(:,i+1)= z(:,i) + A*z(:,i)+B*u';
    for j=1:4
        if z(j,i+1) < 0
            z(j,i+1) = 0;
        end
    end
end
%{
pop= zeros(1,length(day));
for i=1:length(day)-1
    pop(i) = z(1,i)+z(2,i)+z(3,i);
end
%}
pop = [1,1,1,0]*z;



    
    