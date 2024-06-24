% Esame 29/06/2021 es 2

close all
clear all
clc

A = [8 1 6 0 2;
    1 5 2 1 0;
    6 2 10 1 1;
    0 1 1 6 2;
    2 0 1 2 -12];

EIG_Gershgorin(A);

% la matrice A non è definita positiva perché
% non ha tutti gli autovalori positivi

[Q,H] = hess(A);

[U, T] = schur(H)

while norm(tril(H,-1))> sqrt(eps)

[Q,R]=qr(H);

H=R*Q;

end

autovalori_QR = diag(H)

% alpha = diag(H);
% beta = diag(H,-1);
% N = size(H,1);
% 
% P(1) = 1;
% P(2) = x - alpha(1);
% for i = 2 : N
%     P(i+1) = (x - alpha(i)) * P(i) - beta(i-1).^2 * P(i-1);
% end
% 
% P

autovalori = eig(A)
