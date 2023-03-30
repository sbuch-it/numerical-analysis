%% ESAME 04/05/2021 testo 1 - es 1

close all
clear all


fplot(@ESAME_2020_1_1_func,[-1,0.5]); grid on
% 
% det_laplace = length(alphaVector);
% 
% j = 1;
% for alpha = alphaVector
%     
%     A = @(alpha) [-2 * sin(alpha), -1, 0, 0.5, 1;
%         1, -4, 1, -10 * alpha^3, 2;
%         -2, 0, -0.5, 0, 4;
%         0.5, 0, 10, 4, 6;
%         5, 0, 10, 4, 6];
% 
%     [L,U] = SL_MD_Doolittle(A);
%     det_laplace(j) = prod(diag(U));
%     j = j + 1;
% end
% 
% figure;
% grid on
% plot(alphaVector, det_laplace);
% 
% % [x] = ENL_Bisezione(f,-1,0.5,1e-3,50)
% 
% % value = alphaVector(find(min(abs(det_laplace)) == det_laplace))
% % 
% % implementare il metodo della bisezione
% % 
% % 
