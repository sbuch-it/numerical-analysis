% Metodo di Sostituzione in Avanti e all'Indietro

clear
clc

n = 4;
A = rand(n);
b = rand(n,1);

% metodo di sostituzione in avanti
A = tril(A);

x_matlab = A\b
x = SL_SostituzioneAvanti(A,b)

% metodo di sostituzione all'indietro
A = triu(A);

x_matlab = A\b
x = SL_SostituzioneIndietro(A,b)
