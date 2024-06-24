%% ESAME 04/05/2021 testo 1 - es 2

aVector = [-2 0.9999];

for a = aVector
    
    B = [0 -1 0 1 -3;
        -2 -1 0 a 1;
        -2 0 0 0 4;
        0 0 10 4 0;
        0 0 4 0 1];
    
    cond(B)
    
    % B_inv = scrivere
    
    [Q,R] = SL_MD_FattorizzazioneQR(B);
    
    disp(strcat('a = ',num2str(a)));
    
    % QR c_i = e_i
    % R c_i = y
    % Q y = e_i dato che Q ortogonale y = Q^T e_i
    
    
%     
%     Q = eye(n);
%     for i = 1:m-1
%         v1=A(i:n,1);
%         % sigma = norm(v1); da aggiungere
%         v1(i) = 
%     end
    
I = eye(5);
C = (R)\Q.';
e = norm(C * A - I) %residuo
e1 = norm(C - B_inv) / norm(B_inv); % errore



    C = inv(Q * R);
    
    e_r_prod = norm(B * inv(B) - B * C) / norm(B * inv(B))
    
    e_r_su_C = norm(inv(B) - C) / norm(inv(B))
    
    % nel primo caso siamo nell'ordine della precisione
    % di macchina mentre nell'altro caso siamo molto sotto
    
end
