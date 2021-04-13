clc
clear
load('100m (0).mat')
N =length(val);
fs=360;
t=0:1/fs:(N-1)/fs;
figure(1)
plot(t,val,'k')
title('Grafik Ecg Sebelum Noise PLI 50Hz')
xlabel('waktu(s)')
ylabel('amplitude')
%%%%
S=sin(2*pi*50*t);
noise= val+sin(2*pi*50*t);
B=abs(fft(noise));
mag=B.^2;
frek=0:fs/N:(fs/2)-fs/N;
figure(2)
subplot(2,1,1)
plot(t,noise,'k')
title('Grafik Ecg Sebelum Noise PLI 50Hz')
xlabel('waktu(s)')
ylabel('amplitude')
subplot(2,1,2)
plot(frek,mag(1:N/2),'k')
title('Grafik Ecg Sebelum Noise PLI 50Hz')
xlabel('frekuensi(hz)')
ylabel('magnitude')
xlim([49 51])
ylim([0 5e5]);
%%%%%%%%%
frek1=(0:N-1)*fs/N;
w=2*pi*frek1;
wn=2*pi*50;
delta = 4*wn;
TF = (w.^(2)-wn.^(2))./(w.^(2)-j*w*delta-wn.^(2));
Vout=B.*TF;
vout = real(ifft(Vout));
nf = fix(length(Vout)/2);
figure(3)
    subplot(2,1,1)
    plot(t,vout,'k');
    xlabel('Time (sec)','FontSize',14');         
    ylabel ('Amplitude ECG','FontSize',14');
    title('Grafik Ecg setelah di Filter','FontSize',14);
    xlim([0 10])
    ylim([900 1300]);
   subplot(2,1,2);    
    plot(frek1(1:nf),abs(Vout(1:nf)),'k');    
    xlabel('Frequency (Hz)','FontSize',14');         % Label plot axes
    ylabel ('Magnitude','FontSize',14');
    title('Grafik Dalam Domain Frekuensi','FontSize',14);
    xlim([49 51])
    ylim([0 100])