% Metodo di Eliminazione di Gauss con Pivoting

clear
clc

A = [0 2 0 -1; 2 -1 1 -2; 1 0 -2 1; 0 2 1 1];
b = [1; 0; 0; 4];

[x] = SL_MD_MEGconPivoting(A,b)

x_matlab = A\b
