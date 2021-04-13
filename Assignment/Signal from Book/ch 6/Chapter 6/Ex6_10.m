% Example 6.10  Use MATLAB to plot the transfer function given in Eq. 6.43
%
clear all; close all;
w = .057:.1:557;			% Define frequency vector
wn = 5.77;                   % Define wn
delta = 0.029;              % Define delta
TF = 1./(1 - (w/wn).^2 + j*2*delta*w/wn);	% Transfer function
Mag = 20*log10(abs(TF));		% Magnitude in dB
Phase = angle(TF)*360/(2*pi);	% Phase in deg.
subplot(2,1,1);
  semilogx(w,Mag,'k','LineWidth',1);			% Plot as log frequency
    xlabel('Frequency (rad/sec)','FontSize',14);
    ylabel('|TF({\it\omega})| (dB)','FontSize',14);
    grid on;
subplot(2,1,2);    
  semilogx(w,Phase,'k','LineWidth',1);
    xlabel('Frequency (rad/sec)','FontSize',14);
    ylabel('Phase({\it\omega})| (deg)','FontSize',14);
    ylim([-200 20]); grid on;