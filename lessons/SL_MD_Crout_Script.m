% Fattorizzazione di Crout

clear
clc

A = [3 5 -1; 9 13 0; 12 16 4]

[L,U] = SL_MD_Crout(A);
L * U
