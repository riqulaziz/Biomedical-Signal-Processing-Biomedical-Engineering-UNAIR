% Example 6.13  Use MATLAB to plot the transfer function given in
% by Eq. 6.56.
%
clear all; close all;
w = .01:.01:5000;
w1 = .1;
wn = 100;
delta = 0.05;
TF = 10*j*w./((1+j*w/w1).*(1 - (w/wn).^2 + j*2*delta*w/wn));
Mag = 20*log10(abs(TF));
Phase = angle(TF)*360/(2*pi);
  semilogx(w,Mag,'k');
  xlabel('Frequency (rad/sec)','FontSize',14);
  ylabel('|TF({\it\omega})| (dB)','FontSize',14);
  grid on;
% subplot(2,1,2);
%   semilogx(w,Phase,'k');
%   xlabel('Frequency (rad/sec)','FontSize',14);
%   ylabel('Phase({\it\omega}) (deg)','FontSize',14);  