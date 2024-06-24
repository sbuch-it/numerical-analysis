% ESAME 19/11/2020 es 1

close
clear
clc

n = 5;
x = [-2; -1; 0; 1; 2; 3];
y = [2; 1; 0.5; -0.5; -1; 0];

[P] = AD_Interpolazione_Polyfit(x,y,n);

xx = linspace(x(1), x(end), 100);
yy = polyval(P,xx);

figure
plot(x,y,'ro');
hold on
plot(xx,yy);

x_0 = 0;
x_1 = 0.1;
f = @(x) x.^2 / 4;
tol_a = sqrt(eps);
Kmax = 200;

[x,err,esito] = ENL_MetodoSecanti(f,x_0,x_1,tol_a,Kmax);
x
esito
