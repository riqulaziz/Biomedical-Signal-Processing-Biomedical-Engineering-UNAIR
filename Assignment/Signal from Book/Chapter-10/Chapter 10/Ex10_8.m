% Example 10.8 Evaluate MSE on Gaussian random data
% 
clear all; close all;
N = 10000;          		% Data length
%
x = randn(1,10000);     	% Construct random data set
r = 0.15 * std(x);          % Determine error tolerancemax_err = .15;      % Error factor 
msf = 20;                   % Maximum scale factor
for k = 1: msf
     if k == 1
         x_scaled = x;                      % Original (unscaleed) data
     else
        x_scaled = coarse_graining(x,k);    % Scale data
     end   
     B = num_matches(x_scaled,2,r);         % Determine two-component matches
     A = num_matches(x_scaled,3,r);         % Determine three-component matches
     samp_entropy(k) = -log(A/B);           % Calculate sample entropy
     disp(['Scale factor: ',num2str(k)])    % Indicates progress
end
plot(samp_entropy,'*k');
xlabel('Scale Factor','FontSize',14);
ylabel('Entropy','FontSize',14);
