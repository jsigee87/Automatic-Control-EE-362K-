clear all;
z = [10000,10,0,0]';
%{
z(1,1) = 10000;     %initial uninfected pop
z(2,1) = 10;        %initial infected pop
z(3,1) = 0;         %initial immunized/cured
z(4,1) = 0;         %dead
%}
a=1; b=10; c=1;     %#/100/day die, infected, immunized
d=50; e=25;         %#/100/day of infected who die or are cured
f=1;                %#/100/day of immune who die
u(1) = 10; u(2) = 10; %#/uninfected and infected added per day.
A = [ -a-b-c 0 0 0; b -d-e 0 0; c e -f 0; a d f 0; ]./100;
B = [ 1 0; 0 1; 0 0; 0 0 ];
C = [ eye(3) zeros(3,1) ];
day =1:200;
for i=1:length(day)-1
    z(:,i+1)= z(:,i) + A*z(:,i)+B*u';
    for j=1:4
        if z(j,i+1) < 0
            z(j,i+1) = 0;
        end
    end
end

pop= zeros(1,length(day));
for i=1:length(day)-1
    pop(i) = z(1,i)+z(2,i)+z(3,i);
end
    plot(day,C*z, day, pop)
    
    legend('uninfected','infected','immune','total pop');