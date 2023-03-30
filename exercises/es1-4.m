% Eserciziario - es1.4

clear
clc

b = [13; 4; 7];
alphaVector = [-2; 0.5; 1.5];

for i = 1 : length(alphaVector)
    
    A = [2 1 alphaVector(i); 2 4 -1; -1 0 2];
    
    x_0 = zeros(size(b));
    tol_r = sqrt(eps);
    Kmax = 100;
    
    [x,rho,e,nr,k] = SL_MI_Jacobi(A,b,x_0,tol_r,Kmax);
        
    disp(strcat('Soluzione di alpha = ',num2str(alphaVector(i))));
    
    x
    x_mat = A\b
    
    figure
    plot(log10(e))
    hold on
    y = log10(rho)*([1:20]-20)+log10(e(end));
    plot(1:20,y,'r')
    legend('Jacobi','log10(e)');
    title(strcat('alpha = ',num2str(alphaVector(i))))
    
end