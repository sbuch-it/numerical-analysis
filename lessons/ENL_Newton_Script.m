% Metodo di Newton Raphson

close
clear
clc

f = @atan;
df = @(x) 1./(1+x.^2);
x_0 = 1.3;
x_1 = 1.31;
tol_a = sqrt(eps);
Kmax = 200;

x_matlab = fzero(f,x_0)

figure
fplot(f)
hold on
fplot(df)
hold on
plot(0,x_matlab,'r*')
grid on
legend('funzione','derivata','fzero');
title('Convergenza con la funzione di MATLAB');

[x,err,esito] = ENL_NewtonRaphson(f,df,x_0,tol_a,Kmax);

if esito == 1
    x_NewtonRaphson = x(end)

    figure
    fplot(f)
    hold on
    plot(0,x(end),'r*')
    hold on
    plot(x,'bo')
    hold on
    semilogy(x)
    grid on
    legend('funzione','derivata','fzero','convergenza');
    title('Convergenza con Newton Raphson');
else
    disp('Newton Raphson non converge');
end

[x,err,esito] = ENL_NewtonStazionario(f,df,x_0,tol_a,Kmax);

if esito == 1
    x_NewtonStazionario = x(end)
    
    figure
    fplot(f)
    hold on
    plot(0,x(end),'r*')
    hold on
    plot(x,'bo')
    hold on
    semilogy(x)
    grid on
    legend('funzione','derivata','fzero','convergenza');
    title('Convergenza con Newton Stazionario');
else
    disp('Newton Stazionario non converge');
end

[x,err,esito] = ENL_NewtonDifferenze(f,x_0,tol_a,Kmax);

if esito == 1
    x_NewtonDifferenze = x(end)
    
    figure
    fplot(f)
    hold on
    plot(0,x(end),'r*')
    hold on
    plot(x,'bo')
    hold on
    semilogy(x)
    grid on
    legend('funzione','derivata','fzero','convergenza');
    title('Convergenza con Newton alle Differenze');
else
    disp('Newton alle Differenze non converge');
end

[x,err,esito] = ENL_MetodoSecanti(f,x_0,x_1,tol_a,Kmax);

if esito == 1
    x_MetodoSecanti = x(end)
    
    figure
    fplot(f)
    hold on
    plot(0,x(end),'r*')
    hold on
    plot(x,'bo')
    hold on
    semilogy(x)
    grid on
    legend('funzione','derivata','fzero','convergenza');
    title('Convergenza con Metodo delle Secanti');
else
    disp('Metodo delle Secanti non converge');
end

a = -2;
b = 2;
[x,err,esito] = ENL_RegulaFalsi(f,a,b,tol_a,Kmax);

if esito == 1
    x_RegulaFalsi = x(end)
    
    figure
    fplot(f)
    hold on
    hold on
    plot(0,x(end),'r*')
    hold on
    plot(x,'bo')
    hold on
    semilogy(x)
    grid on
    legend('funzione','derivata','fzero','convergenza');
    title('Convergenza con Metodo Regula Falsi');
else
    disp('Metodo Regula Falsi non converge');
end