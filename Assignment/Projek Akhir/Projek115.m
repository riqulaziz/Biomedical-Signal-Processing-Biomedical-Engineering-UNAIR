clc;clear all;close all;
load('115m.mat')                        %Loading data
sinyal=110+val(1,:);                    %Pemilihan Data
N=length(sinyal);                       %Panjang data
fs=360;                                 %Frekuensi Sampling
t=(1:N)/fs;                             
frek=(1:N)*fs/N;                        
kk=linspace(0,0,N);                     %Baseline
%%%
figure(1)
subplot(2,2,[3 4])
plot(t,sinyal,'k')
hold on;plot(t,kk,'r')
title('ECG Belum di filter')
legend('sinyal asli','baseline')
xlabel('time(s)')
ylabel('Amplitude');hold off;
subplot(2,2,1)
plot(t,sinyal,'k')
hold on;plot(t,kk,'r')
title('ECG Belum di filter 40-50 s')
xlabel('time(s)')
ylabel('Amplitude')
xlim([40 50]);hold off;
awal=abs(fft(sinyal));                  %Spektrum Gel Domain Frek
subplot(2,2,2)
plot(frek,awal,'k')
title('Domain Frekuensi Sinyal')
xlabel('Frekuensi(Hz)')
xlim([-10 40])
%%%%
Wp=0.1/(fs/2);                          %PassBand
Ws=0.9/(fs/2);                          %StopBand
Rp=1;                                   %Ripple Pass Band
Rs=60;                                  %Ripple Stop Band
[n,Ws]=cheb2ord(Wp,Ws,Rp,Rs,'s')   %PenentuFrekStopBandBaru&OrdeFilter
[b,a]=cheby2(3,Rs,Ws);             %Menentukan Koef Filter Cheby 2
[phi1,w] = phasez(b,a,N);               %Menentukan Fase Gel.
hasil=filter(b,a,sinyal);    %Menggunakan koefisien filter pada sinyal
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
wrap1=atan2(sin(hasil), cos(hasil));        %WrappingSinyal
figure(3)
subplot(2,1,1)
plot(t,wrap1,'k') 
xlabel('Sample index') 
ylabel('Wrapped phase in radians') 
title('The wrapped phase')
%%%
tic   %start measuring the execution time
K=0; 
increments = zeros(size(wrap1));            %MenentukanWrap
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
    d(i)=abs(phi1(i)*fs/(2*pi*0.22));       %Penentuan rumus d
end
dd=max(d);                                  %MenentukanMaksMatriks d
maushifting=-xu;                            %Membalik Sinyal
xu1=maushifting;
sinyal2=circshift(xu1,-round(dd));          %ShiftingSinyal
for i=1:N
    y(i)=sinyal(i)+sinyal2(i);              %Filtering Wander Baseline
end
figure(4)
subplot(2,1,1)
plot(t,sinyal,'k')
hold on;
plot(t(1:N),sinyal2,'r')
plot(t(1:N),y,'g')
% xlim([40 50])
legend('sinyal asli','hassil unwrap','sinyal hasil')
xlabel('time(s)')
ylabel('Amplitude')
title('Sinyal Komparasi')
hold off;
subplot(2,1,2)
plot(t,sinyal,'k')
hold on;
plot(t(1:N),sinyal2,'r')
plot(t(1:N),y,'g')
xlim([40 50])
xlabel('time(s)')
ylabel('Amplitude')
hold off;
%%%
figure(5)
subplot(2,1,1)
plot(t,y,'k')
hold on
plot(t,kk,'r')
legend('sinyal Filter','Baseline')
xlabel('time(s)')
ylabel('Amplitude')
title('Sinyal Hasil Filter')
hold off
subplot(2,1,2)
plot(t,y,'k')
hold on
plot(t,kk,'r')
xlim([40 50])
xlabel('time(s)')
ylabel('Amplitude')
hold off
%%%
NilaiSNR=snr(y,sinyal-y)                     %Menentukan Nilai SNR
