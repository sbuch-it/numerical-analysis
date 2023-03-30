function [lambda,x,gamma] = EIG_MetodoPotenze(A,tol,Kmax)
    % Metodo delle potenze
    %
    % INPUT
    % A: matrice
    % tol: tolleranza
    % Kmax: numero massimo di iterazioni
    % OUTPUT
    % lambda: autovalore dominante
    % x: autovettore di lambda
    % gamma: stima dell'autovalore
    
    k = 1;
    gamma(k) = 1;
    y = ones(size(A,1),1);
    
    m = 1;
    flag = true;
        
    while (flag) && (k < Kmax)
        k = k + 1;
        w = A * y;
        gamma(k) = w(m) / y(m);
        y = w / norm(w, Inf);
        [value, m] = max(abs(w));
        flag = ((abs(gamma(k) - gamma(k-1))/abs(gamma(k))) > tol);
    end
    lambda = gamma(k);
    x = y;
end