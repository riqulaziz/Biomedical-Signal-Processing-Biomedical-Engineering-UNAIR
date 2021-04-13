% Ex 8.9 Use fir1 to design a bandpass filter with a passband between 50 
%   and100 Hz.  Use fir2 to design a double bandpass filter with one 
%   passband also between 50 and 100 Hz and a second passband between 
%   200 and 250 Hz. Make the order 65 for both filters.  Apply this to 
%    signal containing sinusoids at 75 and 225 Hz in -20 dB of noise.
%   Use sig_noise to generate the signal.   
%   Plot the desired and actual filter magnitude spectrum and the magnitude
%   spectrum of the signal before and after filtering.   
%
close all; clear all;
fs = 1000;					    % Sample frequency
N = 2000;                       % Number of points
Nf = 65;                         % Filter order
% Cutoff frequencies of single bandpass filter
fl1 = 50/(fs/2);                % First peak low cutoff freq.
fh1 = 100/(fs/2);			    % First peak high cutoff freq. 
fl2 = 150/(fs/2);               % Second peak low freq. cutoff
fh2 = 200/(fs/2);               % Second peak high freq. cutoff
%
x = sig_noise([75 175],-20,N);   % Generate noise waveform 
b1 = fir1(Nf,[fl1,fh1]);		% Design single bandpass filter.
% Design double bandpass filter
F = [0 fl1 fl1 fh1 fh1 fl2 fl2 fh2 fh2 1];  % Construct desired 
A = [0  0   1   1   0   0   1   1   0  0];  %   frequency characteristic
b2 = fir2(Nf,F,A);
[H1,f1] = freqz(b1,1,512,fs);	% Calculate filter1 frequency response
H2 = freqz(b2,1,512,fs);	    % Calculate filter2 frequency response

y1 = filter(b1,1,x);   % apply filter1
y2 = filter(b2,1,x);   % Apply filter2 
Xf = abs(fft(x));      % Get signal spectrum
Yf1 = abs(fft(y1));    % Get spectrum of filtered signals
Yf2 = abs(fft(y2));

f = (1:N)*fs/N;                     % Frequency vector for plotting
plot(f(1:N/2),Xf(1:N/2),'k');       % Plot spectrum before filtering
xlabel('Frequency (Hz)','FontSize',14);
ylabel('Magnitude','FontSize',14);
title('Original Signal Spectrum','FontSize',14);

figure;
subplot(2,2,1);        
plot(f1,abs(H1),'k');  % Plot the filter spectrum
xlabel('Frequency (Hz)','FontSize',14);
ylabel('Magnitude','FontSize',14);
xlim([0 300]);
subplot(2,2,3);
plot(f(1:N/2),Yf1(1:N/2),'k');      % Plot spectrum after filtering.
xlabel('Frequency (Hz)','FontSize',14);
ylabel('Magnitude','FontSize',14);
xlim([0 300]);
title('Single Bandpass Spectrum','FontSize',14);
%
subplot(2,2,2);        
plot(f1,abs(H2),'k');            % Plot doupble bandpass spectrum
xlabel('Frequency (Hz)','FontSize',14);
ylabel('Magnitude','FontSize',14);
xlim([0 300]);
subplot(2,2,4); hold on;
plot(f(1:N/2),Yf2(1:N/2),'k');      % Plot spectrum after filtering.
xlabel('Frequency (Hz)','FontSize',14);
ylabel('Magnitude','FontSize',14);
title('Double Bandpass Spectrum','FontSize',14);
xlim([0 300]);

