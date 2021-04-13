clc;clear all;
load ('ECG60.mat')
N=length(x);
fs=250;
t=(1:N)/fs;
L=2;            %% Filter Order
fh=62/(fs/2);   %% High Frequency
fl=58/(fs/2);   %% Low Frequency
rs=50;          %% Maximum Stopband ripple
%%%%%%%
figure(1)
subplot(2,1,1)
plot(t,x,'k')
title('Sinyal ECG Belum Terfilter')
ylabel('ECG Domain waktu')
xlabel('waktu(s)')
%%%%%
spectrum1=abs(fft(x));
mag=spectrum1.^2;
frek1=(1:N)*fs/N;
subplot(2,1,2)
plot(frek1(1:N/2),mag(1:N/2),'k')
title('Spectrum ECG')
ylabel('Magnitudo')
xlabel('frekuensi')
%%%% FIltr IIR 
[b,a]=cheby2(L,rs,[fl fh],'stop');      %%Filter Type
y=filter(b,a,x)
%%%%%
figure(4)
subplot(2,1,1)
plot(t,y,'k')
title('ECG Filter IIR Bandstop Ordo 2 Chebysev 2 ')
ylabel('ECG Domain waktu')
xlabel('waktu(s)')
%%%
spectrum2=abs(fft(y));
mag2=spectrum2.^2;
subplot(2,1,2)
plot(frek1(1:N/2),mag2(1:N/2),'k')
title('Spectrum ECG')
ylabel('Magnitudo')
xlabel('frekuensi')
