function [L,U,P] = SL_MD_FattorizzazioneLU(A)
    % Fattorizzazione LU
    %
    % INPUT
    % A: matrice quadrata fattorizzabile LU
    % OUTPUT
    % L: matrice triangolare inferiore
    % U: matrice triangolare superiore
    % P: matrice delle permutazioni
    
    n = size(A,1);
    
    % controllo se i minori principali sono diversi da 0
    for i=1:n-1
        if abs(det(A(1:i,1:i))) == 0
            error('Matrice non fattorizzabile');
        end
    end
    
    P = eye(n);
    
    for k=1:n-1
        
        % matrice permutazione
        [max_value index] = max(abs(A(k:n,k)));
        
        if index+k-1 ~= k
            A([k index+k-1],:) = A([index+k-1 k],:);
            P([k index+k-1],:) = P([index+k-1 k],:);
        end
        
        A(k+1:n,k) = A(k+1:n,k)/A(k,k);
        A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - A(k+1:n,k) * A(k,k+1:n);
        
    end
    
    L = tril(A,-1) + eye(n);
    U = triu(A);
    
end