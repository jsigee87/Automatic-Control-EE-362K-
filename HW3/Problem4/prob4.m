function prob4

tspan = [0,20];
subplot(1,2,1)
[t,x1] = ode45(@mysystem,tspan, [3,0]);
hold on;
plot (x1(:,1),x1(:,2));

[t,x2] = ode45(@mysystem,tspan, [1,1]);
plot (x2(:,1),x2(:,2));

[t,x3] = ode45(@mysystem,tspan,[4,-2]);
plot (x3(:,1),x3(:,2));

[t,x4] = ode45(@mysystem,tspan,[-1,-1]);
plot (x4(:,1),x4(:,2));

[t,x5] = ode45(@mysystem,tspan,[0,0]);
plot (x5(:,1),x5(:,2));

[t,x6] = ode45(@mysystem,tspan,[0,-2]);
plot (x6(:,1),x6(:,2));

[t,x7] = ode45(@mysystem,tspan,[-2,2]);
plot (x7(:,1),x7(:,2));


xlim([-5 5]);
ylim([-5 5]);


subplot(1,2,2);
[y1, y2]= meshgrid(-5:0.25:5,-5:0.25:5);
dy2 = (4*y1-1.2*y2-y1.^3)./y2;
dy1 = ones(size(dy2));
dy2u = 0.25*(dy2./sqrt(dy1.^2 + dy2.^2));
dy1u = 0.25*(dy1./sqrt(dy1.^2 + dy2.^2));
quiver(y1,y2,dy1u,dy2u);
xlim([-5 5]);
ylim([-5 5]);

