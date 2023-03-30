% Metodo del Gradiente Coniugato

clear
clc

A = [4 1; 1 1];
b = [1; 1];
x_0 = [0.5; 0.5];
tol_r = sqrt(eps);
Kmax = 100;

[x,e,nr,k] = SL_MI_GradienteConiugato(A,b,x_0,tol_r,Kmax);

disp('Numero di condizionamento');
cond(A)

figure
semilogy(e);
hold on;
semilogy(nr);
legend('Errore', 'Norma del Residuo');
title('Condizionamento nel Metodo del Gradiente Coniugato');

% Confronto tra Gradiente e Gradiente Coniugato

[x,e_g,nr_g,k] = SL_MI_Gradiente(A,b,x_0,tol_r,Kmax);
x
[x,e_gc,nr_gc,k] = SL_MI_GradienteConiugato(A,b,x_0,tol_r,Kmax);
x

figure
semilogy(e_g)
hold on
semilogy(e_gc)
legend('Gradiente','Gradiente Coniugato');
title('Confronto Errore tra Gradiente e Gradiente Coniugato');

figure
semilogy(nr_g)
hold on
semilogy(nr_gc)
legend('Gradiente','Gradiente Coniugato');
title('Confronto Residuo tra Gradiente e Gradiente Coniugato');
