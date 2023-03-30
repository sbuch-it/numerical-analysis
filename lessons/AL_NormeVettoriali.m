% Norme Vettoriali

clear
clc

v = rand(4,1)

% Norma 2
norma_2 = norm(v)
norma_2_formula = sqrt(v.' * v)

% Norma 1
norma_1 = norm(v,1)
norma_1_formula = sum(abs(v))

% Norma Infinito
norma_inf = norm(v,inf)
norma_inf_formula = max(abs(v))
