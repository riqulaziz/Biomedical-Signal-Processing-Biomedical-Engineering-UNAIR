function [skew, kurt] = skew_kurt(x)
% Function to caculate skew and kurtosis of data x
%
N = length(x);          % Data lenght
x = x - mean(x);        % Removed mean
sd = std(x,1);          % standard deviation (normalized by 1/N)
skew = (1/(N*sd^3))*mean(x.^3); % Calculate skew
kurt = (1/(N*sd^4))*mean(x.^4); % Calculate kurtosis