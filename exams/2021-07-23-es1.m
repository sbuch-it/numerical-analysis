% Esame 23/07/2021 es 1

close
clear
clc

% serie di dati

x = [-3 -2 -1 0 1 2];

y = [5 2.5 0.5 0 -0.4 -0.7];

xx = linspace(x(1),x(end),100);

[yy] = Lagrange(x,y,xx);

figure
plot(x,y,'*b')
hold on
plot(xx,yy)
legend('nodi','polinomio');

% stimare la soluzione dell'equazione

P = @(x) exp(x) + 1;

a = -3; b = 2;
xx = linspace(a,b,100);

figure
plot(xx,P(xx))
axis tight
xlim([a b])

% Metodo di Lagrange

function [yy] = Lagrange(x,y,xx)
    n = length(x) - 1;
    yy = zeros(size(xx));
    for j=0:n
        den = 1;
        num = ones(size(xx));
        for i= [0:j-1,j+1:n]
            num = num .* (xx - x(i+1));
            den = den .* (x(j+1) - x(i+1));
        end
        yy = yy + y(j+1) .* (num ./ den);
    end
end
