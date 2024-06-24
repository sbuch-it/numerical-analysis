function [x] = SL_MD_MEGsenzaPivoting(A,b)
    % Metodo di Eliminazione di Gauss senza Pivoting
    %
    % INPUT
    % A: matrice del sistema
    % b: vettore dei termini noti
    %
    % OUTPUT
    % x: soluzione del sistema lineare Ax=b
    
    M = [A b];
    n = length(b);
    
    for k=1:n-1
        
        for i=k+1:n
            
            M(i,k) = A(i,k) / A(k,k);
            b(i) = b(i) - M(i,k) * b(k);
            
            for j=k:n
                A(i,j) = A(i,j) - M(i,k) * A(k,j);
            end
            % A(i,k:n) = A(i,k:n) - M(i,k) * A(k,k:n);
        end
        % M(k+1:n,k) = A(k+1:n,k) / A(k,k);
        % b(k+1:n) = b(k+1:n) - M(k+1:n,k) * b(k);
        % A(k+1:n,k:n) = A(k+1:n,k:n) - M(k+1:n,k) * A(k,k:n);
    end
    [x] = SL_SostituzioneIndietro(A,b);
    
end