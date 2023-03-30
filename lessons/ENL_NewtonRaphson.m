function [x,err,esito] = ENL_NewtonRaphson(f,df,x_0,tol_a,Kmax)
    % Metodo di Newton Raphson
    %
    % INPUT
    % f: funzione
    % df: derivata della funzione f
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
    
    while (err > tol_a || err > tol_a * abs(df(x(k)))) && (k < Kmax)
        k = k+1;
        x(k) = x(k-1) - f(x(k-1)) / df(x(k-1));
        err = abs(f(x(k)));
    end
    
    if err < tol_a
        esito = 1;
    else
       esito = 0; 
    end
    
end