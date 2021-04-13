g=9.8;
b= (-5/7)*g;
%initial conditions
x0=[3; %3 radians
    0]; %0 rad/s
%persamaan keadaan ball and plate system
%matriks keadaan
A=[0 1;
    0 0];
%matriks input 
B=[0;b];
%matriks keluaran
C=[1 0];
%matriks transmisi langsung
D=0;
%LQR
Q=[2 0; 0 0.05];
R=20;
K=lqr(A,B,Q,R);
%closed loop system
sys = ss((A-(B*K)),B,C,D);
step(sys)