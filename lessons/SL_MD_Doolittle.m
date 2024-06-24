function [L,U] = SL_MD_Doolittle(A)
    % Fattorizzazione di Doolittle
    %
    % INPUT
    % A: matrice quadrata fattorizzabile LU
    % OUTPUT
    % L: matrice triangolare inferiore, tutti 1 sulla diagonale
    % U: matrice triangolare superiore
    
    n = size(A,1);
    
    % controllo se i minori principali sono diversi da 0
    for i=1:n-1
        if abs(det(A(1:i,1:i))) == 0
            error('Matrice non fattorizzabile');
        end
    end
    
    L = eye(n);
    U = zeros(n);
    
    for k = 1 : n
        
        for j = k : n
            U(k,j) = A(k,j) - L(k,1:k-1) * U(1:k-1,j);
        end
        % U(k,k:n) = A(k,k:n) - L(k,1:k-1) * U(1:k-1,k:n);
        
        if issymmetric(A)
            L(k+1:n,k) = U(k,k+1:n) / U(k,k);
        else
            L(k+1:n,k) = (A(k+1:n,k) - ( L(k+1:n,1:k-1) * U(1:k-1,k))) / U(k,k);
        end
        
    end
end