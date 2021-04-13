clc 
clear


t = linspace(0,100);
f=10;
T=0.1;
x=sin(2*pi*f*t+0.25*pi);
y = sin(2*pi*t*f+0.25*pi) + 0.1* randn(1, length(t));
hold on
plot(t,x)
plot(t,y)
hold off
