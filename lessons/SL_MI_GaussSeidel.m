function [x,rho,e,nr,k] = SL_MI_GaussSeidel(A,b,x_0,tol_r,Kmax)
    % Metodo di Gauss Seidel
    %
    % INPUT
    % A: matrice del sistema lineare Ax=b
    % b: vettore dei termini noti del sistema lineare Ax=b
    % x_0: punto di innesco
    % tol_r: tolleranza relativa
    % Kmax: numero di iterazioni massime
    % OUTPUT
    % x: soluzione del sistema lineare Ax=b
    % rho: raggio spettrale della matrice di iterazione M
    % e: errore ad ogni passo del metodo iterativo
    % nr: norma del residuo ad ogni passo del metodo iterativo
    % k: numero di iterazioni eseguite dal metodo iterativo
    
    L = tril(A); % triangolare inferiore
    U = triu(A,1); % triangolare superiore, 0 sulla diagonale
    M = - inv(L) * U; % matrice di iterazione
    
    % controllo della convergenza del metodo
    rho = max(abs(eig(M)));
    if rho >= 1
        error('Il metodo non converge');
    end
    
    d = inv(L) * b;
    
    x = x_0;
    r = A * x - b; % residuo
    x_e = A\b; % soluzione esatta
    k = 0; % numero di iterazioni

    while (norm(r) > tol_r * norm(b)) && (k < Kmax)
        k = k + 1;
        x = M * x + d;
        r = A * x - b; % residuo
        e(k) = norm(x - x_e); % errore al passo k
        nr(k) = norm(r); % norma del residuo
    end

end
