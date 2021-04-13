% Example 6.1heck  
%
clear all; close all;
w = .01:.011:1000;			% Define frequency vector
TF = 100*j*w./((1 +j*w).*(1+j*.1*w));	% Transfer function
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