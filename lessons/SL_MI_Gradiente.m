function [x,e,nr,k] = SL_MI_Gradiente(A,b,x_0,tol_r,Kmax)
    % Metodo del Gradiente
    %
    % INPUT
    % A: matrice simmetrica e definita positiva o qualsiasi
    % b: vettore dei termini noti
    % x_0: punto di innesco
    % tol_r: tolleranza relativa
    % Kmax: numero di iterazioni massime
    % OUTPUT
    % x: soluzione del sistema lineare Ax=b
    % rho: raggio spettrale della matrice di iterazione M
    % e: errore ad ogni passo del metodo iterativo
    % nr: norma del residuo ad ogni passo del metodo iterativo
    % k: numero di iterazioni eseguite dal metodo iterativo
    
    [R,FLAG] = chol(A);
    if FLAG > 0
        disp('La matrice A non è simmetrica e definita positiva');
        A = A.' * A;
        b = A.' * b;
    end
    
    x = x_0;
    r = A * x - b; % residuo
    x_e = A\b; % soluzione esatta
    k = 0; % numero di iterazioni
    
    while (norm(r) > tol_r * norm(b)) && (k < Kmax)
        k = k + 1;
        alpha = ((r.') * r) / ((r.') * A * r);
        x = x - alpha * r;
        r = A * x - b; % residuo
        e(k) = norm(x - x_e); % errore al passo k
        nr(k) = norm(r); % norma del residuo
    end
    
end