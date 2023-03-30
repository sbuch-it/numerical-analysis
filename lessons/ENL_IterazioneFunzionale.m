function ENL_IterazioneFunzionale(g,x)
    % Metodi di iterazione funzionale
    %
    % INPUT
    % g: funzione da annullare
    % x: punto di innesco
    
    xx=linspace(x-2,x+2);
    
    plot(xx,g(xx),'b');
    hold on
    plot(xx,xx,'r');
    yl=ylim;
    plot([x x],[yl(1) g(x)],'--k')
    plot([g(x) x],[g(x) g(x)],'--k')
    xlim([x-2,x+2])
    
    for k=1:6
        x=g(x);
        plot([x x],[x g(x)],'--k')
        plot([g(x) x],[g(x) g(x)],'--k')
    end
    
end