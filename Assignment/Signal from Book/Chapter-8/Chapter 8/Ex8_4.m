% Example 8.4 Apply a Blackman window to the rectangular window filters
%   used in Example 8.3.  (Note that the word window is used in two 
%   completely different contexts in the last sentence.)  Calculate and
%   display the magnitude spectrum of the windowed impulse functions.
%
close all; clear all;
N = 1024;                   % Number of points for plotting
fs = 1000;                  % Sampling freqeuncy
f = (1:N)*fs/N;             % Frequency vector for plotting
fc = 300/fs;                % Cutoff frequency (normalized)
L = [17 65];                % Filter lengths
for m = 1:2
    L1 = L(m)-1;            % Make L1 even
    for k = 1:L(m)          % Generate sin(n)/n function Make symmetrical
        n = k-L1/2 ;        % n = k - L1/2 where L1 even
        if n == 0
            b(k) = 2*fc;    % Case where denomonator is zero.
        else   
   	        b(k) = (sin(2*pi*fc*n))/(pi*n); %Filter impulse response
        end
    end 
    wb = blackman(L(m));
    b = b .* wb;
    H = fft(b,N);           % Calculate spectrum 
    subplot(2,2,m);         % Plot magnitude spectrum
        plot(f(1:N/2),abs(H(1:N/2)),'k');
        text(150,.9,['Length = ',num2str(L(m))],'FontSize',12);
        xlabel('Frequency (Hz)','FontSize',12);
        axis([0 600 0 1.2]);
        ylabel('B(f)','FontSize',12);
end
subplot(2,1,2);
wh = hamming(L(2));
plot(wh,'k'); hold on;
plot(wb,':k','LineWidth',2);
xlabel('k','FontSize',14); ylabel('w[k]','FontSize',12);
ylim([0 1.1]);
