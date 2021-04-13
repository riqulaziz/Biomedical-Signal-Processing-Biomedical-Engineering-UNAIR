% Example 10.9 DFA Example
%
clear all; close all;
N = 10000;                      % Data length
% Construct signal
x = randn(1,N);                 % Random data
x = cumsum(x-mean(x));         % Remove mean and Integrate data
m = 2.^(2:13);                  % Segment lengths: 14 powers of 2
for n = 1:length(m);            % Loop for different segment lengths
    seg = m(n);                 % Segment length
    K = floor(N/seg)-1;     % Number of segments to detrend
    for k = 1:K
        ix = seg*(k-1) +1;
        y(ix:ix+seg) = detrend(x(ix:ix+seg)); % Detrend
    end
    disp(seg)
    F(n) = sqrt(mean(y.^2));    % Take RMS
end
m = log(m);
F = log(F);
plot(m,F,'b'); hold on;              % Plot data
xlabel('Log Length (m)','FontSize',14); % Labels
ylabel('Log F(m)','FontSize',14);
[x,y] = ginput(2);              % Get 2 point on the line
plot(x,y,'k','LineWidth',2);    % plot superimposed
slope = (y(2) - y(1))/(x(2) - x(1))  % Calcualte linear slope
