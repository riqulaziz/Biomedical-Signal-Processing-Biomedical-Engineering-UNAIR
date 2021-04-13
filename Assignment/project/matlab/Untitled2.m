clc
clear
stand=xlsread('ecgstanding.csv');
walk=xlsread('ecgwalking.csv');
jump=xlsread('ecgjump.csv');
C=jump(:,1);
B=walk(:,1);
A=stand(:,1);
fs=500;
N=length(stand);
t=[0:1/fs:(N-1)/fs];
a=std(A)
b=std(B)
c=std(C)
%%%%%
figure(1)
subplot(2,2,2)
plot(t,A)
title("grafik standing");
subplot(2,1,2)
plot(t,B)
title("grafik walking");
subplot(2,2,1)
plot(t,C)
title("grafik jumping");
%%%%%%%%
figure(2)
subplot(2,2,2)
histogram(A)
title("histogram standing");
subplot(2,1,2)
histogram(B)
title("histogram walking");
subplot(2,2,1)
histogram(C)
title("histogram jumping");

%%%
a1=abs(fft(A));
b1=abs(fft(B));
c1=abs(fft(C));
mag1=a1.^2;
mag2=b1.^2;
mag3=c1.^2;
frek=0:fs/N:(fs/2)-fs/N;
figure(3)
subplot(2,2,2)
plot(frek,mag1(1:N/2))
title("fft standing");
xlim([-50 250])
subplot(2,1,2)
plot(frek,mag2(1:N/2))
title("fft walking");
xlim([-50 250])
subplot(2,2,1)
plot(frek,mag3(1:N/2))
title("fft jumping");
xlim([-50 250])

