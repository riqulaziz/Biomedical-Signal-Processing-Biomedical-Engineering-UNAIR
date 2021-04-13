function [rxy lags] = crosscorr(x,y)
% Function to perform crosscorrelaton similar to MATLAB;s xcorr
% This version assumes x and y are the same length and row vectors
% Uses zero padding to extend signal x
%  Uses signal y as the reference
%  IF only one input, perfroms autocorrelatin
% Assumes maxlags = 2N -1 where N is the lenght of the shorter data
% Inputs
%   x       signal for crosscorrelation (row vector)
%   y       signal for crosscorrelation (row vector)
% Outputs
%   rxy     crosscorrelation function
%   lags    shifts corresponding to rxy
%
lx = length(x);			% Get length of one signal (assume both the same length)
maxlags = 2*lx - 1;     % Compute maxlags from data length
x = [zeros(1,lx-1) x zeros(1,lx-1)]; % Zero pad signal x
for k = 1:maxlags
    x1 = x(k:k+lx-1);         % Shift signal
    rxy(k) = mean(x1.*y);     % Correlation (Eq. 2.30) 
    lags(k) = k - lx;         % Compute lags (useful for plotting)
end




