% Metodo del Gradiente

close
clear
clc

A = [4 1; 1 1];
b = [1; 1];
x_0 = [0.5; 0.5];
tol_r = sqrt(eps);
Kmax = 100;

[x,e,nr,k] = SL_MI_Gradiente(A,b,x_0,tol_r,Kmax);

disp('Numero di condizionamento');
cond(A)

figure
semilogy(e);
hold on;
semilogy(nr);
legend('Errore','Norma del Residuo');
title('Condizionamento nel Metodo del Gradiente');

A\b
x
