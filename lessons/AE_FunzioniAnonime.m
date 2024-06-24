% Funzioni Anonime

clear
clc

f = @(x) (sin(x) + x).^2;
x = 0 : 0.01 : 2 * pi;
y = f(x);

% plot della funzione in modi equivalenti
plot(x,y);
axis tight
xlim([0 2*pi])
figure;
fplot(f,[0,2*pi]);
