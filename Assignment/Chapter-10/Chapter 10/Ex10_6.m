% Example 10.6  Program to calculate the correlation dimension of a 
% system given a single signal.
%
close all; clear all;
load  ex10_6_data.mat    % Load data
[rxx,lags] = axcor(x,x);    % Take autocorrelation function to determine delay
plot(lags,rxx);
xlim([-300 300]);
tau = input('Input value for tau: ');
tau = 100;           % From autocorrelation function
m = 3;               % Given
y = delay_emb(x,m,tau); % Use delay_emb to get the embedded vector
figure;
plot3(y(:,1),y(:,2),y(:,3),'.k');    % Plot trajectory
xlabel('y_1(t)','FontSize',14);
ylabel('y_2(t)','FontSize',14);
zlabel('y_3(t)','FontSize',14);
grid on;
r = exp(-3:0.05:-1);  % Define range of r
Cr = corr_dim(y,r);  % Correlation sum
plot(log(r),log(Cr),'k'); hold on;     % Plot correlation sum
%xlim([r(1) r(end)]);
xlabel('ln r','FontSize',14);
ylabel('C(r)','FontSize',14);
title('Select linear secgemt');
grid on;
[x,y] = ginput(2);
disp([x,y])
plot(x,y,'k','LineWidth',2);
slope = (y(2) - y(1))/(x(2) - x(1))

