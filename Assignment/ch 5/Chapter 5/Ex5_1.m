% Example 5.1   Example to evaluate the responses of an unknown system to 
%  pulses of various widths. 
%
close all; clear all;
PW = [50 10 5 5; 100 25 10 2];  % Pulse widths in msec
fs = 1000;              % Assumed sample frequency
N = round(.2 *fs);      % Data length for 0.2 sec
t = (0:N-1)/fs;         % TIme vector for plotting
%
for k = 1:4             % Do four comparison plots
    subplot(2,2,k); hold on;        % Plot two by two
    x = [ones(1,PW(1,k)) zeros(1,N-PW(1,k))];  % Generate pulse signal
    y = unknown_sys5_1(x); 
    y = y/max(y);       % Normalize peak to 1.0
    plot(t,y,'k'); hold on; % Plot pulse response  
    x = [ones(1,PW(2,k)) zeros(1,N-PW(2,k))];  % Generate pulse signal
    y = unknown_sys5_1(x); 
    y = y/max(y);       % Normalize peak to 1.0
    plot(t,y,'k');  % Plot pulse response    
    axis([0 0.2 0 1.2]);
    xlabel('Time (sec)','FontSize',12); ylabel('x(t)','FontSize',12);
    text(.1,.35,'Pulse width:')
    text(.1,0.2,[num2str(PW(1,k)),' and ',num2str(PW(2,k)),' msec']);
end