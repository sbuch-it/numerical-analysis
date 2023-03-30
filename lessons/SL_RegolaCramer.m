% Regola di Cramer

clear
clc

n = 4;
A = rand(n);
b = rand(n, 1);

disp('Soluzione di un sistema lineare con Cramer');
tic
for i = 1 : length(b)
    Ai = A;
    Ai(:, i) = b;
    x(i) = det(Ai) / det(A);
end
x.'
toc

disp(newline);

disp('Soluzione di un sistema lineare con MATLAB');
tic
A\b
toc
