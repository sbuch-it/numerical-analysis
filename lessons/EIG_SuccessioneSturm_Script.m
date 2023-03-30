% Stima autovalori con metodo di Sturm

% esempio con autovalori reali

A = [4 -1 1 0 0;
    1 3 -1 0 0;
    0 1 1 0 0;
    0 0 0 2 1;
    0 0 0 1 8]

eig(A)

[U,T] = schur(A)

% esempio con autovalori complessi coniugati

A = [0 -1 1 4;
    1 -5 3 1;
    -8 -1 0 10;
    -1 5 1 -34]

eig(A)

[U,T] = schur(A)

% funzione

A = [8 1 0 0 1;
    1 5 2 1 0;
    0 2 10 1 1;
    0 1 1 6 2;
    1 0 1 2 -12];

[Q,H] = EIG_MatriceHessenberg(A);

alpha = diag(H);
beta = diag(H,-1);


N = EIG_SuccessioneSturm(alpha,beta,3) - EIG_SuccessioneSturm(alpha,beta,6)

