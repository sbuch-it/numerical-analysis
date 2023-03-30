% Fattorizzazione QR

clear
clc

% matrice quadrata

A = [1 1 1; 2 -1 -1; 2 -4 5]

[Q,R] = SL_MD_FattorizzazioneQR(A);

[Q_m,R_m] = qr(A);

Q * R

% matrice rettangolare

A = [1 1 1 1; 2 -1 -1 2; 2 -4 -4 2]

[Q,R] = SL_MD_FattorizzazioneQR(A);

[Q_m,R_m] = qr(A);

Q * R
