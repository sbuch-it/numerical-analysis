function [P] = AD_InterpolazioneLagrange(x,f,xx)
    % Interpolazione polinomiale di Lagrange
    %
    % INPUT
    % x: nodi
    % f: valori f(x)
    % xx: punti dell'intervallo
    % OUTPUT
    % P: polinomio interpolante
    
    n = length(x) - 1; % grado del polinomio
    P = zeros(size(xx));
    
    for j = 0 : n
        den = 1;
        num = ones(size(xx));
        for i=[0 : j-1, j+1 : n]
            num = num .* (xx - x(i+1));
            den = den .* (x(j+1) - x(i+1));
        end
        P = P + f(j+1) .* num ./ den;
    end
    
end