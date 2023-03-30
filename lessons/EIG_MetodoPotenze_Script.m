% Metodo delle Potenze

clear
clc

A = [-7 -9 9; 11 13 -9; -16 -16 20];

[autovettori,autovalori] = eig(A)

A_x = A * autovettori
lambda_x = autovettori * autovalori

lambda_dominante_matlab = max(abs(eig(A)))

Kmax = 300;
tol = sqrt(eps);
[lambda,x,gamma] = EIG_MetodoPotenze(A,tol,Kmax);

lambda_dominante = lambda
autovettore_lambda_dominante = x
