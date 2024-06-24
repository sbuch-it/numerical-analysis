function [sol] = AE_ValutarePolinomio(a,x)
    % Calcolo del valore di un polinomio P(x) in un punto x
    %
    % INPUT
    % a: vettore dei coefficienti, a = [an, ..., a0]
    % x: punto in cui valutiamo il polinomio
    % OUTPUT
    % sol = an * x^n + ... + a1 * x + a0
    
    p = 1;
    n = length(a);
    sol = a(n); % sol = a0
    
    for i = n-1 : -1 : 1
        p = p .* x;
        sol = sol + (a(i) .* p);
    end
end