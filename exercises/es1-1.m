% Eserciziario - es1.1

clear
clc

x = input('Numero reale positivo: ');
m = input('Numero di bits per rappresentare la parte reale: ');
n = input('Numero di bits per rappresentare la parte decimale: ');

beta = 2;
[sol_int,sol_dec] = AE_BaseDecToBaseBeta(x,beta,m,n)
