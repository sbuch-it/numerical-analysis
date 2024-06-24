function [r] = ESAME_2020_1_1_func(alpha)
    r = [];
    for a = alpha
        A = [-2 * sin(a), -1, 0, 0.5, 1;
            1, -4, 1, -10 * a^3, 2;
            -2, 0, -0.5, 0, 4;
            0.5, 0, 10, 4, 6;
            5, 0, 10, 4, 6];
        
        [L,U] = SL_MD_Doolittle(A);
        d = prod(diag(U));
        r = [r d];
    end
end