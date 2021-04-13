% Example 6.8 check  Use MATLAB to plot the transfer function given 
%
clear all; close all;
w = .005:.1:500;
TF = 10*(1+2*j*w)./(j*w.*(1 - .04*w.^2 + .04*j*w));
Mag = 20*log10(abs(TF));
Phase = angle(TF)*360/(2*pi);
subplot(2,1,1);
  semilogx(w,Mag,'k');
  xlabel('Frequency (rad/sec)','FontSize',14);
  ylabel('|TF({\it\omega})| (dB)','FontSize',14);
subplot(2,1,2);
  semilogx(w,Phase,'k');
  xlabel('Frequency (rad/sec)','FontSize',14);
  ylabel('Phase({\it\omega}) (deg)','FontSize',14);  