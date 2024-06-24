function [P] = AD_InterpolazioneNewton(x,y,xx)
    % Interpolazione polinomiale di Newton
    %
    % INPUT
    % x: nodi
    % y: valori f(x)
    % xx: punti dell'intervallo
    % OUTPUT
    % P: polinomio interpolante
    
    n = length(x) - 1; % grado del polinomio
    
    % calcolo delle differenze divise
    for i=1:n
        for j=n:-1:i
            y(j+1)=(y(j+1)-y(j))./(x(j+1)-x(j-i+1));
        end
    end
    A = y;
    
    % costruiamo il polinomio interpolante
    P = A(end);
    for i=n-1:-1:0
        P = P .* (xx - x(i+1)) + A(i+1);
    end
    
%     % modo equivalente
%     yy = zeros(size(xx)) + y(1);
%     A = y;
%     w = ones(size(xx));
%     for ii = 2 : length(x)
%         xx = x(ii:end) - x(1:end-ii+1);
%         A(ii:end) = diff(A(ii-1:end))./xx; % diff: differenze divise
%         w = w .* (xx - x(ii-1));
%         yy = yy + A(ii) * w;
%     end
    
end