%Norme Matriciali

clear
clc

A = rand(3)

% Norma 2
norma_2 = norm(A)
norma_2_formula = sqrt(max(abs(eig(A.' * A))))

% Norma 1
norma_1 = norm(A,1)
norma_1_formula = max(sum(abs(A)))

% Norma Infinito
norma_inf = norm(A,inf)
norma_inf_formula = max(sum(abs(A.')))

% Norma di Frobenius
norma_fro = norm(A,'fro')
norma_fro_formula = sqrt(sum(A.^2,'all'))
