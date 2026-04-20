clc; clear; close all;

% Parameters
m = 1;
c = 2;
k = 5;
Kp = 10;
F1 = 1;

params = [m c k Kp F1];

% Time span
tspan = [0 10];

% Initial conditions [x1 v1 x2 v2]
y0 = [0 0 2 0];

% Solve using ODE45
[t,y] = ode45(@(t,y) conveyorODE(t,y,params), tspan, y0);

x1 = y(:,1);
x2 = y(:,3);

% Plot Positions
figure;
plot(t,x1,'b','LineWidth',2); hold on;
plot(t,x2,'r--','LineWidth',2);
legend('Conveyor 1','Conveyor 2');
xlabel('Time'); ylabel('Position');
title('Numerical Solution (ODE45)');
grid on;

% Error Plot
figure;
plot(t, abs(x1-x2),'k','LineWidth',2);
xlabel('Time'); ylabel('Error');
title('Synchronization Error');
grid on;

% Save results
save('numerical_data.mat','t','x1','x2');