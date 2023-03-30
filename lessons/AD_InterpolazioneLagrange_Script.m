% Interpolazione polinomiale di Lagrange

close
clear
clc

n = 8; % grado del polinomio interpolante

x_e = linspace(-1,1,n+1); % n+1 punti equispaziati

% nodi di Chebyshev
i = 0:n;
x_c = cos((2*i+1)./2/(n+1)*pi);

% funzione di Runge
func_e = @(x_e) 1 ./ (1 + 25 * x_e.^2);
func_c = @(x_c) 1 ./ (1 + 25 * x_c.^2);

% punti nell'intervallo più fitti
xx_e = linspace(x_e(1),x_e(end),100);
xx_c = linspace(x_c(1),x_c(end),100);

% valutiamo con l'interpolazione polinomiale di Lagrange
P_e = AD_InterpolazioneLagrange(x_e,func_e(x_e),xx_e)
P_c = AD_InterpolazioneLagrange(x_c,func_c(x_c),xx_c)

% plot del risultato

figure
plot(xx_e,func_e(xx_e),'--k') % riferimento
hold on
plot(x_e,func_e(x_e),'*b') % nodi, punti scelti
hold on
plot(xx_e,P_e,'r') % polinomio di Lagrange
legend('riferimento','nodi','polinomio');
title('Lagrange con nodi equispaziati');
axis tight
xlim([-1 1])
ylim([0 1])

figure
plot(xx_c,func_c(xx_c),'--k') % riferimento
hold on
plot(x_c,func_c(x_c),'*b') % nodi, punti scelti
hold on
plot(xx_c,P_c,'r') % polinomio di Lagrange
legend('riferimento','nodi','polinomio');
title('Lagrange con nodi di Chebyshev');
axis tight
xlim([-1 1])
ylim([0 1])
