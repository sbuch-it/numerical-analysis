function EIG_Gershgorin(A)
    % Teoremi di Gershgorin
    
    warning off
    autovalori = eig(A);
    
    f1 = figure;
    hold on
    f2 = figure;
    hold on
    RR = polyshape([0],[0]);
    CC = polyshape([0],[0]);
    
    t = linspace(0, 2*pi, 100);
    t = t(1 : end-1);
    
    for i = 1 : length(autovalori)
        r(i) = sum(abs(A(i,[1:i-1,i+1:end])));
        R(i) = polyshape(r(i) * cos(t) + A(i,i), r(i) * sin(t));
        figure(f1)
        subplot(2,1,1)
        hold on
        plot(R(i))
        text(A(i,i),0,strcat('R ',num2str(i)'));
        
        c(i) = sum(abs(A([1:i-1,i+1:end],i)));
        C(i) = polyshape(c(i) * cos(t) + A(i,i), c(i) * sin(t));
        figure(f2)
        subplot(2,1,1)
        hold on
        plot(C(i))
        text(A(i,i),0,strcat('C ',num2str(i)'));
        
        RR = union(RR, R(i));
        CC = union(CC, C(i));
    end
    
    figure(f1)
    subplot(2,1,2)
    hold on
    plot(complex(autovalori),'*k')
    plot(RR)
    
    figure(f2)
    subplot(2,1,2)
    hold on
    plot(complex(autovalori),'*k')
    plot(CC)
    
    figure(f1)
    set(findobj(gcf,'type','axes'),'DataAspectRatio',[1 1 1])
    set(findall(0,'-property','FontSize'),'FontSize',20);
    set(findall(0,'-property','FontName'),'FontName','times');
    
    figure(f2)
    set(findobj(gcf,'type','axes'),'DataAspectRatio',[1 1 1])
    set(findall(0,'-property','FontSize'),'FontSize',20);
    set(findall(0,'-property','FontName'),'FontName','times');
    
    figure
    inter_R_C = polyshape([0],[0]);
    inter_R_C = intersect(RR, CC);
    hold on
    plot(complex(autovalori),'*k')
    plot(inter_R_C)
    
    set(findobj(gcf,'type','axes'),'DataAspectRatio',[1 1 1])
    set(findall(0,'-property','FontSize'),'FontSize',20);
    set(findall(0,'-property','FontName'),'FontName','times');
    
    warning on
end