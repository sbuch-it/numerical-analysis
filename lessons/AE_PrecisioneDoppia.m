% Precisione Doppia

clear
clc

epsilon = double(0.5);
temp = 1 + epsilon;
n_bit_mantissa = 1;

while temp > 1
    epsilon = epsilon / 2;
    n_bit_mantissa = n_bit_mantissa + 1;
    temp = 1 + epsilon;
end

epsilon = 2 * epsilon;
n_bit_mantissa = n_bit_mantissa - 1;
 
disp('Doppia Precisione:');
disp(strcat('epsilon calcolato = ', num2str(epsilon)));
disp(strcat('epsilon funzione in-line = ', num2str(eps('double'))));
disp('N di bit totali = 64');
disp('N di bit dedicati al Segno = 1');
disp(strcat('N di bit dedicati alla Mantissa = ', num2str(n_bit_mantissa)));
disp(strcat('N di bit dedicati alla Caratteristica = ', num2str(64-n_bit_mantissa-1)));
disp(strcat('Numero più piccolo rappresentabile in modulo = ',num2str(realmin('double'))));
disp(strcat('Numero più grande rappresentabile in modulo = ',num2str(realmax('double'))));
