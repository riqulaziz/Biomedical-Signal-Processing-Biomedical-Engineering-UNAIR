function [rxy lags] = crosscorr(x,y)
% Function to perform crosscorrelaton similar to MATLAB’s xcorr
% xan y must be colum vectors
% [rxy lags] = crosscorr(x,y)
% Inputs:
%   x and y
% Outputs
%   rxx   corsscorrelation
%   lags  vector of lags
%
ly = length(y);			% Get length of one signal (assume both the same length)
maxlags = (2*ly - 1); 		% Compute maxlags from data length
x = [zeros(1,ly-1) x zeros(1,ly-1)]; 	 % Zero pad signal x (arbitrary, could have been signal y)
for k = 1:maxlags
    x1 = x(k:k+ly-1);             	% Constructed shifted signal
    rxy(k) = mean(x1.*y);       	% Correlation (Eq. 2.30) 
    lags(k) = k - ly;               	% Compute lags (useful for plotting)
end
