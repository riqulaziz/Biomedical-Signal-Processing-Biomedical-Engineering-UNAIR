function peak_loc = find_peaks(peaks,threshold)
% Function that counts the number of discrete peaks above threshold value
%   in data "peaks"
%  Inputs
%    peaks         Filtered, rectified signal data used to find peaks
%    threshold     threshold for defining peak
% Outputs
%    peak_loc      location of peak

N = length(peaks);
k1 = 1;                         % Initialize index
for k = 1:10000                 % Exit loop via break            
    temp = find(peaks(k1:end) > threshold,1,'first'); % First point > threshold
    if isempty(temp) || k1 + temp > N
        break;
    else
       k1 = k1 + temp - 1;        % Update index
       mark_up(k) = k1;           % Then record peak position
    end
    temp = find(peaks(k1:end) < threshold,1,'first');   % Now look for neagative peak, but do nothng.
    if isempty(temp)|| k1 + temp > N
        break;
    else 
        k1 = k1 + temp - 1;
        mark_dwn(k) = k1;         % Then record peak position
        [~,i_peak] = max(peaks(mark_up(k):mark_dwn(k)));    % Find peak
        peak_loc(k) = i_peak + mark_up(k);   % Postion of peak
    end
end
if length(peak_loc) < 2
    disp('ERROR: Not Less than two peaks found by find_count_peaks')
end
% Np = 400;
% plot(peaks,'k'); hold on;
% plot([0 length(peaks)],[threshold threshold],'k');
% plot(mark_up,peaks(mark_up),'*k');
% plot(mark_dwn,peaks(mark_dwn),'*k')
% plot(peak_loc,peaks(peak_loc),'*k');
% xlim([0 600]);
% xlabel('N','FontSize',14);
% ylabel('Peaks (Arbitrary Units)','FontSize',14); 

