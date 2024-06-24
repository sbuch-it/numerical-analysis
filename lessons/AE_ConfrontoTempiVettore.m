% Confronto Tempi Vettore

clear
clc

n = input('Inserire il numero di elementi del vettore: ');
h = 1 /(n-1);

% operatore :
disp('x=0:h:1')
tic
x = 0:h:1;
toc

% linspace
clear x
disp('linspace')
tic
x = linspace(0,1,n);
toc

% ciclo for senza inizializzazione
clear x
disp('ciclo for senza inizializzazione')
tic
x(1) = 0;
for i = 2 : n
    x(i) = x(i-1) + h;
end
toc

% ciclo for con inizializzazione
clear x
disp('ciclo for con inizializzazione')
tic
x = zeros(1,n);
for i = 2 : n
    x(i) = x(i-1) + h;
end
toc
