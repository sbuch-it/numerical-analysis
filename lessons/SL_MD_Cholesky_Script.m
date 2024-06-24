% Fattorizzazione di Cholesky

clear
clc

A = [4 1 2; 1 3 1; 2 1 2];

A = A.' * A

% S = chol(A)

[S] = SL_MD_CholeskyRighe(A);
A_Righe = S * S.'

[S] = SL_MD_CholeskyColonne(A);
A_Colonne = S.' * S
