function prob2


tspan = [0 100];
[t,y] = ode45(@mysystem, tspan, [0 0]);

plot(t,y(:,1), t,y(:,2))
title('BAC vs. Time given 12g Oral and 40g IV')
legend('Concentration in Blood','Concentration in Liver')
xlabel('Time (minutes)')
ylabel('Concentration (mmol/L)')





