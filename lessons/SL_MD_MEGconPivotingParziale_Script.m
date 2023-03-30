% Metodo di Eliminazione di Gauss con Pivoting Parziale

clear
clc

A = [0 2 0 -1; 2 -1 1 -2; 1 0 -2 1; -1 3 1 1];
b = [1; 0; 0; 4];

[x,s] = SL_MD_MEGconPivotingParziale(A,b)

x_matlab = A\b
