% Verificare che la matrice di Hilbert è malcondizionata

clear
clc

format rat
MAX = 5;

for N = 1 : MAX
    
    H = zeros(N);
    for i = 1 : N
        for j = 1 : N
            H(i,j) = 1/(i + j - 1);
        end
    end

    % H = hilb(N);
    
    c1(N) = cond(H,1);
    c2(N) = cond(H,2);
    cInf(N) = cond(H,inf);
    cFro(N) = cond(H,'fro');
    
    H
end

format short
plot(1:MAX,c2)
