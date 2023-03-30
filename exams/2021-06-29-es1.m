% Esame 29/06/2021 es 1

close all
clear all
clc

% funzione
f = @(x) 1 ./ (1 + 10*x.^2);

Nvector = [5 8 10 12 14];

for N=Nvector

% nodi
x_eq = linspace(-2,2,N);
xx = linspace(x_eq(1), x_eq(end),100);

% polinomio interpolante di grado minimo
P = polyfit(x_eq, f(x_eq), N-1);
yy = polyval(P, xx);

% errore di approssimazione di P
e1 = f(x_eq);
e2 = polyval(P, x_eq);
err_P = norm(abs(e1 - e2))

% nodi con minor errore di approssimazione
x_eq1 = linspace(-1,1,N);
xx1 = linspace(x_eq1(1), x_eq1(end),100);

% polinomio interpolante di grado minimo
P1 = polyfit(x_eq1, f(x_eq1), N-1);
yy1 = polyval(P1, xx1);

% errore di approssimazione di P1
e1 = f(x_eq1);
e2 = polyval(P1, x_eq1);
err_P1 = norm(abs(e1 - e2))

% grafico
figure
plot(x_eq, f(x_eq),'*')
hold on
plot(xx, yy)
hold on
plot(x_eq1, f(x_eq1),'*')
hold on
plot(xx1, yy1)
title(strcat('N = ',num2str(N)))

f_I = @(x) abs(f(x) - polyval(P,x));
I = integral(f_I,-2,2)

f_I1 = @(x) abs(f(x) - polyval(P1,x));
I1 = integral(f_I1,-2,2)

end
