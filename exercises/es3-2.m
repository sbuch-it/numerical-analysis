% Eserciziario - es 3.2

close all
clear all
clc

% dati

x = [1 1.5 2 2.5 3];
y = [1 5 16 20 80];

% retta di regressione

[P_1] = polyfit(x,y,1)

% parabola approssimante ai minimi quadrati

[P_2] = polyfit(x,y,2)

% polinomio approssimante di grado 3 ai minimi quadrati

[P_3] = polyfit(x,y,3)

% polinomio interpolante di grado minimo

[P_4] = polyfit(x,y,4)

% graficare le diverse approssimazioni
xx = linspace(x(1), x(end), 1e2);

figure
plot(x,y,'*')
hold on
plot(xx,polyval(P_1,xx))
hold on
plot(xx,polyval(P_2,xx))
hold on
plot(xx,polyval(P_3,xx))
hold on
plot(xx,polyval(P_4,xx))
legend('dati','P1','P2','P3','P4')
