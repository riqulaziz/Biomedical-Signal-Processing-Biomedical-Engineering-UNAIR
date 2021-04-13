   clear all; close all;
w = 3.141593:.1:31415.93;			% Define frequency vector
wn = 314.1593;                   % Define wn
delta = 4*wn;              % Define delta
TF = (w.^(2)-wn.^(2))./(w.^(2)-j*w*delta-wn.^(2));	% Transfer function
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
    ylim([-200 120]); grid on;