% Calcolo del determinante con Laplace

clear
clc

A = [5 1 7 8; 6 7 9 5; 1 3 5 2; 4 2 2 8]

d = det(A);
disp(strcat('Determinante con funzione di MATLAB = ',num2str(d)));

d = AL_DeterminanteLaplaceRighe(A);
disp(strcat('Determinante con teorema di Laplace per righe = ',num2str(d)));

d = AL_DeterminanteLaplaceColonne(A);
disp(strcat('Determinante con teorema di Laplace per colonne = ',num2str(d)));
