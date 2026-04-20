function dydt = conveyorODE(~, y, params)

m = params(1);
c = params(2);
k = params(3);
Kp = params(4);
F1 = params(5);

x1 = y(1);
v1 = y(2);
x2 = y(3);
v2 = y(4);

dx1 = v1;
dv1 = (F1 - c*v1)/m;

dx2 = v2;
dv2 = (F1 + (k+Kp)*(x1 - x2) - c*v2)/m;

dydt = [dx1; dv1; dx2; dv2];

end