% Criteri di Arresto di un Metodo Iterativo

% 1. Criterio di salvaguardia: k < Kmax

% 2. Controllo del residuo: norm(residuo) <= tol_r * norm(b)
% dove tipicamente tol_r = sqrt(eps)

% 3. Criterio della distanza tra iterazioni successive

x = linspace(0,1); % rappresenta la norma di M
y = x./(1-x); % definizione della funzione

plot(x,y,'linewidth',2) % plot della funzione

xlabel('||M||') % etichetta l'asse x
ylabel('||M||/(1-||M||)') % etichetta l'asse y

set(gca,'fontsize',15) % modifica il font

% limita gli assi fissando un intervallo
axis tight
xlim([0 0.5])
ylim([0 1])
