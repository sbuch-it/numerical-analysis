% Metodo di Eliminazione di Gauss senza Pivoting

clear
clc

A = [2 6 4; 1 0 2; 2 2 1];
b = [10; -1; 5];

x = SL_MD_MEGsenzaPivoting(A,b)

x_matlab = A\b
