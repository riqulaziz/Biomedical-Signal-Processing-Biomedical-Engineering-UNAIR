function y = unknown_sys5_3(x)
% Fuction to simulate an unknown second-order system
%  Effective impulse response 40 msec.
%
fs = 1000;
w1 = 2*pi*.5;           % w1 = 10 Hz
w2 = 2*pi*1;           % w2 = 20 Hz.
t = 0:1/fs:5;            % Generate a time vector from 0 to 5 sec.
h = .05*(exp(-w1*t) - exp(-w2*t));  % Construct impulse response
y = filter(h,1,x);