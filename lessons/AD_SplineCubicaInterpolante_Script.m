% Spline cubica interpolante

close all
clear all
clc

x = [0.1 0.5 0.2 0.7 0.8 0.9].';
y = [5 7 6 8 6 5].';

xx = linspace(x(1), x(end), 100);

[yy] = AD_SplineCubicaInterpolante(x,y,xx);

% spline vincolata
yy_matlab = spline(x, y, xx);

% spline naturale
pp_variational = csape(x, y, 'variational');

% spline periodica
pp_periodic = csape(x, y, 'periodic');

% spline not-a-knot
pp_not_a_knot = csape(x, y, 'not-a-knot');

figure
plot(x,y,'*')
hold on
plot(xx,yy,'--r')
axis tight
xlim([0.1 0.9])
ylim([5 8.5])
title('My Spline');

figure
plot(x,y,'*')
hold on
plot(xx,yy_matlab,'-r')
hold on
plot(xx,ppval(pp_variational,xx),'--b')
hold on
plot(xx,ppval(pp_periodic,xx),'--c')
hold on
plot(xx,ppval(pp_not_a_knot,xx),'--g')
axis tight
xlim([0.1 0.9])
ylim([5 8.5])
title('Spline MATLAB');
legend('nodi','vincolata','naturale','periodica','not-a-knot')
