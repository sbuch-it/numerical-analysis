function [S] = SL_MD_CholeskyColonne(A)
    % Fattorizzazione di Cholesky per colonne
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
    
    for j=1 : n
        for i=1 : j-1
            S(i,j) = (A(i,j) - sum(S(1:i-1,i) .* S(1:i-1,j))) / S(i,i);
        end
        S(j,j) = sqrt(A(j,j) - sum(S(1:j-1,j).^2));
    end
    
end