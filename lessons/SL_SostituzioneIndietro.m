function [x] = SL_SostituzioneIndietro(A,b)
    % Metodo di Sostituzione all'Indietro
    %
    % INPUT
    % A: matrice triangolare superiore
    % b: vettore dei termini noti
    %
    % OUTPUT
    % x: soluzione del sistema lineare Ax=b
    
    [n, m] = size(A);
    
    if n ~= m
        error('La matrice A non è quadrata');
    end
    if ~istriu(A)
        error('La matrice A non è triangolare superiore');
    end
    if n ~= length(b)
        error('La lunghezza del vettore b non è corretta');
    end
    
    x = zeros(n, 1);
    x(n) = b(n) / A(n,n);
    
    for i = n - 1 : -1 : 1
        x(i) = ( b(i) - A(i,i+1:n) * x(i+1:n) ) / A(i,i);
    end
    
end