clc;clear all;close all;
fs=360;
Wp=0.1/(fs/2);
Ws=0.9/(fs/2);
Rp=1;
Rs=60;
[n,Ws]=cheb2ord(Wp,Ws,Rp,Rs,'s')
[b,a]=cheby2(n,Rs,Ws)
[H,w]=freqz(b,a,1024);
theta=angle(H);
thetauw=unwrap(theta);
figure(1)
plot(w/pi,theta)
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Phase')
xlim([-0.1 0.1])
figure(2)
plot(w/pi,thetauw)
xlim([-0.1 0.1])
xlabel('Normalized Frequency (\times\pi rad/sample)')
ylabel('Phase')
%%%

