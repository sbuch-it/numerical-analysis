function [S] = SL_MD_CholeskyRighe(A)
    % Fattorizzazione di Cholesky per righe
    %
    % INPUT
    % A: matrice simmetrica e definita positiva
    % OUTPUT
    % S: matrice triangolare inferiore
    
    [R,FLAG] = chol(A);
    if FLAG > 0
        error('La matrice A non è simmetrica e definita positiva');
    end
    
    n = size(A,1);
    S = zeros(n);
    
    for i=1 : n
        for j=1 : i-1
            S(i,j) = (A(i,j) - sum(S(i,1:j-1) .* S(j,1:j-1))) / S(j,j);
        end
        S(i,i) = sqrt(A(i,i) - sum(S(i,1:i-1).^2));
    end
    
end