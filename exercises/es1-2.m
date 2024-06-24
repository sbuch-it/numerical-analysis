% Eserciziario - es1.2

clear
clc

i = 1;
alphaVector = linspace(-10,10);

cond1 = zeros(length(alphaVector),1);
cond2 = zeros(length(alphaVector),1);
condInf = zeros(length(alphaVector),1);

for alpha = alphaVector
    A = [1+alpha, 1; -1, -1];
    cond1(i) = max(sum(abs(inv(A)))) * max(sum(abs(A)));
    cond2(i) = sqrt(max(abs(eig(inv(A.') * inv(A))))) * sqrt(max(abs(eig(A.' * A))));
    condInf(i) = max(sum(abs(inv(A.')))) * max(sum(abs(A.')));
    i = i + 1;
end

figure
plot(alphaVector, cond1, 'b*');
hold on
plot(alphaVector, cond2, 'go');
hold on
plot(alphaVector, condInf, 'r--');
legend('cond1', 'cond2', 'condInf')
