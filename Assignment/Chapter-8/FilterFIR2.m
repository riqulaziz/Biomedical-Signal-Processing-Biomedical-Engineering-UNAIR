clc;clear all;
load ('ECG60.mat')
N=length(x);
fs=250;
t=(1:N)/fs;
L=50;           %% Filter Order
fc=40/fs;       %% Cut-off Frequency
%%%%%%%
figure(1)
subplot(2,1,1)
plot(t,x,'k')
title('Sinyal ECG Belum Terfilter')
ylabel('ECG Domain waktu')
xlabel('waktu(s)')
%%%%%
spectrum1=abs(fft(x));
mag=spectrum1.^2;
frek1=(1:N)*fs/N;
subplot(2,1,2)
plot(frek1(1:N/2),mag(1:N/2),'k')
title('Spectrum ECG')
ylabel('Magnitudo')
xlabel('frekuensi')
%%%%
%%% FIlter FIR %%%
for k = 1:L                         % Generate bandpass weighting function
    n = k-(L-1)/2 ;            % n = k - L1/2 where L1 even
    if n == 0
        b(k) = 2*fc;        % Case where denomonator is zero.
    else   
        b(k) = (sin(2*pi*fc*n))/(pi*n); %Filter impulse response
    end
end
bb=(blackman(L))';  %%Windowing Type
b = b.*bb;  	    % Apply Blackman window to filter coefficients;

%Buttord sanagt dibutuhkan 
y = (conv(x,b,'same'));
figure(3)
subplot(2,1,1)
plot(t,y,'k')
title('ECG Filter FIR LPF Ordo 50')
ylabel('ECG Domain waktu')
xlabel('waktu(s)')
%%%
spectrum2=abs(fft(y));
mag2=spectrum2.^2;
subplot(2,1,2)
plot(frek1(1:N/2),mag2(1:N/2),'k')
title('Spectrum ECG')
ylabel('Magnitudo')
xlabel('frekuensi')


