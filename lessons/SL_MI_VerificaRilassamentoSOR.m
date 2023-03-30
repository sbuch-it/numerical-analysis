% Verifica SOR

omegaV = linspace(1,2,1000);

for ii = 1:length(omegaV)
    omega = omegaV(ii);
    M = [1-omega , -omega/4; -omega*(1-omega) , omega^2/4+(1-omega)];
    rho(ii) = max(abs(eig(M)));
end

plot(omegaV,rho);