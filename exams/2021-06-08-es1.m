% Esame 08/06/2021 es 1

close all
clear all
clc

% definizione di x

x = [-2 -1 0 1 2 3];
xx = linspace(x(1), x(end), 100);

% serie 1

y1 = [7 5 1 -2 0 1];

P1_matlab = polyfit(x,y1,4)

P1 = MyPolyfit(x,y1,4)

figure
plot(x,y1,'*')
hold on
plot(xx,polyval(P1,xx))
title('Serie 1')
legend('dati originali', 'polinomio di approssimazione');

% serie 2

y2 = [1/3 -1/3 -1/3 1/3 5/3 11/3];

P2_matlab = polyfit(x,y2,5)

P2 = MyPolyfit(x,y2,5)

figure
plot(x,y2,'*')
hold on
plot(xx,polyval(P2,xx))
title('Serie 2')
legend('dati originali', 'polinomio di approssimazione');

% soluzione dell'equazione

f = @(x) polyval(P1,x) + polyval(P2,x) - 5*x;

figure
fplot(f,[-2 3])
hold on
yline(0)

x_matlab = fzero(f,0)

% metodo di iterazione funzionale

clear x

% g = @(x) f(x) + x;
% abbiamo che |dg(x)| non è < 1

g = @(x) f(x) / 5 + x; % ok

dg = diff(g(xx)) ./ diff(xx);

figure
plot(xx(2:end),abs(dg))

x = 0; % punto in cui |dg(x)| < 1

while abs(g(x) - x) > sqrt(eps)
    x = g(x);
end

x

% polinomio interpolante con fattorizzazione QR

function [P] = MyPolyfit(x,y,n)

    x = reshape(x, length(x), 1);
    y = reshape(y, length(y), 1);
    
    A = fliplr(vander(x));
    
    [Q,R] = qr(A);
    
    b = Q.' * y;
    b1 = b(1 : n+1);
    R1 = R(1 : n+1, 1 : n+1);
    R1 = triu(R1);
    P = MetodoSostituzioneIndietro(R1, b1);
    P = flip(P).';
end

function [x] = MetodoSostituzioneIndietro(A,b)

    n = size(A,1);
    
    x = zeros(n, 1);
    x(n) = b(n) / A(n,n);
    
    for i = n - 1 : -1 : 1
        x(i) = ( b(i) - A(i,i+1:n) * x(i+1:n) ) / A(i,i);
    end
    
end
