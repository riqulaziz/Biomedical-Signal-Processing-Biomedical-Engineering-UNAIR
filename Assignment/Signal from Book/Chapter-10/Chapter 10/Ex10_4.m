% Example 10.4 Plot the phase plane of a second-order system
%
clear all; close all;
fs = 1000;              % Sampling frequency
N = fs * 10;            % Sove for 10 sec
t = (1:N)/fs;           % Time vector
theta = atan2(.95,.3);
x = 1 - (exp(-3*t).*sin(9.5*t+theta))/0.95;
dx_dt = [diff(x) 0]*fs; %ilter(b,1,x);
hold on;
subplot(1,2,1);
    plot(t,x,'k'); 
    title('A) Time Plot','FontSize',14);
    xlabel('Time (sec)','FontSize',14); 
    ylabel('x(t)','FontSize',14);
    xlim([0 2]);
 subplot(1,2,2);
    plot(x,dx_dt,'k'); hold on
    plot([0 2],[0 0],'k'); 
    title('B) Phase Plot','FontSize',14);
    xlabel('x(t)','FontSize',14); 
    ylabel('dx(t)/dt','FontSize',14);
    xlim([0 1.5]); ylim([-8 8])