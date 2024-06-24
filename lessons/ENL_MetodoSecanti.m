function [x,err,esito] = ENL_MetodoSecanti(f,x_0,x_1,tol_a,Kmax)
    % Metodo delle Secanti
    %
    % INPUT
    % f: funzione
    % x_0: primo punto di innesco
    % x_1: secondo punto di innesco
    % tol_a: tolleranza assoluta
    % Kmax: numero massimo di iterazioni
    % OUTPUT
    % x: stima della radice
    % err: errore sulla stima della radice
    % esito: 1 se si è raggiunta la convergenza, 0 altrimenti
    
    k = 1;
    x(k) = x_0;
    err = abs(f(x(k)));
    
    k = 2;
    x(k) = x_1;
    err = abs(f(x(k)));
    
    while (err > tol_a) && (k < Kmax)
        r = (f(x(k)) - f(x(k-1))) / (x(k) - x(k-1));
        k = k + 1;
        x(k) = x(k-1) - (f(x(k-1)) / r);
        err = abs(f(x(k)));
        if f(x(k)) == f(x(k-1))
            error('La retta secante risulta parallela ad asse x');
        end
    end
    
    if err < tol_a
        esito = 1;
    else
        esito = 0;
    end
    
end