% Example 8.3 Find the actual magnitude spectrum of the rectangular window
%   filter given by Eq. 8.13 for two different window lengths:  L = 17 
%   and L = 65.   Use a cutoff frequency of 400 Hz assuming a sampling
%   frequency of 1 kHz (i.e, a relative frequency of 0.4).
%
close all; clear all;
N = 256;                    % Numberf of points for plotting
fs = 1000;                  % Sampling freqeuncy
f = (1:N)*fs/N;             % Frequency vector for plotting
fc = 300/fs;                % Cutoff frequency (normalized)
L = [17 65];                % Filter lengths
for m = 1:2
    for k = 1:L(m)          % Generate sin(n)/n function Make symmetrical
        n = k-(L(m)-1)/2 ;        % n = k - L1/2 where L1 even
        if n == 0
            b(k) = 2*fc;    % Case where denomonator is zero.
        else   
   	        b(k) = sin(2*pi*fc*n)/(pi*n); %Filter impulse response
        end
    end 
    %hn = hn .* blackman(L+1)';
    H = fft(b,N);           % Calculate spectrum 
    subplot(1,2,m);         % Plot magnitude spectrum
    plot(f(1:N/2),abs(H(1:N/2)),'k');
    text(150,.9,['Length = ',num2str(L(m))],'FontSize',14);
        xlabel('Frequency (Hz)','FontSize',14);
        axis([0 600 0 1.2]);
    ylabel('B(f)','FontSize',14);
end

