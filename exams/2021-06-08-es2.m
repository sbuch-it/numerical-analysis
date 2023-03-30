% Esame 08/06/2021 es 2

close all
clear all
clc

B = [8 1 0 0 1;
    1 5 2 1 0;
    0 2 10 1 1;
    0 1 1 6 2;
    1 0 1 2 -12];

EIG_Gershgorin(B);

% dal teorema di Gershgorin non possiamo determinare
% il numero di autovalori tra 3 e 6, notiamo che la
% matrice B è simmetrica quindi sono tutti reali

% applichiamo la trasformazione di Hessenberg

[Q,H] = EIG_MatriceHessenberg(B);

I = Q * Q.' % = I dato che ortogonale
B
B_H = Q * H * Q.' % = B

% determiniamo gli autovalori di H che sono uguali
% agli autovalori di B per la trasformazione

alpha = diag(H);
beta = diag(H,-1);

N_eig_3_e_6 = EIG_SuccessioneSturm(alpha,beta,3) - EIG_SuccessioneSturm(alpha,beta,6)

[V,D] = eig(B)

p = -11;
Kmax = 300;
tol = sqrt(eps);

[lambda,x,gamma] = EIG_MetodoPotenzeInverse(B,p,tol,Kmax);
lambda
x
