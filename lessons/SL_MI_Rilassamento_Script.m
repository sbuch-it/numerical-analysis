% Metodo di Rilassamento

close
clear
clc

A = [3 1 -1; 2 6 2; 1 2 4];
b = [3; 10; 7];

x_0 = zeros(size(b));
tol_r = sqrt(eps);
Kmax = 100;

[x,rho,e,nr,k,omega] = SL_MI_Rilassamento(A,b,x_0,tol_r,Kmax);

figure
plot(log10(e))
y = log10(rho) * ([1:k]-10) + log10(e(k));
hold on
plot(1:k,y,'r')
legend('log10(e)', 'Rilassamento');
title('Velocità di Convergenza del Metodo di Rilassamento');

disp('Numero di condizionamento');
cond(A)

figure
semilogy(e);
hold on;
semilogy(nr);
legend('Errore', 'Norma del Residuo');
title('Condizionamento nel Metodo di Rilassamento');
