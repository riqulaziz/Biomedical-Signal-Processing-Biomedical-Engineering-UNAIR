clc
clear
raw=xlsread('N2.csv');
raw1=raw(:,2);
signal=raw1';
fs=64;
L=length(signal);
t=0:1/fs:(L-1)/fs;
k=mean(signal)
l=rms(signal)
figure(1)
plot(t,signal)
title('Grafik denyut nadi orang normal')
xlabel('waktu')
ylabel('denyut nadi')
%%%%%%%%%%
y=abs(fft(signal));
mag=y.^2;
rata=mean(mag)
frek=0:fs/L:(fs/2)-fs/L;
figure(2)
plot(frek,mag(1:L/2))
xlim([-0.1 0.1])