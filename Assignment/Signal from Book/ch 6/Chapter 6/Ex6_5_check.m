%  Ex 6.8 check
f2w = 2*pi/360;
w = 20;          % Freqeuncy
x = 10* (cos(30*f2w) +j*sin(30*f2w));
TF = x/(1+-.02*w^2 +j*.2*w);
Mag = abs(TF)
Phase = angle(TF)/f2w