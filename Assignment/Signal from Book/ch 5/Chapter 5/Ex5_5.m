% Ex 5.5  Find the convolution of the two signals used in Example 5.3
%
clear all; close all;
fs = 100;           % Sampling freqeuncy (given)
N = 150;            % Number of samples in 1.5 sec
x = [ones(1,N)];    % Define pulse signal
t = (0:N-1)/fs;     % Time vector for the exponential signal 
h = exp(-t);        % Define exponential signal
plot(t,h,'r'); hold on;  % Plot h as a check
y = conv(x,h)/fs;   % Convolve (full) and normalize
t = (0:length(y)-1)/fs; % Time vector for plotting 
plot(t,y,'k');
xlabel('Time (sec)','FontSize',14);
ylabel('y(t)','FontSize',14);
xlim([0 4])
