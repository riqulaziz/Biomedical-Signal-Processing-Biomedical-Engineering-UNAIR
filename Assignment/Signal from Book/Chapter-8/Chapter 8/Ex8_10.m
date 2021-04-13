% Ex 8.10 Design the double bandpass IIR filter similar to that used in Example 8.9 
%  with one passband also between 50 and100 Hz and a second passband 
%  between 150 and 200 Hz. Use a 12th-order IIR filter and compare 
%  the results with the 65-order FIR filter used in Example 8.9. 
%  Plot the frequency spectra of both filters superimposed for easy 
%  comparison.    
%
close all; clear all;
fs = 1000;					    % Sample frequency
N1 = 65;                        % FIR Filter order
N2 = 12;                        % IIR Filter order
fl1 = 50/(fs/2);                % First peak low cutoff freq.
fh1 = 100/(fs/2);			    % First peak high cutoff freq. 
fl2 = 150/(fs/2);               % Second peak low freq. cutoff
fh2 = 200/(fs/2);               % Second peak high freq. cutoff
%
% Design filter
F = [0 fl1 fl1 fh1 fh1 fl2 fl2 fh2 fh2 1];  % Construct desired 
A = [0  0   1   1   0   0   1   1   0  0];  %   frequency characteristic
b1 = fir2(N1,F,A);                % Construct filter
[b2 a2] = yulewalk(N2,F,A);
[H1,f1] = freqz(b1,1,512,fs);	    % Calculate filter1 frequency response
[H2 f2] = freqz(b2,a2,512,fs);
plot(f1,abs(H1),'k'); hold on; 
plot(f2,abs(H2),':k','LineWidth',2);
xlabel('Frequency (Hz)','FontSize',14);
ylabel('Magnitude','FontSize',14);
axis([0 300 0 1.2]);
% Sectio to test timing
x = rand(1,10000);      		% Generate random data
% Get IIR filter operation time
tic                     			% Restart clock
y = filter(b2,a2,x);     		% Filter using the FIR filter
toc                     		% Get FIR filter operation time
clear y
tic
y = filter(b1,1,x);
toc




