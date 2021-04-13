clc
clear
fs=500;
Ts=1/fs;
x = xlsread('samples.csv');
A=x(:,1);
C=x(:,2);
N=length(A);
n=length(C);
B=[0:Ts:(N-1)/fs];
b=[0:Ts:(n-1)/fs];
% C=[B A];
% D=dec2hex(A);
% y=fft(abs(A));
% mag=y.^2;
% frek=(0:N-1)*Fs/N;
figure(1)
subplot(2,1,1)
plot(B,A)
subplot(2,1,2)
plot(b,C)

figure(2)
subplot(1,2,1)
plot(B,A)
subplot(1,2,2)
plot(b,C)

y=abs(fft(A));
mag=y.^2;
frek=0:fs/N:(fs/2)-fs/N;
figure(3)
plot(frek,mag(1:N/2))

y=abs(fft(C));
mag=y.^2;
frek=0:fs/N:(fs/2)-fs/N;
figure(4)
plot(frek,mag(1:N/2))
fc=10;

%----------filter IIR Highpass
Highpass=designfilt('highpassiir','FilterOrder',N,'PassbandFrequency',fc,'PassbandRipple',0.5,'SampleRate',fs);
yy=filter(Highpass,A);
figure(5)
plot(B,yy);