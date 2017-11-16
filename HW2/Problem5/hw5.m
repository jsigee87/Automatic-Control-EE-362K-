clear all

h = 4;
tf = 4;
clear y;
t = 0:h:tf;                     %Time span of interest
y = zeros(3,1,length(t));
y(:,:,1)= [1,1,1]';                      %Initial Condition

dy = @(y) [0,1,0;0,0,1;-4,-0.5,-3]*y(:,:);

%k's become vectors, so 

for i=1:length(t)-1
    k1 = dy(y(:,:,i));
    k2 = 2 * dy(y(:,:,i) + 0.5*h*k1);
    k3 = 2 * dy(y(:,:,i) + 0.5*h*k2);
    k4 = dy(y(:,:,i) + h*k3);
    y(:,:,i+1) = y(:,:,i) + h*(k1 + k2 + k3 + k4)/6;
end
%{
output = zeros(1,3,length(t));
output(1,1,1) = 1; output (1,1,2) = 1;
y(:,:,1) = output(:,:,1)*y(:,:,1);
y(:,:,2) = output(:,:,2)*y(:,:,2);
%}
