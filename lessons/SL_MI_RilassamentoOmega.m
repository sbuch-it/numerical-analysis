function [omega] = SL_MI_RilassamentoOmega(A)
    % Omega per il Metodo del Rilassamento
    
    omegaVector = linspace(0,2,1e5);
    
    L = tril(A); % triangolare inferiore
    U = triu(A,1); % triangolare superiore, 0 sulla diagonale
    D = diag(diag(A)); % parte diagonale di A
    L1 = L - D;
    
    i = 0;
    for omega = omegaVector
        i = i + 1;
        M_R = inv(D + omega * L1) * ((1 - omega) * D - omega * U);
        rho = max(abs(eig(M_R)));
        rhoVector(i) = rho;
    end
    
    [min_value, index] = min(rhoVector);
    omega = omegaVector(index);
    
end