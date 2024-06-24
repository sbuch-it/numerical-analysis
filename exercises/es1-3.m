% Eserciziario - es1.3

clear
clc

A = [5 1 7 8; 6 7 9 5; 1 3 5 2; 4 2 2 8];

[L,U,P] = SL_MD_FattorizzazioneLU(A);

n = size(U,1);
determinante = 1;
for i=1 : n
    determinante = determinante * U(i,i);
end

determinante
det_matlab = det(A)
