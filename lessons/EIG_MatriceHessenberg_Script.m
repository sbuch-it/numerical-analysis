
clear
clc

A = [8 1 0 0 1;
    1 5 2 1 0;
    0 2 10 1 1;
    0 1 1 6 2;
    1 0 1 2 -12];

[Q_matlab, H_matlab] = hess(A);

[Q,H] = EIG_MatriceHessenberg(A);

Q * Q.'; % eye(n)

Q * H * Q.' - A; % zeros(n)

% la matrice H simile alla matrice A è tri-diagonale,
% dato che matrici simili hanno gli stessi autovalori
% e applichiamo la successione di Sturm ad H
