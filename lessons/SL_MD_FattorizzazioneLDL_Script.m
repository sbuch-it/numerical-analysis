% Fattorizzazione LDL

clear
clc

A = [4 1 2; 1 3 1; 2 1 2]

[L,D] = SL_MD_FattorizzazioneLDL(A)

[L_m,D_m] = ldl(A)

L * D * L.'
