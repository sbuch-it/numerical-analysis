function [lambda,x,gamma] = EIG_MetodoPotenzeInverse(A,p,tol,Kmax)
    % Metodo delle potenze inverse
    %
    % INPUT
    % A: matrice
    % p: stima dell'autovalore
    % tol: tolleranza
    % Kmax: numero massimo di iterazioni
    % OUTPUT
    % lambda: autovalore dominante
    % x: autovettore di lambda
    % gamma: stima dell'autovalore
    
    M = (A - p * eye(size(A)));
    [L,U] = SL_MD_Doolittle(M);
    
    k = 1;
    gamma(k) = 1;
    y = ones(size(A,1),1);
    
    m = 1;
    flag = true;
    
    while (flag) && (k < Kmax)
        k = k + 1;
        y1 = SL_SostituzioneAvanti(L,y);
        w = SL_SostituzioneIndietro(U,y1);
        gamma(k) = w(m) / y(m);
        y = w / norm(w, Inf);
        [value, m] = max(abs(w));
        flag = ((abs(gamma(k) - gamma(k-1))/abs(gamma(k))) > tol);
    end
    lambda = p + 1 / gamma(k);
    x = y;
    
end