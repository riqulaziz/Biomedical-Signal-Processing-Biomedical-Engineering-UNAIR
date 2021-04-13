%  Example 5.6  Find the output of the ECG signal after filtering by a
%  filter that preforms a 3-point running average. The ECG signal can be 
% found in file ecg_noise.mat as variable ecg.  fs = 125 Hz. 
%
clear all; close all;
load ecg_noise;               % Get ECG data in variable eeg
N = length(ecg);               % Number of data samples
fs = 125;                     % Sample frequency 125 Hz (given)
t = (1:N)/fs;                 % Construct time vector for plotting
h = [1 1 1]/3;                % Define h(t) 
out = conv(ecg,h,'same');     % Perform convolution
%
subplot(2,1,1);               
    plot(t,ecg,'k');        % Plot ECG input signal  before filter
    xlabel('Time(sec)','FontSize',14);
    ylabel('EEG','FontSize',14);
subplot(2,1,2);               % Plot ECG signal after filtering 
    plot(t,out,'k');
    xlabel('Time(sec)','FontSize',14);
    ylabel('Filtered','FontSize',14);
%
figure;
H = 20*log10(abs(fft(h,N)));          	% Determine Fourier transform of filter
N2 = round(N/2);     	% Plot only non-redundant points
f = (1:N)*fs/N;         	% Construct frequency vector for plotting 
plot(f(1:N2),H(1:N2),'k');
xlabel('Frequency (Hz)','FontSize',14); ylabel('EEG(dB)','FontSize',14);
