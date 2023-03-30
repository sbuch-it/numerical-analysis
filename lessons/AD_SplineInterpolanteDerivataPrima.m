% Spline interpolante con derivata prima

x = [0.1 0.5 0.2 0.7 0.8 0.9]';
y = [5 7 6 8 6 5]';

% intervallo tra 0 e 1 con 100 punti
xx = linspace(x(1), x(end), 100);

% ordinare i nodi
[x, ind] = sort(x);
y = y(ind); % ordina gli elementi di y come quelli di x

% derivate prime
f1_0 = 0;
f1_n = 0;

% restituisce n-1 valori che sono le ampiezze degli intervalli
h = diff(x);

% vettori come rapporti incrementali
v = diff(y) ./ h;

% vettore degli elementi che sono sulla diagonale
D = [ 2*h(1) ; 2*(x(3:end)-x(1:end-2)) ; 2*h(end) ];
% vettore degli elementi che sono sulla co-diagonale
C = [ h(1) ; h(2:end-1) ; h(end) ];

% matrice del sistema
A = diag(D) + diag(C, -1) + diag(C, 1);

% vettore dei termini noti
b = 6 * [ v(1)-f1_0 ; (v(2:end)-v(1:end-1)) ; -v(end)+f1_n ];

% vettore delle derivate seconde nei nodi interni
z = A \ b;

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

figure
plot(x, y, '*')
hold on
plot(xx, yy)
plot(xx, spline(x, [f1_0; y; f1_n], xx), '--')
