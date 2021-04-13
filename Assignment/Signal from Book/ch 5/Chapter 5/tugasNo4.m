clc
clear
load('unknown_impulse_response.mat')
ir=i_r;
x=1:500;
N=length(ir);
fs=100;
t=(1:N-1)/fs;
f = 0:fs/N:(fs/2)-fs/N;
y=ir(x);
y1=abs(fft(y));
mag=y1.^2;
figure(1)
subplot(2,1,1)
plot(t,y,'k')
title('Grafik Impulse response')
xlabel('t(s)')
ylabel('y(t)')
subplot(2,1,2)
plot(f,mag(1:N/2),'k')
title('Grafik Impulse response domain frekuensi')
xlabel('f(hz)')
ylabel('Amplitude')