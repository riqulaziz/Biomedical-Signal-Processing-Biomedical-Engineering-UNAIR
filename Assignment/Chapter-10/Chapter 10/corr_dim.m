function Cr = corr_dim(y,r)
% Usage :  CR = cordim(x,tau,m,R)
% x is a single dimension time series
% tau is the delay for delay embedding
% m is the embedding dimension
% R is the radii used for evaluating the correlation integral

N=length(y(:,1));       % Get the total length of the embedded vector
for k1=1:length(r)     % For each r get number of nearest neighbors
    for k=1:(N-1); % For number of points get nearest neighbors
        repl = repmat (y(k,:),N,1);  % Copy y(k,:) int N rows
        dist = sqrt(sum((y-repl).^2,2));   % Distance between y(k,:) and all other y
        %dist(1:k) = [];         % Eleminate self match 
        nu_inside(k)= sum(dist < r(k1))-1;  % Sum numbefr of nearest neighbors
    end
    Cr(k1)=sum(nu_inside);  % Total nearest for this r
    disp([k1 Cr(k1)])
end
Cr=2*Cr/(N*(N-1));                % Get average count using Eq 10.21
