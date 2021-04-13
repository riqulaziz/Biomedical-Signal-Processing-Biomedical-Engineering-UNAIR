% Example 6.7  Use MATLAB to plot the the transfer function of a respirator
%  airway system.

clear all; close all;
w = .001:.01:10000;             % Construct frequency vector
TF = (9.52*j*w.*(1+j*.0024*w))./(1 - .00025*(w.^2) + j*.155*w);   % Construct transfer function. 
Mag = 20*log10(abs(TF));
Phase = angle(TF)*360/(2*pi);
subplot(2,1,1);
  semilogx(w/(60*2*pi),Mag,'k');
  xlabel('Frequency (Hz)','FontSize',14);
  ylabel('|Q/P| (dB)','FontSize',14);
  %xlim([.0001 200]);
  grid on;
subplot(2,1,2);
  semilogx(w/(60*2*pi),Phase,'k');
  xlabel('Frequency (Hz)','FontSize',14);
  ylabel('Phase (deg)','FontSize',14);  
  %xlim([.0001 200]);
  grid on;