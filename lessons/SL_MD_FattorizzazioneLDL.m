function [L,D] = SL_MD_FattorizzazioneLDL(A)
    % Fattorizzazione LDL
    %
    % INPUT
    % A: matrice simmetrica fattorizzabile LU
    % OUTPUT
    % L: matrice triangolare inferiore, tutti 1 sulla diagonale
    % D: matrice triangolare diagonale
    
    n = size(A,1);
    
    % controllo se i minori principali sono diversi da 0
    for i=1:n-1
        if abs(det(A(1:i,1:i))) == 0
            error('Matrice non fattorizzabile');
        end
    end
    
    if ~issymmetric(A)
        error('Matrice non simmetrica');
    end
    
    L = eye(n);
    D = zeros(n);
    
    for k = 1 : n
        D(k,k:n) = A(k,k:n) - L(k,1:k-1) * D(1:k-1,k:n);
        L(k+1:n,k) = D(k,k+1:n) / D(k,k);
    end
    D = tril(D);
end