function [x,err,esito] = ENL_NewtonDifferenze(f,x_0,tol_a,Kmax)
    % Metodo di Newton alle Differenze
    %
    % INPUT
    % f: funzione
    % x_0: punto di innesco
    % tol_a: tolleranza assoluta
    % Kmax: numero massimo di iterazioni
    % OUTPUT
    % x: stima della radice
    % err: errore sulla stima della radice
    % esito: 1 se si è raggiunta la convergenza, 0 altrimenti
    
    k = 1;
    x(k) = x_0;
    err = abs(f(x(k)));
    
    while (err > tol_a) && (k < Kmax)
        if x(k) == 0
            h = sqrt(eps);
        else
            h = sqrt(eps) * x(k);
        end
        r = f(x(k) + h) / h;
        k = k + 1;
        x(k) = x(k-1) - f(x(k-1)) / r;
        err = abs(f(x(k)));
    end
    
    if err < tol_a
        esito = 1;
    else
       esito = 0; 
    end
    
end