% Example 8.5 Apply a rectangular window lowpass filter to the noisey
%   respiratory signal. Show the signal before and after
%   filtering with 65 coefficients.  Use a Blackman
%   window to truncate the filter's impulse response.  
%
close all; clear all;
load Resp;                  % Get data includes sampleing freqeuncy (fs)
N = length(resp);           % Get data length
fs = 12.5;                  % Sample freqeuncy
t = (1:N)/fs;               % Time vector for plotting
L = 65;                     % Filter lengths
fc = 1/fs;                  % Cutoff frequency: 1.0 Hz
plot(t,resp+1,'k'); hold on;     % Plot original data
for k = 1:L                 % Generate sin(n)/n function Make symmetrical
    n = k-(L-1)/2 ;            % n = k - L1/2 where L1 even
    if n == 0
        b(k) = 2*fc;        % Case where denomonator is zero.
    else   
        b(k) = (sin(2*pi*fc*n))/(pi*n); %Filter impulse response
    end
end 
b = b.*blackman(L);          % Apply Blackman window
%
y = conv(resp,b,'same');     % Apply filter
plot(t,y,'k');
ylim([0 2.2]);
xlabel('Time (sec)','FontSize',14);
ylabel('Respiration (arbitrary  units)','FontSize',14);
