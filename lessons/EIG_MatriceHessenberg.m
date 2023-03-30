function [Q,H] = EIG_MatriceHessenberg(A)
    % Matrice simile in forma di Hessenberg
    %
    % INPUT
    % A: matrice quadrata
    % OUTPUT
    % Q: matrice ortogonale cioè A=P*H*P
    % H: matrice tri-diagonale in forma di Hessenberg
    
    % Trasformazione di similitudione
    % [P, H] = hess(A)
    
    N = size(A,1);
    Q = eye(N);
    
    for i = 1 : N - 2
        v1 = A(i+1:N,i);
        u1 = v1;
    
        if v1(1) <= 0
            sigma = -1 * norm(v1);
        else
            sigma = norm(v1);
        end
        
        u1(1) = u1(1) + sigma;
        u = [zeros(i, 1); u1];
        Qi = eye(N) - 2 * (u * u.') / (u.' * u);
        A = Qi * A * Qi.';
        Q = Q * Qi;
    end
    H = A;
    
end