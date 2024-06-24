% Esame 18/02/2020 es 1

close all
clear all
clc

A = [2 -3 1; -1 0 2; 0 -1 -6]

lambda_matlab = max(abs(eig(A.' * A)))

lambda = MetodoPotenze((A.' * A),sqrt(eps),200)

norm_2_matlab = norm(A)

norm_2 = sqrt(lambda)

function [lambda] = MetodoPotenze(A,tol,Kmax)
    k = 1;
    m = 1;
    g(k) = 1;
    y = ones(size(A,1),1);
    flag = true;
    while (flag) && (k < Kmax)
        k = k + 1;
        w = A * y;
        g(k) = w(m) / y(m);
        y = w / norm(w,Inf);
        [value, m] = max(abs(w));
        flag = (abs(g(k) - g(k-1)) / abs(g(k))) > tol;
    end
    lambda = g(k);
end
