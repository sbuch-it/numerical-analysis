% Spline con Funzione di Runge

close all
clear all
clc

func = @(x) 1./(1 + 25 * x.^2); % funzione di Runge

% definizione dell'intervallo
a = -2; b = 2;

% plot della funzione di Runge nell'intervallo [a,b]
fplot(func, [a b]);

n = 6; % grado del polinomio interpolante

% definizione di punti di interpolazione equispaziati
x = linspace(a, b, n+1);

% provare con punti di Chebyshev
% i = 0 : n;
% x = (a+b) / 2+(b-a) / 2 * cos((2*i+1)/(2*n+2)*pi);

% plot dei punti di interpolazione
y = func(x);
hold on
plot(x, y, '*');

% punti equispaziati più fitti rispetto a prima
xx = linspace(a, b, 500);

% spline
yy_not_a_knot = spline(x, y, xx); % not a Knot
yy_vincolata = spline(x, [0 y 0], xx); % vincolata

% interpolazione
plot(xx, yy_not_a_knot);
plot(xx, yy_vincolata);
legend('Funzione di Runge','Punti di Interpolazione','Spline Not a Knot','Spline Vincolata');
title('Spline con Funzione di Runge');
