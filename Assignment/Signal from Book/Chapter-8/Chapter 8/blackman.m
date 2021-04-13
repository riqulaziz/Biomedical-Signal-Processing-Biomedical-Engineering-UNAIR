function w = blackman(L)
% function w = blackman(L)
% Function to calculate a Blackman window N points long
%
n = (1:L);
w = 0.42 - 0.5*cos(2*pi*n/(L-1)) + 0.08*cos(4*pi*n/(L-1));


