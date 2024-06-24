% Eserciziario - es 3.1

% FARE INTEGRALE

close all
clear all
clc

% funzione
f = @(x) 1 \ (x.^2 + 3.*x + 4);

% intervallo
a = -3; b = 3;

% 8 campioni equispaziati
x = linspace(a,b,8);

% polinomio con MATLAB
xx = linspace(a,b,100);
P_matlab = polyfit(x,f(x),4)

% sistema normale
v = linspace(a,b,5);
C = fliplr(vander(v));
b = f(v).';

% a = inv(C.' * C) * C.' * b

[R,FLAG] = chol(C.' * C);
if FLAG == 0
    y = R.' \ (C.' * b);
    a = R \ y;
else
    error('La matrice non è simmetrica e definita positiva');
end

P = flip(a.')

% grafico
figure
plot(x,f(x),'*');
hold on
fplot(f,'--')
hold on
plot(xx,polyval(P,xx))
legend('campioni','funzione','polinomio');
