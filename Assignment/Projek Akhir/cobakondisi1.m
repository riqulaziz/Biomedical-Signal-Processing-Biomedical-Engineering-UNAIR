clc;clear all;close all;
load('115m.mat')
sinyal=110+val(1,:);
N=length(sinyal);
fs=360;
t=(1:N)/fs;
frek=(1:N)*fs/N;
Wp=0.1/(fs/2);
Ws=0.9/(fs/2);
Rp=1;
Rs=60;
[n,Ws]=cheb2ord(Wp,Ws,Rp,Rs,'s');
[b,a]=cheby2(n,Rs,Ws);
[phi1,w] = phasez(b,a,N);
hasil=filter(b,a,sinyal);
spektrum1=abs(fft(hasil));
%%% Wraping Manual Signal 
wrap1=atan2(sin(hasil), cos(hasil));
figure(1)
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
figure(2)
plot(xu,'k') 
xlabel('Sample index') 
ylabel('Unwrapped phase in radians') 
title('The unwrapped phase')
%%%%Estimasi D
% for i=1:N
%     d(i)=max(xu(i)*fs/(2*pi*frek(i)));
%     dd(i)=round(d(i));
% end

d=max(hasil*fs/(2*pi*frek));

maushifting=-hasil;
xu1=maushifting;

for i=3077:N
    hasil1(i)=xu1(i-3076);
end

for i=1:N
    y(i)=sinyal(i)+xu1(i);
end

w = (fft(sinyal,fs));
z = (fft(xu1,fs));
% Determine the max value and max point.
% This is where the sinusoidal
% is located. See Figure 2.
[mag_x idx_x] = max(abs(w));
[mag_y idx_y] = max(abs(z));
% determine the phase difference
% at the maximum point.
px = angle(w(idx_x));
py = angle(z(idx_y));
phase_lag = py - px
abc = xcorr(sinyal,xu1);
[m,n] = max(abc);
besar_geser = length(sinyal) - n
% temp = xu1(1:besar_geser+1);
% xu1(1:besar_geser) = xu1((besar_geser+1):(2*besar_geser));
% xu1(n:length(sinyal)) = temp;
% xu1 = xu1 - sin(phase_lag);
% 
% figure(3)
% plot(t,sinyal,'k')
% hold on;
% plot(t,xu1,'r')
% plot(t,y,'g')
% legend('sinyal asli','hassil unwrap','sinyal hasil')
% hold off;
% 
% 
% 
% figure(4)
% plot(abc)
% title('Plot Cross Corellation')