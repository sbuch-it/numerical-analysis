function [I,hVector,eVector,n] = AD_FormulaCompositaCavalieriSimpson(f,a,b,tol)
    % Formula composita di Cavalieri Simpson
    %
    % INPUT
    % f: funzione da integrare
    % a: estremo inferiore
    % b: estremo superiore
    % tol: tolleranza sull'errore dell'approssimazione
    % OUTPUT
    % I: approssimazione dell'integrale
    % hVector: ampiezze di ogni sotto-intervallo
    % eVector: errori delle approssimazioni dell'integrale
    % n: numero di sotto-intervalli fatti per l'approssimazione
    
    k = 1;
    n = 2; % numero di sotto-intervalli
    eVector(k) = 1; % inizializzazione dell'errore
    I_matlab = integral(f, a, b); % integrale esatto
    
    while eVector(k) > tol
        k = k + 1;
        h = (b-a)/n; % ampiezza di ogni sotto-intervallo
        
        sum1 = 4 * sum(f(a + (2 * [1:n/2] - 1) * h));
        sum2 = 2 * sum(f(a + (2 * [1:(n/2)-1] * h)));
        I = (h/3) * (f(a) + f(b) + sum1 + sum2);
        
        hVector(k) = h;
        eVector(k) = abs(I - I_matlab);
        n = n * 2;
    end
    
end