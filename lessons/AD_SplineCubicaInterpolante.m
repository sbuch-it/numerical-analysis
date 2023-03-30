function [yy] = AD_SplineCubicaInterpolante(x,y,xx)
    % Spline cubica interpolante
    %
    % INPUT
    % x: nodi
    % y: valore di f(x)
    % xx: valori in cui interpolare
    % OUTPUT
    % yy: valori interpolati di xx
        
    % ordinare i punti
    [x, ind] = sort(x);
    y = y(ind); % ordina gli elementi di y come quelli di x
    
    % restituisce n-1 valori che sono le ampiezze degli intervalli
    h = diff(x);
    
    % vettori come rapporti incrementali
    v = diff(y) ./ h;
    
    % vettore degli elementi che sono sulla diagonale
    D = 2 * ( x(3 : end) - x(1 : end-2) );
    
    % vettore degli elementi che sono sulla co-diagonale
    C = h(2 : end-1);
    
    % matrice del sistema
    A = diag(D) + diag(C, -1) + diag(C, 1);
    
    % vettore dei termini noti
    b = 6 * (v(2 : end) - v(1 : end-1));
    
    % vettore delle derivate seconde nei nodi interni
    z = A \ b;
    
    % vettore delle derivate seconde in tutti i nodi
    z = [0; z; 0];
    
    yy = zeros(size(xx));
    
    for ii = 1 : length(x)-1
        % utilizziamo una variabile logica I per verificare
        % se il vettore xx è compreso tra x(ii) e x(ii+1)
        I = (x(ii) <= xx) & (x(ii+1) >= xx);
        C = y(ii+1) ./ h(ii) - h(ii) / 6 * z(ii+1);
        D = y(ii) / h(ii) - h(ii) / 6 * z(ii);
        yy = yy + ...
            (z(ii+1) / 6 / h(ii) .* (xx - x(ii)) .^ 3 + ...
            z(ii)/ 6 / h(ii) .* (x(ii+1) - xx) .^ 3 + ...
            C * (xx - x(ii)) + D * (x(ii+1) - xx)) .* I;
    end
    
end