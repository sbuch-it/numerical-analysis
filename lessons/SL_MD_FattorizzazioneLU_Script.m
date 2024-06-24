% Fattorizzazione LU

clear
clc

A = [4 1 2; 1 3 1; 0 1 2];

[L,U,P] = SL_MD_FattorizzazioneLU(A);
[L_m,U_m,P_m] = lu(A);

det(A) == det(U)
P * A
L * U
