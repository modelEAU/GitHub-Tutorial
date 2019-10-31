% Created on Wed Oct 30 14:30:00 2019
% @author: NINIC2
% 
% DESCRIPTION: THIS SCRIPT CAN BE USED TO ESTIMATE THE PARAMETERS OF AN ARX POLYNOMIAL MODEL FOR DYNAMIC SYSTEMS.
% 
% Copyright (c) 2019 by Niels Nicola?, nicolai.niels@gmail.com, modelEAU, Universit? Laval. All Rights Reserved.

clc
clear all
close all

% Define sampled data (u: input; y: output; t: time)
dataorig=csvread('stepExperiments.csv');
u=dataorig(:,1);
y=dataorig(:,2);

t = 1:length(u);

% Construct regressor
phi = [y(1:end-1) u(1:end-1)];

% Least squares regression
theta = phi\y(2:end);

% Predicted output with estimated parameters
y_pred(1) = 0;
for i = t(1:end-1)
    phi = [y_pred(i) u(i)];
    y_pred(i+1,1) = phi*theta;
end

% Plot the data with predictions
subplot(2,1,1);
plot(t,y,'k*',t,y_pred,'b','LineWidth',1,'MarkerSize',1)
subplot(2,1,2)
stairs(t,u,'b')





