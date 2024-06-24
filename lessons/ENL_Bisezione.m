function [x,err,esito] = ENL_Bisezione(f,a,b,tol_a,Kmax)
    % Metodo della Bisezione
    %
    % INPUT
    % f: funzione
    % a: estremo inferiore dell'intervallo
    % b: estremo superiore dell'intervallo
    % tol_a: tolleranza assoluta
    % Kmax: numero di iterazioni massime
    % OUTPUT
    % x: stima della radice
    % err: errore sulla stima della radice
    % esito: 1 se si è raggiunta la convergenza, 0 altrimenti
    
    k = 1;
    x(k) = (a + b)/2;
    err = abs(f(x(k)));
        
    while (err > tol_a) && (k < Kmax)
        if f(a) * f(x(k)) > 0
            a = x(k);
        else
            b = x(k);
        end
        x(k+1) = (a + b)/2;
        err = abs(f(x(k)));
        k = k+1;
    end
    
    if err < tol_a
        esito = 1;
    else
       esito = 0; 
    end
end