% Example 6.14  Applies an Transfer Function to 
%   the EEG data stored in eeg_data.
%
clear all, close all;
load eeg_data;
N = length(eeg);
fs = 50;                    %  Assume sample interval is 100 Hz
%
% Plot original data
t = (0:N-1)/fs;                 % Construct time vector
f= (0:N-1)*fs/N;            % Construct frequency vector
subplot(2,1,1);
    plot(t,eeg,'k');              % Plot time data
    xlabel('Time (sec)','FontSize',14);         % Label plot axes
    ylabel ('EEG','FontSize',14);
    title('A) Original Data','FontSize',14);
%
% Decompose data

Vin1 = (fft(eeg));             % Use only magnitude in this example
Vin = [Vin1(2:end) Vin1(1)];
TF = 1./(1 - .002*(2*pi*f).^2 + j*.003*2*pi*f);     % Now solve for output using X comp0onents as input
Vout = Vin1.*TF;
vout = real(ifft(Vout));           % Now recontruct time data and plot
subplot(2,1,2);
    plot(t,vout,'k');
    xlabel('Time (sec)','FontSize',14');         % Label plot axes
    ylabel ('EEG','FontSize',14');
    title('B) Output Signal','FontSize',14);
figure;
nf = fix(length(Vout)/2);               % Plot only non-redundant points
subplot(2,1,1)
    plot(f(1:nf),abs(Vin(1:nf)),'k');
    xlabel('Frequency (Hz)','FontSize',14');
    ylabel('|In (f)|','FontSize',14');
       title('A) Input Spectrum','FontSize',14);
subplot(2,1,2);    
    plot(f(1:nf),abs(Vout(1:nf)),'k');    
    xlabel('Frequency (Hz)','FontSize',14');         % Label plot axes
    ylabel ('|Out (f)|','FontSize',14');
       title('B) Output Spectrum','FontSize',14);
%       
figure;    % Plot the magnitude spectrum of TF
  Mag = 20*log10(abs(TF));
  semilogx(f(1:nf),Mag(1:nf),'k');
  xlabel('Frequency (Hz)','FontSize',14);
  ylabel('|TF({\it\omega})| (dB)','FontSize',14);
  xlim([0.05 30]); grid on;
% This problem could be expanded to include a detemination of the TF using
% the ratio of Vout/Vin but that was done in the previous section with
% sinusiods.  