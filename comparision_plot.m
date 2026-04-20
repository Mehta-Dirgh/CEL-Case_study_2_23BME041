clc; clear; close all;

% Load data
load('numerical_data.mat');
load('pinn_data.mat');

% Plot comparison
figure;
plot(t,x1,'k','LineWidth',2); hold on;
plot(t,x1_pinn,'b--','LineWidth',2);
legend('Numerical x1','PINN x1');
title('Comparison of Numerical vs PINN');
xlabel('Time'); ylabel('Position');
grid on;

figure;
plot(t,abs(x1-x2),'k','LineWidth',2); hold on;
plot(t,abs(x1_pinn-x2_pinn),'r--','LineWidth',2);
legend('Numerical Error','PINN Error');
title('Error Comparison');
xlabel('Time'); ylabel('Error');
grid on;