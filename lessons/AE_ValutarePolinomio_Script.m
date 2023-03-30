% Calcolo del valore di un polinomio P(x) in un punto x
%
% INPUT
% a: vettore dei coefficienti, a = [an, ..., a0] 
% x: punto in cui valutiamo il polinomio
% OUTPUT
% sol = an * x^n + ... + a1 * x + a0

clear
clc

% Valutiamo P(x) = 5x^2 + 2x + 6 nel punto x = 1
a = [5 2 6];
x = 1;

disp('Algoritmo Non Ottimale');
tic
[sol] = AE_ValutarePolinomio(a,x);
toc
disp(strcat('sol_non_ottimale =', num2str(sol)));
disp(newline);

disp('Algoritmo di Horner');
tic
[sol] = AE_ValutarePolinomioHorner(a,x);
toc
disp(strcat('sol_horner =', num2str(sol)));
disp(newline);

disp('Funzione polyval di Matlab');
tic
sol = polyval(a,x);
toc
disp(strcat('sol_matlab =', num2str(sol)));
