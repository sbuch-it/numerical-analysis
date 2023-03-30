%% ESAME 04/05/2021 testo 1 - es 3

[sol_int,sol_dec] = BaseDecToBaseBeta(5.75,2,3,2);

sol_int_mantissa = sol_int;
sol_dec_mantissa = sol_dec;

molt = length(sol_int) - 1;

q_dec = 127 + molt;

[sol_int,sol_dec] = BaseDecToBaseBeta(q_dec,2,11,0);

a_0 = sol_int_mantissa(1);
a = [ sol_int_mantissa(2:length(sol_int_mantissa)); sol_dec_mantissa];

disp('Esponente');
sol_int.'

disp('Mantissa');
a.'
