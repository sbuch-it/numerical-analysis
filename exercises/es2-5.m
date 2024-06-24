% Eserciziario - es2.5

clear
clc

A = [4 1 0 1; 1 4 1 0; 0 1 4 1; 1 2 1 4];

b = [6; 6; 6; 8];

[Q,R] = SL_MD_FattorizzazioneQR(A);

x = inv(R) * (Q.' * b)

x_mat = A\b
