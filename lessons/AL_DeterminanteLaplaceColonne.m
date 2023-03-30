function [Det] = AL_DeterminanteLaplaceColonne(M)
    % Calcolo del determinante con Laplace per colonne
    %
    % INPUT
    % M: matrice quadrata
    % OUTPUT
    % Det: determinante di M
    
    [n, m] = size(M); % [righe, colonne]
    
    if n == 1 && m == 1
        Det = M;
    else
        if n ~= m
            disp('Errore: la matrice non è quadrata');
            return
        else
            j = 1;
            Det = 0;
            for i = 1 : n
                Det = (-1)^(i+j) * AL_DeterminanteLaplaceColonne(M([1:i-1,i+1:end] , [1:j-1,j+1:end])) * M(i,j) + Det;
            end
        end
    end
end