clc; clear; close all;

% Load numerical data
load('numerical_data.mat');   % t, x1, x2

% Normalize time properly
t = t(:);
t_norm = (t - min(t)) / (max(t) - min(t));
dlX = dlarray(t_norm','CB');

% Convert true data
x1_true = dlarray(x1','CB');
x2_true = dlarray(x2','CB');

% Parameters
m = 1; c = 2; k = 5; Kp = 10; F1 = 1;

% Network (simplified for stability)
layers = [
    featureInputLayer(1)
    fullyConnectedLayer(30)
    tanhLayer
    fullyConnectedLayer(30)
    tanhLayer
    fullyConnectedLayer(2)
];

net = dlnetwork(layers);

% Training
epochs = 3000;   % 15k NOT needed
lr = 0.01;

for epoch = 1:epochs
    
    [loss,gradients] = dlfeval(@modelloss, net, dlX, x1_true, x2_true, m, c, k, Kp, F1);
    
    net = dlupdate(@(w,g) w - lr*g, net, gradients);
    
    if mod(epoch,200)==0
        disp("Epoch " + epoch + " Loss = " + extractdata(loss));
    end
end

% Prediction
dlY = predict(net, dlX);
Y = extractdata(dlY);

x1_pinn = Y(1,:)';
x2_pinn = Y(2,:)';

% Plot
figure;
plot(t,x1,'k','LineWidth',2); hold on;
plot(t,x1_pinn,'b--','LineWidth',2);
plot(t,x2_pinn,'r--','LineWidth',2);
legend('True x1','PINN x1','PINN x2');
title('FINAL PINN Output');
grid on;