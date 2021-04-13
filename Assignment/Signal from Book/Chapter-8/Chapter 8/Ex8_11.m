% Ex 8.11 Frequency response of four 8th-order lowpass filters
%
clear all; close all;
fs = 2000;			    % Sampling filter
n = 8;				    % Filter order
wn = 200/1000;		    % Filter cutoff frequency
rp = 3;			        % Maximum passband ripple
rs = 60;				% Stopband ripple
% Determine filter coefficients 
[b,a] = butter(n,wn);
[H,f] = freqz(b,a,256,fs);
subplot(2,2,1);
H = 20*log10(abs(H));	% Convert to dB
semilogx(f,H,'k');          % Plot spectrum in dB vs log freq.
axis([100 1000 -80 10]);
xlabel('Frequency (Hz)','FontSize',12);
ylabel('|X(f)| (dB)','FontSize',12);
title('Butterworth','FontSize',12);
[b,a] = cheby1(n,rp,wn);
[H,f] = freqz(b,a,256,fs);
subplot(2,2,2);
H = 20*log10(abs(H));	% Convert to dB
semilogx(f,H,'k');          % Plot spectrum in dB vs log freq.
axis([100 1000 -80 10]);
xlabel('Frequency (Hz)','FontSize',12);
ylabel('|X(f)| (dB)','FontSize',12);
title('Chebyshev I','FontSize',12);
[b,a] = cheby2(n,rs,wn);
[H,f] = freqz(b,a,256,fs);
subplot(2,2,3);
H = 20*log10(abs(H));	% Convert to dB
semilogx(f,H,'k');          % Plot spectrum in dB vs log freq.
axis([100 1000 -80 10]);
xlabel('Frequency (Hz)','FontSize',12);
ylabel('|X(f)|(dB)','FontSize',12);
title('Chebyshev II','FontSize',12);
[b,a] = ellip(n,rp,rs,wn);
[H,f] = freqz(b,a,256,fs);
subplot(2,2,4);
H = 20*log10(abs(H));	% Convert to dB
semilogx(f,H,'k');              % Plot spectrum in dB vs log freq.
axis([100 1000 -80 10]);
xlabel('Frequency (Hz)','FontSize',12);
ylabel('|X(f)| (dB)','FontSize',12);
title('Elliptic','FontSize',12);
