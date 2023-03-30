% Interpolazione polinomiale di Newton

close
clear
clc

for n=2:5 % grado del polinomio interpolante
    
    % n+1 punti equispaziati
    x = linspace(-pi,pi,n+1);
    
    % funzione seno
    func = @(x) sin(x);
    
    % punti nell'intervallo più fitti
    xx = linspace(x(1),x(end),50);
    
    % valutiamo con l'interpolazione polinomiale di Newton
    P = AD_InterpolazioneNewton(x,func(x),xx);
    
    % plot del risultato
    figure
    plot(xx,func(xx),'k') % funzione seno
    hold on
    plot(x,func(x),'*b') % nodi equispaziati
    hold on
    plot(xx,P,'--r') % polinomio interpolante di Newton
    legend('funzione seno','nodi equispaziati','polinomio interpolante');
    title(strcat('Grado del polinomio = ',num2str(n)));
    axis tight
    xlim([-pi pi])
    ylim([-1 1])
    
end