function [I] = AD_FormulaCavalieriSimpson(f,a,b)
    % Formula di Cavalieri Simpson
    %
    % INPUT
    % f: funzione da integrare
    % a: estremo inferiore
    % b: estremo superiore
    % OUTPUT
    % I: approssimazione dell'integrale
    
    m = (a+b)/2; % punto di mezzo
    I = ((b-a)/6) * (f(b) + 4*f(m) + f(a));
end