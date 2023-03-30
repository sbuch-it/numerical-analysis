% Verificare che la matrice di Vandermonde è malcondizionata

clear
clc

MAX = 5;
v_max = rand(MAX,1);

for N = 1 : MAX
    
    v = v_max([1:N],1);
    V = zeros(N);
    V = fliplr(vander(v));
    
    c1(N) = cond(V,1);
    c2(N) = cond(V,2);
    cInf(N) = cond(V,inf);
    cFro(N) = cond(V,'fro');
    
    V
end

plot(1:MAX,c2)
