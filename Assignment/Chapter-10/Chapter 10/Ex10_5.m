% Example 10.5 Program to calculate and display the phase trajectory 
% of an ECG signal
%
clear all; close all;
load hr_data;         % Get data
hr = hr-mean(hr);       % Remove mean
m = 3;                  % Define parameters
tau = 40;    
y = delay_emb(hr,m,tau);   % Embed signal
plot3(y(:,1),y(:,2),y(:,3),'k');    % Plot trajectory
xlabel('y_1(t)','FontSize',14);
ylabel('y_2(t)','FontSize',14);
zlabel('y_3(t)','FontSize',14);
grid on;