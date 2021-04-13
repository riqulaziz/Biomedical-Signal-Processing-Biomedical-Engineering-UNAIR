% Example 5.7  Given the system impulse response below, find the output of the system
%    to a sawtooth wave (Figure 5.20)having a frequency of 400 Hz.  
%   Use both convolution and frequency domain approaches.  
%   Also find an plot on a dB-semilog scale the transfer function of the system.  
%  Since the sawtooth has a frequency of 3.2 Hz, we will use a sampling interval of 4 kHz  
% 
close all; clear all;
fs = 160;                       % Sample frequency
T = 1;                              % Time in sec;
t = (0:1/fs:T);                 % Time vector
N = length(t);                  % Determine length of time vector
x = sawtooth(20*t,.5);              % Construct input wave 
h = 5* exp(-5*t).*sin(100*t);
subplot(1,2,1)
plot(t,x,'k');
title('A) Input Signal','FontSize',12);
xlabel('Time (sec)','FontSize',14);  ylabel('x(t)','FontSize',14);
ylim([-1.2 1.2]);
subplot(1,2,2); 
plot(t,h,'k');
title('B) Impulse Response','FontSize',12);
xlabel('Time (sec)','FontSize',14);  ylabel('h(t)','FontSize',14);
% Calculate output using convolution.
y = conv(x,h);             % Calculate output 
figure;
subplot(2,1,1)
    plot(t,y(1:N),'k'); hold on; 
    title('Time Domain (convolution)','FontSize',12);
xlabel('Time (sec)','FontSize',14);  ylabel('y(t)','FontSize',14);
% Now calculate in the frequency domain.
TF = fft(h);            % Take Fourier transform of iimpulse response
X = fft(x);             % Take Fourier transform of input
Y = X.*TF;               % Take product in the frequency domain
y1 = ifft(Y);                % Take the inverse fourier transform to get y(t)
subplot(2,1,2)
plot(t,y1,'k');
title('Freqeuncy Domain (multiplication)','FontSize',12);
xlabel('Time (sec)','FontSize',14);  ylabel('y(t)','FontSize',14);

