function prob7


IC = [-4, -4];
subplot(1,2,1);
hold on;
for i = 1:9
    [t,z]=ode45(@mysystem,[0 20], IC);
    plot(z(:,1),z(:,2));
    IC(1) = IC(1) + 1;
    IC(2) = IC(2) + 1;
end
IC = [-4, 4];
for i = 1:9
    [t,z]=ode45(@mysystem,[0 20], IC);
    plot(z(:,1),z(:,2));
    IC(1) = IC(1) + 1;
    IC(2) = IC(2) - 1;
end
xlabel('z1');
ylabel('z2');
title('Integral Curves for various IC')
hold off;

xlim([-10,10]);
ylim([-10,10]);
subplot(1,2,2)
[z1,z2] = meshgrid(-10:1:10,-10:1:10);
dz2 = (3*z1 + 2*z2);
dz1 = (z1 + 2*z2);
dz2u = 0.25*(dz2./sqrt(dz2.^2 + dz1.^2));
dz1u = 0.25*(dz1./sqrt(dz2.^2 + dz1.^2));
quiver(z1,z2,dz1u,dz2u);
xlim([-10 10]);
ylim([-10 10]);
xlabel('z1');
ylabel('z2');
title('Vector Field for Phase Portrait')
%title({'Phase Portrait for Given System',
%    'Various Integral Curves shown with Vector Field'})