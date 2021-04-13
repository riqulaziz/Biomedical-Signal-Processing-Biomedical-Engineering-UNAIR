%This program is to simulate the wrapping process 
clc; close all; clear 
%The number of samples in the signal 
N=512;       
n=0:N-1; 
fo=1/512;   
load('115m.mat')
sinyal=150+val(1,:);
N=length(sinyal);
fs=360;
t=(1:N)/fs;
% The signal x whose amplitude exceeds the range [-pi,pi] 
x = sinyal;  
plot(x) 
xlabel('Sample index') 
ylabel('Original phase in radians') 
title('The signal x whose amplitude exceeds the range [-\pi,\pi]') 
%Calculating the wrapped signal using the four quadrant arctangent function 
Wp=0.1/(fs/2);
Ws=0.9/(fs/2);
Rp=1;
Rs=60;
[n,Ws]=cheb2ord(Wp,Ws,Rp,Rs,'s');
[b,a]=cheby2(n,Rs,Ws);
hasil=filter(b,a,sinyal);
xw = atan2(sin(hasil), cos(hasil)); 
figure, plot(xw) 
xlabel('Sample index') 
ylabel('Wrapped phase in radians') 
title('The wrapped phase')  
  
%Unwrap the signal xw(n)
tic   %start measuring the execution time
K=0; 
increments = zeros(size(xw)); 
for i=2:length(xw) 
    difference = xw(i)-xw(i-1); 
    if difference > pi 
        K = K - 2*pi; 
    elseif difference < -pi 
        K = K + 2*pi; 
    end 
    increments(i) = K; 
end 
xu = xw + increments;
toc      %finish measuring the execution time 
figure, plot(xu) 
xlabel('Sample index') 
ylabel('Unwrapped phase in radians') 
title('The unwrapped phase')

frek=(1:N)*fs/N;
for k=(1:length(xu))
   d(k)=max((xu(k)/2*pi*k)*fs);
end

d
