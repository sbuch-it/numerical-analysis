%% ESAME 04/05/2021 testo 2 - es 1

alphaVector = linspace(-1,1);

j = 1;
for alpha = alphaVector
    
    A = [-2 1 0 0.5 1;
        1 -4 1 3-exp(-alpha) 2;
        -2 0 -0.5 0 4;
        0.5 0 10 4 6;
        5 0 10 4 6];
    
    det_mat(j) = det(A);
    
    [Det] = DeterminanteLaplaceRighe(A);
    
    det_laplace(j) = Det;
    
    j = j + 1;
end

value = alphaVector(find(min(abs(det_laplace)) == det_laplace))

plot(alphaVector, det_laplace);
