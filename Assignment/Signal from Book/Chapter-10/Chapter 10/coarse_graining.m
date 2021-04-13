function y = coarse_graining(x,n)
% Function performs a coarse graining algorithm given by Valenciaet. al. (2009). 
% y = course_graining(x,L)
% Inputs
%   n     level of downsampling
%   x     is the original data
[B,A] = butter(6,1/n);          % Remove freq > 1fs/2n
y = filtfilt(B,A,x);            % Filter the data
y = y(1:n:end);                 % resample by n

       