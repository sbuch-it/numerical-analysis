function [ns] = EIG_SuccessioneSturm(alpha,beta,x)
    % Stima autovalori con metodo di Sturm
    %
    % INPUT
    % alpha: vettore
    % beta: vettore
    % x: punto in cui valutare il polinomio
    % OUTPUT
    % ns: numero di cambiamento di segno
    
    % matlab
    % [U,T] = schur(A)

    N = length(alpha);
    
    % successione dei polinomi valutata in x
    p(1) = 1;
    p(2) = x - alpha(1);
    for i = 2 : N
        p(i+1) = (x - alpha(i)) * p(i) - beta(i-1).^2 * p(i-1);
    end
    
    % conteggio
    ns = 0;
    temp = 1;
    for i = 2 : N+1
        if (temp * p(i)) < 0
            ns = ns + 1;
            temp = p(i);
        end
    end
end