function y = delay_emb(x,m,tau)
% Usage:  y = delay_emb(x,m,tau)
% delay_emb performs delay embedding on input vector x.  Output y is
% composed of m vectors made of delayed versions of x, where the delay is
% tau samples.
%
L = length(x)-(m-1)*tau;   % Length of output signals
y = zeros(m,L);            % Initialize output array for speed
for k = 1:m
    a = (1+tau*(k-1));     % Calculate first and last indices
    b = (a+L-1);
    y(k,1:L) = x(a:b);     % Build array
end
y = y';                    % Make column vector                                       