function [L,U] = SL_MD_Crout(A)
    % Fattorizzazione di Crout
    %
    % INPUT
    % A: matrice quadrata fattorizzabile LU
    % OUTPUT
    % L: matrice triangolare superiore
    % U: matrice triangolare inferiore, tutti 1 sulla diagonale
    
    n = size(A,1);
    
    % controllo se i minori principali sono diversi da 0
    for i=1:n-1
        if abs(det(A(1:i,1:i))) == 0
            error('Matrice non fattorizzabile');
        end
    end
    
    L = zeros(n);
    U = eye(n);
    
    for k=1:n
        
        L(k:n,k) = A(k:n,k) - L(k:n,1:k-1) * U(1:k-1,k);
        U(k,k+1:n) = ( A(k,k+1:n) - L(k,1:k-1) * U(1:k-1,k+1:n) ) / L(k, k);
        
    end
    
end