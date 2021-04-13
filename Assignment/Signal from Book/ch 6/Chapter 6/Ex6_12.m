% Example 6.12  Use MATLAB to plot the transfer function given in
% by Eq. 6.56.
%
clear all; close all;
w = .005:.1:500;
w1 = 0.5;            % First-order cufoff freq (rad)
wn = 5;              % Second-order resonant freq.
delta = 0.1;         % Damping factor
TF = 10*(1+j*w/w1)./(j*w.*(1 - (w/wn).^2 + j*2*delta*w/wn));
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