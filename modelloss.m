function [loss,gradients] = modelloss(net, dlX, x1_true, x2_true, m, c, k, Kp, F1)

Y = forward(net, dlX);

x1 = Y(1,:);
x2 = Y(2,:);

% Convert constants
m = dlarray(m);
c = dlarray(c);
k = dlarray(k);
Kp = dlarray(Kp);
F1 = dlarray(F1);

% First derivatives
dx1 = dlgradient(sum(x1), dlX, 'EnableHigherDerivatives', true);
dx2 = dlgradient(sum(x2), dlX, 'EnableHigherDerivatives', true);

% Second derivatives
ddx1 = dlgradient(sum(dx1), dlX);
ddx2 = dlgradient(sum(dx2), dlX);

% Physics residuals
r1 = ddx1 - (F1 - c*dx1)/m;
r2 = ddx2 - (F1 + (k+Kp)*(x1 - x2) - c*dx2)/m;

loss_physics = mean(r1.^2 + r2.^2);

% STRONG DATA LOSS (main driver)
loss_data = 5 * mean((x1 - x1_true).^2 + (x2 - x2_true).^2);

% Initial condition
loss_ic = 10*(x1(1)^2 + x2(1)^2);

% Total
loss = loss_data + loss_physics + loss_ic;

gradients = dlgradient(loss, net.Learnables);

end