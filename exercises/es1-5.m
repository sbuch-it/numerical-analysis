% Eserciziario - es1.5

clear
clc

alphaVector = linspace(5,10);
normVector = zeros(length(alphaVector),1);

i = 1;
for alpha = alphaVector
    A = [7 2 1; 2 alpha -2; 1 -2 8];
    normVector(i) = norm(A);
    i = i + 1;
end

[min_value index] = min(normVector);
alpha = alphaVector(index)

A = [7 2 1; 2 alpha -2; 1 -2 8];
b = [26; 14; 7];
x_0 = zeros(size(b));
tol_r = sqrt(eps);
Kmax = 100;

[x,rho,e,nr,k] = SL_MI_Jacobi(A,b,x_0,tol_r,Kmax);
x_J = x

[x,rho,e,nr,k] = SL_MI_GaussSeidel(A,b,x_0,tol_r,Kmax);
x_GS = x

x_mat = A\b
