clc
clear

 t =[0:0.001:100];
 f=5;
 %sinyal 1
 x=sin(8*pi*f*t); 
 subplot(4,1,1);
 plot(t,x)
 ylabel("sinyal pertama");
 %sinyal 2
 y=sin(5*pi*f*t+0.5*pi);
 subplot(4,1,2)
 plot(t,y)
 ylabel("sinyal kedua");
 %sinyal jumlah
 k=x+y;
 subplot(4,1,3)
 plot(x,k)
 ylabel("sinyal penjumlahan");
 
