%  Ex 6.4 check
f2w = 2*pi/360;
x = .5* (cos(-70*f2w) +j*sin(-70*f2w));
TF = 20*x/(1+j*20*.3);
Mag = abs(TF)
Phase = angle(TF)/f2w