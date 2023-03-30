% Spline interpolante con sotto-intervalli
% premere invio per visualizzare ogni intervallo

x = [0.1 0.5 0.2 0.7 0.8 0.9]';
y = [5 7 6 8 6 5]';

xx = linspace(x(1), x(end), 100);
pp = spline(x, [0; y; 0]);

% se spline not a knot
% pp = spline(x, [y]);

figure
plot(x, y, '*')
hold on
plot(xx, ppval(pp, xx))

for ii = 1 : pp.pieces
    % primo indice è dell'intervallo e
    % il secondo indice è del coefficiente
    yy = pp.coefs(ii, 1) * (xx - pp.breaks(ii)).^3 + ...
    pp.coefs(ii, 2) * (xx - pp.breaks(ii)).^2 + ...
    pp.coefs(ii, 3) * (xx - pp.breaks(ii)) + ...
    pp.coefs(ii, 4);
    
    % calcoliamo il polinomio dai sotto-intervalli
    plot(xx, yy)
    pause
end