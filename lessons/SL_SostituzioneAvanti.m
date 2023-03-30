function [x] = SL_SostituzioneAvanti(A,b)
    % Metodo di Sostituzione in Avanti
    %
    % INPUT
    % A: matrice triangolare inferiore
    % b: vettore dei termini noti
    %
    % OUTPUT
    % x: soluzione del sistema lineare Ax=b
    
    [n, m] = size(A);
    
    if n ~= m
        error('La matrice A non è quadrata');
    end
    if ~istril(A)
        error('La matrice A non è triangolare inferiore');
    end
    if n ~= length(b)
        error('La lunghezza del vettore b non è corretta');
    end
    
    x = zeros(n, 1);
    x(1) = b(1) / A(1,1);
    
    for i = 2 : n
        x(i) = (b(i) - A(i,1:i-1) * x(1:i-1)) / A(i,i);
    end
    
end