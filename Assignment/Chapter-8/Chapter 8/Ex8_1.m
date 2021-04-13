%  Example 8.1
%   Plot the Frequency characteristics and impulse response
%    of a linear digital system with the given digital Transfer function
%
%   Assume a sampling frequency of 1kHz
close all; clear all;clc;
fs = 1000;					% Sampling frequency
N = 512;					% Number of points
%  Define a and b coefficients based on H(z)
a = [1 -.2 0.8]; %Denumerator 
b = [.2 .5];     %Numerator
% Plot the Frequency characteristic of H(z) using the fft
H = fft(b,N)./fft(a,N);             % Compute H(f)
%Discrete Fourier Transform awalnya ga bersatuan
Hm = 20*log10(abs(H));              % Get magitude in db
Theta = (angle(H))*360/(2*pi);      %   and phase in deg. 
f = (1:N)*fs/N;                     % Frequency vector for plotting
%Pake fs/N agar satuan cut off jadi Hz
subplot(2,1,1); 
plot(f(1:N/2),Hm(1:N/2),'k');		% Plot and label mag  H(f)
xlabel ('Frequency (Hz)','FontSize',14);
ylabel('|H(z)| (dB)','FontSize',14);
grid on;                            % Plot using grid lines
subplot(2,1,2); 
plot(f(1:N/2),Theta(1:N/2),'k');	% Repeat for phase 
xlabel ('Frequency (Hz)','FontSize',14);
ylabel('Phase (deg)','FontSize',14);
grid on;                            % Plot using grid lines

