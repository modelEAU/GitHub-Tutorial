% Created on Wed Oct 30 14:30:00 2019
% @author: NINIC2
% 
% DESCRIPTION: THIS SCRIPT CAN BE USED TO ESTIMATE THE PARAMETERS OF AN ARX POLYNOMIAL MODEL FOR DYNAMIC SYSTEMS.
% 
% Copyright (c) 2019 by Niels Nicolaï, nicolai.niels@gmail.com, modelEAU, Université Laval. All Rights Reserved.

clc
clear all
close all

% Define sampled data (u: input; y: output; t: time)
u = [zeros(50,1);0.5*ones(50,1)];
y = [-0.00400;0.00700;0.0330;0.0150;-0.0160;-0.00900;-0.00400;-0.0100;-0.0230;-0.0330;-0.0150;0.00400;0.0110;0;0.0170;0.0100;0.0140;0.0170;0.0200;-0.00900;-0.0110;0.00800;0.00500;0.00300;-0.00500;-0.00700;0.0180;-0.00300;0.00200;-0.0390;0.00100;-0.0190;-0.0240;0.00300;0.0180;0.0180;0.0150;0.00900;0.0340;0.0360;0.00800;0.0110;0.0130;0.0110;0.00600;0.00600;0.00400;0.0110;0.0160;0.0130;0.00700;0.0660;0.140;0.188;0.209;0.239;0.297;0.334;0.426;0.441;0.444;0.470;0.483;0.507;0.543;0.563;0.554;0.537;0.534;0.514;0.537;0.561;0.551;0.564;0.559;0.576;0.567;0.549;0.553;0.570;0.587;0.575;0.602;0.605;0.594;0.610;0.596;0.557;0.533;0.540;0.549;0.594;0.585;0.571;0.557;0.542;0.535;0.553;0.551;0.531];
t = 1:length(u);

% Construct regressor
phi = [y(1:end-1) u(1:end-1)];

% Least squares regression
theta = [0.95;0.5e-1];

% Predicted output with estimated parameters
y_pred(1) = 0;
for i = t(1:end-1)
    phi = [y_pred(i) u(i)];
    y_pred(i+1,1) = phi*theta;
end

% Plot the data with predictions
plot(t,y,'k*',t,y_pred,'b','LineWidth',1,'MarkerSize',1)





