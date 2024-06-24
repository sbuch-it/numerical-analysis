function [P] = AD_InterpolazionePolyfit(x,y,n)
    % Interpolazione
    %
    % INPUT
    % x: nodi
    % y: valori f(x)
    % n: grado del polinomio interpolante
    % OUTPUT
    % P: polinomio interpolante di grado n
    
    % assicura che x e y siano vettori colonna
    x = reshape(x, length(x), 1);
    y = reshape(y, length(y), 1);
    
    % costruiamo A come matrice di Vandermonde
    A = [];
    for i = 0 : n
        A = [A, x.^(i)];
    end
    
    % Fattorizzazione QR di una matrice rettangolare
    [Q,R] = SL_MD_FattorizzazioneQR(A);
    %[Q,R] = qr(A);
    
    b = Q.' * y; % b tilde
    b1 = b(1 : n+1); % b1 tilde
    R1 = R(1 : n+1, 1 : n+1);
    R1 = triu(R1); % rende matrice triangolare superiore
    P = SL_SostituzioneIndietro(R1, b1);
    P = flip(P).';
end