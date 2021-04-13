% Ex 10.1 Program to test ergodicity of data
% 
clear all; close all;
load Bandlimit_gauss;   % Bandlimited Gaussian noise
%load EEG10;     % 10 min EEG
fs =  254;      % Sample frequency
N = 30 * fs;      % Segment size 30 sec intervals
K = 5;          % Divide signal into K, 30 sec intervals

for k = 1:K                 % Isolate and plot 5 segments of EEG 
    ix = N*(k-1) + 1;
    y(k,:) = x(ix:ix+N-1);
    avg(k) = mean(y(k,:));      % Calculate mean
    va(k) = var(y(k,:));        % Second moment
    [skew(k), kurt(k)] = skew_kurt(y(k,:)); % Other two moments. 
end
output = [avg' va' skew' kurt']
variance = var(output)
