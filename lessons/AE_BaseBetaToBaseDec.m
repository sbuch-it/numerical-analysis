function [sol] = AE_BaseBetaToBaseDec(a,beta)
    % Conversione da base beta a base decimale
    %
    % INPUT
    % a: vettore dei coefficienti, a = [am, ..., a0]
    % beta: base iniziale
    % OUTPUT
    % sol: numero convertito in base decimale
    
    [sol] = AE_ValutarePolinomioHorner(a,beta);
    
end