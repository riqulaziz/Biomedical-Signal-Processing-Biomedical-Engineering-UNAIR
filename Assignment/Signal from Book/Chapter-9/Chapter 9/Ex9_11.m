% Example 9.11 Find the magnitude and phase spectrum of the muscle 
% model used in Ex 9.10.  Assumes data in vector sinout 
%
close all;
fs = 1000;                      % Sample frequency
N = length(simout);             % Get data length
t = (1:N)/fs;                   % Time vector for plotting
plot(t,simout,'k');             % Plot output
xlabel('Time(sec)','FontSize',14);
ylabel('Inpulse Response','FontSize',14);
figure;
N_2 = round(N/2);               % N/2 (valid spectral points)
f = (1:N)*fs/N;                 % Frequency vector 
w = 2*pi*f;                     % Frequency vector in radians
X  = fft(simout);
Mag = 20*log10(abs(X)); % Magnitude spectrum in dB
Phase = unwrap(angle(X))*320/(2*pi);    % Phase spectrum
subplot(2,1,1);
semilogx(w(1:N_2),Mag(1:N_2),'k','LineWidth',1);  % Plot magntude spectrum
xlabel('Frequency (rad/sec)','FontSize',14);
ylabel('|Out (dB)|','FontSize',14);
xlim([0 200]);
grid on;
subplot(2,1,2);
semilogx(w(1:N_2),Phase(1:N_2),'k','LineWidth',1);  % Plot magntude spectrum
xlabel('Frequency (rad/sec)','FontSize',14);
ylabel('Phase (deg)','FontSize',14);
grid on;
xlim([0 200]);