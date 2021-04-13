% Ex 10.2  Example to quntify the alpha activity in a 1 hr EEG signal
%
clear all; %close all;
load('EEG_FP1_F7');               % Get data
fs = 256;                   % Sample frequency (given)
N = length(val);            % EEG length
wl = 8 *2/fs;               % Define bandpass filter cutoff freq. 
wh = 13*2/fs;
[b,a] = butter(4,[wl,wh]);  % Define 4th-order bandpass filter
window_size = 10 * fs;      % 10 sec window size
overlap = 5 * fs;           % 5 sec overlap          
incr = window_size - overlap;   % Window increment
K = round(N/incr) - 2;      % Number of windows to analyse
for k = 1:K
    i_st = incr*k;          % Define window indices 
    i_end = i_st + window_size;
    rms_wind = sqrt(mean(val(i_st:i_end).^2));  % Overall rms 
    alpha = filter(b,a,val(i_st:i_end));    % Filter segment
    rms(k) = sqrt(mean(alpha.^2))/rms_wind;     % normaized RMS
    t(k) = mean([i_st,i_end])/fs;  % Window time (use center time)
end
plot(t/60,rms,'k');          % plot results
xlabel('Time (min)','FontSize',14);
ylabel('Alpha RMS','FontSize',14);

