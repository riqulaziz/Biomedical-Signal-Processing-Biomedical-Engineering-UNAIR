% Example 5.2  Find the magnitude spectra of two pulses having a width of 
% 5 and 2 msec and a true discrete impulse signal. Assume a sample rate 
% of 1 kHz as in the last example, but make the signal length 1000 samples.
% Plot the spectra superimposed, but scale the maximum value of the magnitude 
% spectra to 1.0 for easy comparison and label the spectra.  As always, plot
% only the valid spectral points and label the plots.  
%
close all; clear all;
PW = [5, 2, 1];         % Pulse widths in msec
fs = 1000;              % Sample frequency (given)
N = 1000;               % Data length (given)
N2 = 500;               % Valid spectral points
f = (1:N)*fs/N;         % Frequency vector for plotting
%
for k = 1:3             % Do 3 spectral plots
    x = [ones(1,PW(k)) zeros(1,N-PW(k))];  % Generate pulse signal
    X = abs(fft(x));    % Find magnitude spectrum
    X = X/max(X);       % Normalize the spectra
    plot(f(1:N2),X(1:N2),'k'); hold on; % Plot pulse spectrum 
    text(300,X(300)+.05,[num2str(PW(k)),' msec']);  % Label curves
end
ylim([0 1.2]);
xlabel('Frequency (Hz)','FontSize',14); ylabel('|X(f)|','FontSize',14);
% Plot impulse phase spectrum
% figure;
% X = abs(fft(x));   % Repeat fft
% Phase = angle(X) * 360/(2*pi);
% plot(f(1:N2),Phase(1:N2),'k');
% xlabel('Frequency (Hz)','FontSize',14); ylabel('Phase(f)','FontSize',14);