% Eserciziario - es2.3

clear
clc

a = 3;
b = 4;

alphaVector = linspace(a,b,1e5);

for alpha = alphaVector
    
    A = [-2 -1 0 0.5;
    1 -4 1 -10*alpha;
    -2 0 -0.5 0;
    0.5 0 0 4];
    
    D = diag(diag(A)); % parte diagonale di A
    E = A - D; % parte extra-diagonale di A
    M = - inv(D) * E; % matrice di iterazione    
    rho = max(abs(eig(M)));
    
    if rho >= 0.50
        break
    end
end

rho
alpha
