% Metodo delle Potenze Inverse

clear
clc

A = [-7 -9 9; 11 13 -9; -16 -16 20];

% EIG_Gershgorin(A)

[autovettori,autovalori] = eig(A)

lambda_dominante_matlab = max(abs(eig(A)))

p = 18;
Kmax = 300;
tol = sqrt(eps);
[lambda,x,gamma] = EIG_MetodoPotenzeInverse(A,p,tol,Kmax);

lambda_dominante = lambda
autovettore_lambda_dominante = x
