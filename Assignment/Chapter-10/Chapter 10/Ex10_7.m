% Exanple 10.7 Calculation of sample entropy on random data
% 
clear all; close all;
N = 20000;       % Number of data points
x = randn(1,N);  % Generate data
max_err = 0.15;  % Maximum error between points
x = (x-mean(x))/std(x);        % Subtract mean, normalize so std = 1
%
B = num_matches(x,2,max_err);  % Determine two-component matche     A = num_matches(x_scaled,3,max_err);  % Determine three-component matches
A = num_matches(x,3,max_err);  % Determine three-component matches
samp_entropy = -log(A/B);      % Calculate sample entropy 
disp(samp_entropy)