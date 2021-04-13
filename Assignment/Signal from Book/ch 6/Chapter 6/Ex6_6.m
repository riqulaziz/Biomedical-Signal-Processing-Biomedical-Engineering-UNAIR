% Example 6.6  Use MATLAB to plot the transfer function found in Ex. 5.5  
%
clear all; close all;
w = .1:.1:1000;
TF = 1./(1 - .03*w.^2 + .01*j*w);
Mag = 20*log10(abs(TF));
Phase = unwrap(angle(TF))*360/(2*pi);
subplot(2,1,1);
  semilogx(w,Mag,'k');
  xlabel('Frequency (rad/sec)','FontSize',14);
  ylabel('|TF({\omega})| (dB)','FontSize',14);
  grid on;
subplot(2,1,2);
  semilogx(w,Phase,'k');
  xlabel('Frequency (rad/sec)','FontSize',14);
  ylabel('Phase({\omega}) (deg)','FontSize',14);  
  ylim([-200 20]);
   grid on;