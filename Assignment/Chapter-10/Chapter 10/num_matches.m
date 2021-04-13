function matches = num_matches(x,m,max_err)
% Function to determine number of matches in data set of length m
%  Assumes x is evenly sampled at sample frequency fs
% Follows the procedure of Costa et al. 2005 including use of 
%   her default parameters
%  Outputs
%       matches  number of sequency matches found
%  Inputs
%       x           data
%       m           Number of points in template (2 or 3) 
%       max_err     maximum error
%
N = length(x);
matches = 0;        % Initialize match counter
for k = 1:N-m       % Template loop  
    for j = 1:N-m   % Test point(s) loop
        if k ~= j   % No self matches
            if abs(x(k) - x(j)) < max_err % Test first points
                if abs(x(k+1) - x(j+1)) < max_err % Test second points
                    if m == 2 || abs(x(k+2) - x(j+2)) < max_err % Test third points
                        matches = matches + 1;  % Increment match counter
                    end
                end
            end
        end
    end
 end
    
    

    