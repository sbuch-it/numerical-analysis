% Formule di Quadratura

close
clear
clc

% funzione
f = @(x) 6*x.^3 - 42*x.^2 + 100*x + 6*sin(x);

% intervallo
a = 1; b = 5;

% primitiva
F = @(x) 3/2 * x.^4 - 14*x.^3 + 50*x.^2 - 6*cos(x);

disp('Calcolo con primitiva');

% calcolo dell'integrale
I = F(b) - F(a)

disp('Calcolo con MATLAB');

% calcolo dell'integrale della funzione nell'intervallo
I_matlab_funzione = integral(f, a, b)

% calcolo integrale se funzione nota solo per punti
xx = linspace(a,b,4000);
I_matlab_per_punti = trapz(xx, f(xx))

disp('Formule di Quadratura Interpolatorie');

% formula del punto di mezzo
I_punto_di_mezzo = AD_FormulaPuntoMezzo(f,a,b)

% formula dei trapezi
I_trapezi = AD_FormulaTrapezi(f,a,b)

% formula di Cavalieri Simpson
I_Cavalieri_Simpson = AD_FormulaCavalieriSimpson(f,a,b)

disp('Formule di Quadratura Composite');

tol = 1e-8;

% formula composita dei trapezi
[I,hVector,eVector,n] = AD_FormulaCompositaTrapezi(f,a,b,tol);
I_composita_trapezi = I
hVector_composita_trapezi = hVector;
eVector_composita_trapezi = eVector;

% formula composita di Cavalieri Simpson
[I,hVector,eVector,n] = AD_FormulaCompositaCavalieriSimpson(f,a,b,tol);
I_composita_CavalieriSimpson = I
hVector_composita_CavalieriSimpson = hVector;
eVector_composita_CavalieriSimpson = eVector;

figure
loglog(hVector_composita_trapezi, eVector_composita_trapezi)
hold on
loglog(hVector_composita_CavalieriSimpson, eVector_composita_CavalieriSimpson)
legend('Trapezi','Cavalieri Simpson');
title('Formule di Quadratura Composite');
% le rette hanno pendenza diversa, per Cavalieri-Simpson è
% maggiore perché converge più velocemente rispetto ai Trapezi
