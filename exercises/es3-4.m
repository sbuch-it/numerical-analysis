% Eserciziario - es 3.4

% DA FARE CON ITERAZIONE FUNZIONALE

close all
clear all
clc

% dati
x = [-2 -1 0 1 2 3];
y = [2.18 1.49 0.5 -0.49 -1.18 -0.07];

% polinomio di grado 3 di migliore approssimazione
P_3 = polyfit(x,y,3)

% polinomio interpolante di grado minimo
P_5 = polyfit(x,y,5)

% grafico dei dati e delle approssimazioni
xx = linspace(-2,3,100);
figure
plot(x,y,'*')
hold on
plot(xx,polyval(P_3,xx))
hold on
plot(xx,polyval(P_5,xx))
legend('dati','P grado 3','P grado minimo')

% stima del valore x con Netwon-Raphson

f = @(x) P_5(1) * x.^5 + P_5(2) * x.^4 + ...
    P_5(3) * x.^3 + P_5(4) * x.^2 + ...
    P_5(5) * x + P_5(6) + 1;

df = @(x) P_5(1) * 5 * x.^4 + P_5(2) * 4 * x.^3 + ...
    P_5(3) * 2 *  x.^2 + P_5(4) * 2 * x + P_5(5);

x_0 = 1;

[x,fval,exitflag,output] = fzero(f,x_0);
x
exitflag

tol_a = sqrt(eps);
Kmax = 200;
[x_NR,err,esito_NR] = NewtonRaphson(f,df,x_0,tol_a,Kmax);
x_NR
esito_NR

figure
fplot(f)
hold on
fplot(df)
hold on
plot(x,fval,'*')
hold on
plot(x_NR,f(x_NR),'o')
legend('funzione','derivata','zero','convergenza')
axis tight
xlim([1 2])

function [x,err,esito] = NewtonRaphson(f,df,x_0,tol_a,Kmax)
    k = 1;
    x(k) = x_0;
    err = abs(f(x(k)));
    
    while (err > tol_a || err > tol_a * abs(df(x(k)))) && (k < Kmax)
        k = k+1;
        x(k) = x(k-1) - f(x(k-1)) / df(x(k-1));
        err = abs(f(x(k)));
    end
    
    if err < tol_a
        esito = 1;
    else
       esito = 0; 
    end
    
end
