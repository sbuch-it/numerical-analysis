% Interpolazione

clear
clc

% (x0,y0)=(-1,-3) , (x1,y1)=(1,0) , (x2,y2)=(2,4)
x = [-1 1 2].';
y = [-3 0 4].';

n = 2; % grado del polinomio
xx = linspace(x(1), x(end),100);

P_matlab = polyfit(x, y, n)
yy_matlab = polyval(P_matlab, xx);

P_polyfit = AD_InterpolazionePolyfit(x, y, n)
yy = polyval(P_polyfit,xx);
f = @(x) P_polyfit(3) * x.^2 + P_polyfit(2) * x + P_polyfit(1);

P_Lagrange = AD_InterpolazioneLagrange(x,y,xx);

P_Newton = AD_InterpolazioneNewton(x,y,xx);

figure
plot(x, y, '*')
hold on
plot(xx, yy_matlab)
hold on
plot(xx, f(xx), 'o')
hold on
plot(xx, P_Lagrange, '+')
hold on
plot(xx, P_Newton, 'x')
