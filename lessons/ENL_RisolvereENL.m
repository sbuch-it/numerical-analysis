% Funzione di MATLAB per risolvere Equazioni Non Lineari

clear
clc

f = @(x) x/8 .* (63 * x^4 - 70 * x^2 + 15); % funzione

fplot(f,[-1 1])
grid on

% osserviamo che uno zero della funzione è intorno a 0.9
x_0 = 1; % punto di innesco
[x,fval,exitflag,output] = fzero(f,x_0)

% x: stima della soluzione
% fval: valore della funzione in (x,f(x))
% exitflag
