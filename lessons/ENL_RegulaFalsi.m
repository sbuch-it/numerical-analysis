function [x,err,esito] = ENL_RegulaFalsi(f,a,b,tol_a,Kmax)
    % Metodo Regula Falsi
    %
    % INPUT
    % f: funzione
    % a: estremo inferiore dell'intervallo
    % b: estremo superiore dell'intervallo
    % tol_a: tolleranza assoluta
    % Kmax: numero massimo di iterazioni
    % OUTPUT
    % x: stima della radice
    % err: errore sulla stima della radice
    % esito: 1 se si è raggiunta la convergenza, 0 altrimenti
    
    k = 1;
    x(k) = a - (f(a)/(f(b) - f(a))) * (b-a);
    err = abs(f(x(k)));
    
    while (err > tol_a) && (k < Kmax)
        if (f(x(k)) * f(a)) > 0
            a = x(k);
        else
            b = x(k);
        end
        k = k+1;
        x(k) = a - (f(a)/(f(b) - f(a))) * (b-a);
        err = abs(f(x(k)));
    end
    
    if err < tol_a
        esito = 1;
    else
       esito = 0; 
    end
    
end