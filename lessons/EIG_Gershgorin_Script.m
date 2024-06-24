% Teoremi di Gershgorin

close
clear
clc

A=[4 -1 1 0 0;
    1 3 -1 0 0;
    0 1 1 0 0;
    0 0 0 2 1;
    0 0 0 1 8];

EIG_Gershgorin(A);

eig(A)
