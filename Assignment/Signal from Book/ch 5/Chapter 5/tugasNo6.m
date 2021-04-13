clc
clear
t=linspace(0,1,100);
h=2*(1-t);
x=t*0+1;
y=conv(x,h,'same');
subplot(2,1,1)
plot(t,x,'k')
title('grafik x(t)')
xlabel('time(s)')
ylabel('x(t)')
subplot(2,1,2)
plot(t,h,'k')
title('grafik h(t)')
xlabel('time(s)')
ylabel('h(t)')
figure(2)
plot(t,y,'k')
title('grafik y(t)')
xlabel('time(s)')
ylabel('y(t)')