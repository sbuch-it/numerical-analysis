% Esempio di una Propagazione di errore in una Sommatoria
%
% I numeri piccoli posso essere gestiti dalla macchina,
% i problemi si hanno quando devono essere confrontati
% con numeri molto più grandi.

% PRIMO CASO
% Supponiamo di avere dei coefficienti di cui il primo a1=1
% e tutti gli altri che sono 2^24 hanno un valore pari
% alla 2^-24. Il risultato alla fine del ciclo dovrebbe
% essere 1 e poi sommiamo 1 quindi il valore finale della
% variabile è a=2.

clear
clc

a = single(0);
for i = 1 : 2^24
    a = a + 2^(-24); 
end
a = a + 1;

disp('Primo Caso');
disp(a);

% SECONDO CASO
% Se invece consideriamo il seguente codice, quindi partiamo
% da a=1 e poi eseguiamo lo stesso ciclo di prima dovrei avere
% come risultato finale sempre la variabile a=2 invece se lo
% eseguiamo risulta a=1 perché stiamo lavorando in singola
% precisione e sappiamo che il numero più piccolo che sommato
% ad 1 viene un valore diverso da 1 è 10^-23 quindi per Matlab
% in questo caso 10^-24 = 1

a = single(1);
for i = 1 : 2^24
    a = a + 2^(-24); 
end

disp('Secondo Caso');
disp(a);
