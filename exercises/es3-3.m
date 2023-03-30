% Eserciziario - es 3.3

close all
clear all
clc

% estremi di integrazione
a = 0.5; b = 1.5;

% tolleranza
tol = 1e-4;

% funzione integranda
f = @(x) sin(pi*x) + 2 * cos(pi*x);

% integrale esatto
I_matlab = integral(f,a,b)

% regola dei trapezi
[I_T,eVector_T,n_T] = Trapezi(f,a,b,tol);
I_T
n_T

% regola di Cavalieri Simpson
[I_CS,eVector_CS,n_CS] = CavalieriSimpson(f,a,b,tol);
I_CS
n_CS

% grafico dell'errore di approssimazione
figure
plot(eVector_T)
hold on
plot(eVector_CS)
legend('Trapezi', 'Cavalieri Simpson')

function [I,eVector,n] = Trapezi(f,a,b,tol)
    k = 1;
    n = 2;
    eVector(k) = 1;
    I_matlab = integral(f, a, b);
    
    while eVector(k) > tol
        k = k + 1;
        h = (b-a)/n;
        I = (h/2) * (f(a) + 2 * sum(f(a+[1:n-1]*h)) + f(b));
        eVector(k) = abs(I - I_matlab);
        n = n * 2;
    end
    
end

function [I,eVector,n] = CavalieriSimpson(f,a,b,tol)
    k = 1;
    n = 2; % numero di sotto-intervalli
    eVector(k) = 1; % inizializzazione dell'errore
    I_matlab = integral(f, a, b); % integrale esatto
    
    while eVector(k) > tol
        k = k + 1;
        h = (b-a)/n; % ampiezza di ogni sotto-intervallo
        
        sum1 = 4 * sum(f(a + (2 * [1:n/2] - 1) * h));
        sum2 = 2 * sum(f(a + (2 * [1:(n/2)-1] * h)));
        I = (h/3) * (f(a) + f(b) + sum1 + sum2);
        
        eVector(k) = abs(I - I_matlab);
        n = n * 2;
    end
    
end
