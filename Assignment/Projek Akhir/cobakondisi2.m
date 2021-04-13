clc;clear all;close all;
load('115m.mat')
sinyal=110+val(1,:);
N=length(sinyal);
fs=360;
t=(1:N)/fs;
frek=(1:N)*fs/N;
%%%
figure(1)
subplot(2,2,[3 4])
plot(t,sinyal,'k')
title('ECG Belum di filter')
xlabel('time(s)')
ylabel('Amplitude')
subplot(2,2,1)
plot(t,sinyal,'k')
title('ECG Belum di filter 40-50 s')
xlabel('time(s)')
ylabel('Amplitude')
xlim([40 50])
awal=abs(fft(sinyal));
subplot(2,2,2)
plot(frek,awal,'k')
title('Domain Frekuensi Sinyal')
xlabel('Frekuensi(Hz)')
xlim([-10 40])
%%%%
Wp=0.1/(fs/2);
Ws=0.9/(fs/2);
Rp=1;
Rs=60;
[n,Ws]=cheb2ord(Wp,Ws,Rp,Rs,'s')
[b,a]=cheby2(3,Rs,Ws);
[phi1,w] = phasez(b,a,N);
hasil=filter(b,a,sinyal);
%%%
figure(2)
subplot(2,2,1)
plot(t,hasil,'k')
title('ECG Setelah Melewati Chebysev 2')
xlabel('time(s)')
ylabel('Amplitude')
spektrum1=abs(fft(hasil));
subplot(2,2,2)
plot(frek,spektrum1,'k')
title('Domain Frekuensi Sinyal')
xlabel('Frekuensi(Hz)')
xlim([-10 40])
subplot(2,2,[3 4])
plot(t,sinyal,'k')
hold on
plot(t,hasil,'r')
title('Gabungan 2 sinyal')
xlabel('time(s)')
ylabel('Amplitude')
hold off
%%%
%%% Wraping Manual Signal 
wrap1=atan2(sin(hasil), cos(hasil));
figure(3)
subplot(2,1,1)
plot(t,wrap1,'k') 
xlabel('Sample index') 
ylabel('Wrapped phase in radians') 
title('The wrapped phase')
%%%
tic   %start measuring the execution time
K=0; 
increments = zeros(size(wrap1)); 
for i=2:length(wrap1) 
    difference = wrap1(i)-wrap1(i-1); 
    if difference > pi 
        K = K - 2*pi; 
    elseif difference < -pi 
        K = K + 2*pi; 
    end 
    increments(i) = K; 
end 
xu = wrap1 + increments;
toc      %finish measuring the execution time 
subplot(2,1,2)
plot(t,xu,'k') 
xlabel('Sample index') 
ylabel('Unwrapped phase in radians') 
title('The unwrapped phase')
%%%
for i=1:N
    d(i)=abs(phi1(i)*fs/(2*pi*0.22));
end
dd=max(d);
maushifting=-xu;
xu1=maushifting;
sinyal2=circshift(xu1,-round(dd));
for i=1:N
    y(i)=sinyal(i)+sinyal2(i);
end
figure(4)
plot(t,sinyal,'k')
hold on;
plot(t(1:N),sinyal2,'r')
plot(t(1:N),y,'g')
% xlim([40 50])
legend('sinyal asli','hassil unwrap','sinyal hasil')
xlabel('time(s)')
ylabel('Amplitude')
title('Sinyal Hasil Terfilter')
hold off;
%%%
NilaiSNR=snr(y,sinyal-y)
