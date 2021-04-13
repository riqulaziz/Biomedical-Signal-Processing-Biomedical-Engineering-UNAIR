clc
clear
load('unknown_spectrum.mat')
N=length(Spec);
spec1=abs(fft(Spec));
fs=2000;
pt(1:2000:10000)=1;
ptt=abs(fft(pt));
y=conv(pt,Spec,'same');
ya=abs(fft(y));
figure(1)
plot(Spec,'k')
title('Grafik spectrum')
figure(2)
subplot(2,1,1)
plot(y,'k')
title('Grafik spectrum konvulusi 2000hz')
subplot(2,1,2)
plot(ya,'k')
title('Grafik spectrum konvulusi 2000hz domain frekuensi')
%%%
fs1=1000;
pt1(1:1000:10000)=1;
y1=conv(pt1,Spec,'same');
y2=abs(fft(y1));
figure(3)
subplot(2,1,1)
plot(y1,'k')
title('Grafik spectrum konvulusi 1000hz')
subplot(2,1,2)
plot(y2,'k')
title('Grafik spectrum konvulusi 1000hz domain frekuensi')