function [Q] = SL_MD_MatriceHouseHolder(x)
    % Matrice di HouseHolder
    %
    % INPUT
    % x: generico vettore
    % OUTPUT
    % Q: matrice di HouseHolder
    
    n = length(x);
    sigma = norm(x);
    
    if x(1) > 0
        k = -1 * sigma;
    else
        k = sigma;
    end
    
    beta = sigma * (sigma + abs(x(1)));
    e = [1; zeros(n-1,1)];
    v = x - k * e;
    Q = eye(n) - (1/beta) * v * v.';
    
end