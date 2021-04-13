function [r,lags] = axcor(x,y);
% Function to calculate auto- or crosscorrelation
%  Inputs
%       x,y   input signals (one for autocorrelation)
%  Outputs
%        r   correlation (normalized to 1 for autocorrelation
%        lags   vector of lags useful in plotting
%
if nargin == 1
    y = x;  % Preform autocorrelaton
end
[N,lx] = size(x); 
if N > lx        % Rearange as row vector 
   x = x';						
   lx = N;
end  
[N,ly] = size(y);
if N > ly
   y = y';						
   ly = N;
end 
% Make y the longer array
if lx > ly
    temp = x;   % Swap x and y
    x = y;
    y = temp;
    temp = lx;
    lx = ly;
    ly = temp;
end
y = [zeros(1,ly) y zeros(1,ly)];    % Now double the length of y
for n = 1:2*ly-1                    % Shift over entier range
    r(n) = mean(x .* y(n:n+lx-1));
    lags(n) = n - ly + 1;
end
if nargin == 1
    r = r/max(r);   % Normalization
else
    r = r/sqrt(var(x)*var(y));
end    
r = fliplr(r);          % Reverse order
   
        