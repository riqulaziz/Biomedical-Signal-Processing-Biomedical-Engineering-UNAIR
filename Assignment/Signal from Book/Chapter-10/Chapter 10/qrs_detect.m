function qrs_peaks = qrs_detect(ECG_data,fs)
% qrs_peaks = qrs_detect(ECG_data)
% Perform QRS detection  
% Inputs:  
%       ECG_data    Vector containing ECG signal
%        fs         Sampling freq.  optional default = 100; 
% Output: 
%       qrs_peaks   Vector of  indices of qrs peaks
%
if nargin < 2
    fs = 100;        % Default QRS
end
% Initialize filter coefficients
wn = [8 16]/(fs/2);                 % QRS bandpass filter freq
order = 4;                          % QRS bandpass filter order
[bn,an] = butter(order,wn);         % Bandpass QRS filter coefficients
ma = ones(20,1)/20;                 % Moving average filter coefficients
b = [1 0 0 0 0 0 -1];               % Derivative filter coefficients Skip = 4
% Filter ECG data
temp = filtfilt(bn,an,ECG_data);    % Apply bBandpass filter
temp = abs(filter(b,1,temp));       % Absolute value of derivative
peaks = filtfilt(ma,1,temp);        % Moving average over 200 msec
thresh = (max(peaks) + min(peaks))/2;  % Threshold to find peaks
% Find peaks from threshold corssings
qrs_peaks = find_peaks(peaks,thresh);   % Find all peaks       
qrs_peaks = qrs_peaks - 5;          % Correction factor.  

    
    