% Conversione da base decimale a base beta

clear
clc

disp('Esempio 1: (11)_2');
[sol_int,sol_dec] = AE_BaseDecToBaseBeta(11,2,4,1)

disp('Esempio 2: (1/4)_2');
[sol_int,sol_dec] = AE_BaseDecToBaseBeta(1/4,2,1,2)

disp('Esempio 3: (0.1)_2');
[sol_int,sol_dec] = AE_BaseDecToBaseBeta(0.1,2,1,5)
% se aumentiamo il valore di n osserviamo che abbiamo
% una sequenza periodica quindi la rappresentazione in
% macchina del numero 0.1 non è mai accurata
