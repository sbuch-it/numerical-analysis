function [x] = SL_MD_MEGconPivoting(A,b)
    % Metodo di Eliminazione di Gauss con Pivoting
    %
    % INPUT
    % A: matrice del sistema
    % b: vettore dei termini noti
    %
    % OUTPUT
    % x: soluzione del sistema lineare Ax=b
    
    M = [A b];
    n = length(b);
    
    for k=1 : n-1
        
        % determiniamo l'indice del pivot massimo e
        % facciamo lo swap di righe su A e b
        [max_value, index] = max(abs((A(k:n,k))));
        if index+k-1 ~= k
            A([k index],:) = A([index k], :);
            b([k index]) = b([index k]);
            M = [A b];
        end

        M(k+1:n,k) = A(k+1:n,k) / A(k,k);
        b(k+1:n) = b(k+1:n) - M(k+1:n,k) * b(k);
        A(k+1:n,k:n) = A(k+1:n,k:n) - M(k+1:n,k) * A(k,k:n);
        
    end
    
    [x] = SL_SostituzioneIndietro(A,b);
    
end