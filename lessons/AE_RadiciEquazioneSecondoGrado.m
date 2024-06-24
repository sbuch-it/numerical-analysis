function [x1,x2] = AE_RadiciEquazioneSecondoGrado(a,b,c)
    % Calcolo Soluzione di una Equazione di Secondo Grado
    %
    % Provare con i seguenti valori e verificare
    % la correttezza con la funzione roots di Matlab
    % (riceve in ingresso il vettore dei coefficienti)
    %
    % 1) [x1,x2] = AE_RadiciEquazioneSecondoGrado(1,10,1)
    % 2) [x1,x2] = AE_RadiciEquazioneSecondoGrado(1,1000,1)
    % 3) [x1,x2] = AE_RadiciEquazioneSecondoGrado(1,1e8,1)
    %
    % Se il risultato è corretto, allora x1 * x2 = c / a
    %
    % Se calcoliamo le radici con la formula classica cioè
    % x1 = (-b + sqrt(Delta)) /2 /a
    % x2 = (-b - sqrt(Delta)) /2 /a
    % allora per il caso 1 e 2 non si hanno problemi mentre
    % nel terzo caso si verifica il fenomeno di cancellazione
    % numerica infatti si ottiene un risultato diverso
    % utilizzando la funzione di Matlab roots([1,1e8,1])
    %
    % L'algoritmo risolve il fenomeno di cancellazione numerica
    
    Delta = (b^2) - (4 * a * c);
    
    if Delta < 0
        disp('nessuna radice reale');
        x1 = [];
        x2 = [];
    else
        if b > 0
            x1 = (-b - sqrt(Delta)) /2 /a;
            x2 = c /a /x1;
        else
            x1 = (-b + sqrt(Delta)) /2 /a;
            x2 = c /a /x1;
        end 
    end
    
    disp(strcat('x1 * x2 = ', num2str(x1 * x2)));
    
end