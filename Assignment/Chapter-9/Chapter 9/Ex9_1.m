% Ex9_1 Program to approximate digital simulation of a 
%  first-order system
%
clear all; close all;
Ts = 0.010;           % Step size 10 msec
N = 100;              % Number of steps (Tt = 1 sec)
w1 = 5*Ts;              % Cutoff frequency of first-order system
out(1) = 0;                 % Initial condition if integrator
x = [0, ones(1,N-1)];   % Inputs (step function)
y = zeros(N);           % Output array
for k = 1:N-1
    e(k) = x(k) - out(k);
    out(k+1) = w1*e(k) + out(k);
end
t = (1:N)*Ts;           % Time vector for plotting
plot(t,out,'k'); hold on;
plot(t(1:N-1),e,'k:','LineWidth', 2);
plot([0 1],[0 0],'k');          % draw zero line
xlabel('Time (sec)','FontSize',14);
ylabel('y(t), e(t)','FontSize',14);
ylim([-.1 1.1]);
