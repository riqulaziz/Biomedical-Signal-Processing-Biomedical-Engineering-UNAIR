% Example to demonstrate use and analysis of ECG signals
%
clear all; close all;
load ECG_10min;             % Load data
fs = 100;                   % Sampling frequency
N = length(ECG);            % Data length
qrs = qrs_detect(ECG);      % Detect QRS peaks
N_qrs = length(qrs);        % Number of QRS peaks in data
%
% Now measue two features of each ECG
% Set up range on either side of QRS peak
i_p_wave = round(0.25*fs);           % P wave range: 0.25 sec
i_qrst_wave = round(0.5*fs);         % QRS-T range: 0.5 sec
for k  = 1:N_qrs
    ix = qrs(k);                     % Get peak location
    i1 = max([1,ix-i_p_wave]);       % Limit indeces to 1 - N
    i2 = min([N,ix+i_qrst_wave]);
    y(k,:) = ECG(i1:i2);             % Isolate complex for 1 beat    
    f1(k) = sqrt(mean(y(k,:).^2));   % Feature 1 RMS
    f2(k) = mean(y(k,:));            % Feature 1 mean
end    
figure;
plot(f1,f2,'k*');                    % Plot features
xlabel('ECG RMS','FontSize',14);
ylabel('ECG Mean','FontSize',14);
figure; hold on;
n1 = 1;            % Counter for group 1 plots
n2 = 1;            % Counter for group 2 plots 
t = (1:length(y(1,:)))/fs;
for k = 100:N_qrs
    if f1(k) < 230 && n1 < 8
        plot(t,y(k,:),'k');       % Plot group 1
        n1 = n1 + 1;
    end
    if f1(k) > 230 && n2 < 8
        plot(t,y(k,:),':k','LineWidth',2);    % Plot group 2
        n2 = n2 + 1;
    end
end
 xlabel('Time (sec)','FontSize',14);
ylabel('ECG','FontSize',14); 
%  Additional code to look at subdivision of lower cluster.
figure; clf; hold on;
n1 = 1;            % Counter for group 1 plots
n2 = 1;            % Counter for group 2 plots 
t = (1:length(y(1,:)))/fs;
for k = 100:N_qrs
    if f2(k) > 30 && f1(k) < 230 && n1 < 8
        plot(t,y(k,:),'k');       % Plot group 1
        n1 = n1 + 1;
    end
    if f2(k) < 30 && f1(k) < 230 && n2 < 8
        plot(t,y(k,:),':k','LineWidth',2);    % Plot group 2
        n2 = n2 + 1;
    end
end
 xlabel('Time (sec)','FontSize',14);
ylabel('ECG','FontSize',14); 