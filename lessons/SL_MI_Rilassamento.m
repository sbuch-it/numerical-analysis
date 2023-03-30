function [x,rho,e,nr,k,omega] = SL_MI_Rilassamento(A,b,x_0,tol_r,Kmax)
    % Metodo di Rilassamento
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
    % omega: grado di libertà per la convergenza del metodo
    
    L = tril(A); % triangolare inferiore
    U = triu(A,1); % triangolare superiore, 0 sulla diagonale
    M = - inv(L) * U; % matrice di iterazione
    
    % controllo della convergenza del metodo
    rho = max(abs(eig(M)));
    if rho >= 1
        error('Il metodo non converge');
    end
    
    if issymmetric(A) && all(eig(A)) > 0
        disp('Matrice simmetrica e definita positiva');
        omega = 2/(1 + sqrt(1 - rho));
    else
        omega = SL_MI_RilassamentoOmega(A);
    end
    
    if omega <= 0 || omega >= 2
        error('Il metodo SOR non converge');
    end
    
    D = diag(diag(A)); % parte diagonale di A
    L1 = L - D;
    
    M = inv(D + omega * L1) * ((1 - omega) * D - omega * U);
    d = inv(D + omega * L1) * (omega * b);
    
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
