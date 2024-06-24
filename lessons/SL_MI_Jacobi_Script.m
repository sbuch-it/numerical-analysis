% Metodo di Jacobi

clear
clc

A = [3 1 -1; 2 6 2; 1 2 4];
b = [3; 10; 7];

x_0 = zeros(size(b));
tol_r = sqrt(eps);
Kmax = 100;

[x,rho,e,nr,k] = SL_MI_Jacobi(A,b,x_0,tol_r,Kmax);

figure
plot(log10(e))
hold on
plot(log10(nr))
hold on
y = log10(rho) * ([1:k]-20) + log10(e(k));
plot(1:k,y,'r')

legend('Errore','Norma del Residuo','Jacobi');
title('Velocità di Convergenza del Metodo di Jacobi');

disp('Numero di condizionamento');
cond(A)

figure
semilogy(e);
hold on;
semilogy(nr);
legend('Errore', 'Norma del Residuo');
title('Condizionamento nel Metodo di Jacobi');

disp('Velocità asintotica di convergenza');
V = - log10(rho)
