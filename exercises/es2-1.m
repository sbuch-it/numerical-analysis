% Eserciziario - es2.1

clear
clc

A = [10 3 0 0;
    3 10 3 0;
    0 3 10 3;
    0 0 3 10];

b = [1; 2; 3; 4];

x_0 = zeros(4,1);
tol_r = 10e-6;
Kmax = 100;

[x,rho,e,nr,k,omega] = SL_MI_Rilassamento(A,b,x_0,tol_r,Kmax);

x = x
x_mat = A\b
omega
