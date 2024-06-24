function [sol] = AE_ValutarePolinomioHorner(a,x)
    % Calcolo del valore di un polinomio P(x) in un punto x
    % con l'algoritmo ottimale di Horner
    %
    % INPUT
    % a: vettore dei coefficienti, a = [an, ..., a0]
    % x: punto in cui valutiamo il polinomio
    % OUTPUT
    % sol = an * x^n + ... + a1 * x + a0
    
    n = length(a);
    sol = a(1); % sol = an
    
    for j = 2 : n
        sol = (sol .* x) + a(j);
    end 
end