function xprime = mysystem (t,x)

xprime = [x(2);4*x(1)-1.2*x(2)-x(1).^3];