function [I] = AD_FormulaTrapezi(f,a,b)
    % Formula dei trapezi
    %
    % INPUT
    % f: funzione da integrare
    % a: estremo inferiore
    % b: estremo superiore
    % OUTPUT
    % I: approssimazione dell'integrale
    
    I = (f(a) + f(b)) * ((b-a)/2);
end