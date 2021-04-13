clc
clear

f1=200;
f2=400;
N=512;
fs=1000;
time=N/fs;
t=linspace(0,time,N);
x=sin(2*pi*f1*t)+sin(2*pi*f2*t);
figure(1)
plot(t,x)
title('Sinyal sinusoid frekuensi 200 dan 400');
xlabel("Waktu(s)");
ylabel("Amplitudo(Volt)");
xlim([0 0.5]);
%------------- Fourier Transform-----------
y=abs(fft(x));
mag=y.^2;
frek=0:fs/N:(fs/2)-fs/N;
figure(2)
plot(frek,mag(1:N/2))
title("Sinyal sinusoid frekuensi 200 dan 400 dalam Fourier Transform");
xlabel("Frekuensi");
ylabel("Magnitude");