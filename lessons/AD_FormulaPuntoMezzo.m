function [I] = AD_FormulaPuntoMezzo(f,a,b)
    % Formula del punto di mezzo
    %
    % INPUT
    % f: funzione da integrare
    % a: estremo inferiore
    % b: estremo superiore
    % OUTPUT
    % I: approssimazione dell'integrale
    
    m = (a+b)/2; % punto di mezzo
    I = f(m) * (b - a);
end