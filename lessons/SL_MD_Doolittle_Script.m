% Fattorizzazione di Doolittle

clear
clc

A = [4 1 2; 1 3 1; 0 1 2]

[L,U] = SL_MD_Doolittle(A);
L * U
