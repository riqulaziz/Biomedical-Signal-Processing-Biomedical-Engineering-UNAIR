function y = unknown_sys5_1(x)
% Fuction to simulate an unknown second-order system
%
A = [1.0 -1.9889 0.9890];
B = [.1594 .03067 .1534] * .0001;
y = filter(B,A,x);