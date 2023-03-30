function [Q,R] = SL_MD_FattorizzazioneQR(A)
    % Fattorizzazione QR
    %
    % INPUT
    % A: matrice quadrata o rettangolare
    % OUTPUT
    % Q: matrice ortogonale cioè Q * Q^T = I
    % R: matrice triangolare superiore
    
    [M, N] = size(A);
    
    Q = eye(M);
    
    for i = 1 : M-1
        v1 = A(i:M,i);
        
        if A(i,i) <= 0
            sigma = -1 * norm(v1);
        else
            sigma = norm(v1);
        end
        
        v1(1) = v1(1) + sigma;
        u = [zeros(i - 1, 1); v1];
        Qi = eye(M) - 2 * u * u' / (u' * u);
        A = Qi * A;
        Q = Qi * Q;
    end
    Q = Q';
    R = A;
    
end