function [x,s] = SL_MD_MEGconPivotingParziale(A,b)
    % Metodo di Eliminazione di Gauss con Pivoting Parziale
    %
    % INPUT
    % A: matrice del sistema
    % b: vettore dei termini noti
    %
    % OUTPUT
    % x: soluzione del sistema lineare Ax=b
    % s: vettore degli scambi di riga effettuati
    
    n = length(b);
    s = zeros(n,1);
    
    for k=1 : n-1
        
        % determiniamo l'indice del pivot massimo e
        % facciamo lo swap di righe su A e b
        [max_value, index] = max(abs((A(k:n,k))));
        if index+k-1 ~= k
            A([k index+k-1],[k:n]) = A([index+k-1 k], [k:n]);
            b([k index+k-1]) = b([index+k-1 k]);
            s(k) = index+k-1;
        else
            s(k) = k;
        end

        A(k+1:n,k) = A(k+1:n,k) / A(k,k);
        b(k+1:n) = b(k+1:n) - A(k+1:n,k) * b(k);
        A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - A(k+1:n,k) * A(k,k+1:n);
    end
    
    U = triu(A);
    [x] = SL_SostituzioneIndietro(U,b);
end