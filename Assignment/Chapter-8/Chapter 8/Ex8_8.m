% Example 8.8  Evaluate the two point central difference algorithm 
%   using different  skip factors
%
close all; clear all,
load eye;					% Get data
fs = 200;                   % Sampling frequency
Ts = 1/fs;					% Calculate Ts
t = (1:length(eye_move))/fs; % Time vector for plotting
L = [1 2 5 10];              % Filter skip factors
for skip = 1:4
    b = [1/(2*L(skip)*Ts) zeros(1,2*L(skip)-1) -1/(2*L(skip)*Ts)];
    der = conv(eye_move,b,'same');
    subplot(2,2,skip);
    plot(t,der,'k');
    text(1,22,['L = ',num2str(L(skip))],'FontSize',12);
    text(1,18,['Peak = ',num2str(max(der),2)],'FontSize',12);
    axis([0 2 -5 25]);
    xlabel('Time (sec)','FontSize',12);
    ylabel('Velocity (deg/sec)','FontSize',12);
end