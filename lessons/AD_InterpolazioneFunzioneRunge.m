
% definizione della funzione di Runge
func = @(x) 1./(1 + 25 * x.^2);

% definizione dell'intervallo
a = -2;
b = 2;

fplot(func, [a b]);

% definizione del grado del polinomio interpolante
n = 6;
% provare ad aumentare il grado e verificare accuratezza

% definizione di punti di interpolazione equispaziati
xi = linspace(a, b, n+1);

% provare anche con punti di Chebyshev
% i = 0 : n;
% xi = (a+b) / 2+(b-a) / 2 * cos((2*i+1)/(2*n+2)*pi);

% plot dei punti di interpolazione
yi = func(xi);
hold on
plot(xi, yi, '*');

% funzione polyfit
p = polyfit(xi, yi, n);

% punti equispaziati più fitti rispetto a prima
xx = linspace(a, b, 500);

% interpolazione
yy = polyval(p, xx);
plot(xx, yy);
