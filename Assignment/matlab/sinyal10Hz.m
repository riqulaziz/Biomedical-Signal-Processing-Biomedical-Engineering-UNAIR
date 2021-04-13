clc
clear

t=linspace(0,100);

f=10; %hz
y=sin(2*pi*f*t);
yy=y+ 0.1*randn(1, length(t));
hold on
plot(t,y);
plot(t,yy);
hold off
snr1 =snr(y,yy)
var1=var(y)
var2=var(yy)
