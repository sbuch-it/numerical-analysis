function [sol_int,sol_dec] = AE_BaseDecToBaseBeta(x,beta,m,n)
    % Conversione da base decimale a base beta
    %
    % INPUT
    % x: numero decimale da convertire in base beta
    % beta: base in cui convertire il numero decimale x
    % m+1: numero di cifre per rappresentare numero intero x
    % n+1: numero di cifre per rappresentare numero decimale x
    % OUTPUT
    % sol_int: parte intera del numero in base base
    % sol_int: parte decimale del numero in base base
    
    sol_int = zeros(m,1);
    sol_dec = zeros(n,1);
    
    x_int = floor(x);
    x_dec = x - x_int;
    
    % Parte intera
    
    for k = 1 : m + 1
        q = floor(x_int / beta);
        sol_int(k) = x_int - (q * beta);
        if q == 0
            break
        end
        x_int = q;
    end
    
    if q ~= 0
        disp('Il numero intero x non è rappresentabile con m+1 cifre');
    end

    % Parte decimale
    
    for j = 1 : n
        sol_dec(j) = floor(x_dec * beta);
        x_dec = (x_dec * beta) - sol_dec(j);
        if x_dec == 0
            break
        end
    end
    
    if x_dec ~= 0
        disp('Il numero x non è rappresentabile con n+1 cifre');
    end
    
end