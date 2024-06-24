% Eserciziario - es2.4

close
clear
clc

nVector = [4 10 20];

for n = nVector
    
    A = hilb(n);
    b = zeros(n,1);
    
    for i=1:n
        b(i) = sum(1./([1:n]+(i-1)));
    end
    
    x_0 = zeros(n,1);
    
    tol_r = 1e-2 / norm(b);
    Kmax = 100;
    
    [x,e,nr,k] = SL_MI_Gradiente(A,b,x_0,tol_r,Kmax);
    
    figure
    semilogy(e,'*');
    hold on;
    semilogy(nr,'o');
    legend('Errore','Residuo');
    
end
