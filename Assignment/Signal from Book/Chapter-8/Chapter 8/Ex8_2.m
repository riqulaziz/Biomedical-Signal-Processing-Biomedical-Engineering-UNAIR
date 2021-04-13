% Example 8.2 Compute the step response of the system defined
% by Eq. 8.21
clear all; close all;
fs = 1000;					% Sampling frequency
N = 2000;					% Number of points
%  Define a and b coefficients based on H(z)
a = [1 -.2 0.8];
b = [.2 .5];
% Compute the Step Response
x = [0, ones(1,N-1)];		    % Generate an step function
b_sum = conv(x,b,'same');        % Generate first term
y = [0 0 b_sum(1)];            % Initialize y(1) with padding
tic;
for k = 1:N
    y(k+2) = b_sum(k) - (y(k+1)*a(2) + y(k)*a(3));
end
y = y(2:N+1);               % Shift y to account for padding
toc;
tic;
y1 = filter(b,a,x);				% Apply b and a to impulse using Eq. 4-6 
toc
t = (1:N)/fs;
plot(t(1:60),y(1:60),'k');	hold on;	% Plot only the first 60 points for clarity
plot(t(1:60),y1(1:60),':b');		% Plot only the first 60 points for clarity
xlabel('Time (sec)','FontSize',14);			% Labels
ylabel ('Step Response','FontSize',14);
