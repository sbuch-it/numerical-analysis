
alpha = -2;

B = [0 -1 0 1 -3;
    -2 -1 0 alpha 1;
    -2 0 0 0 4;
    0 0 10 4 0;
    0 0 4 0 1]

[Q,R] = SL_MD_FattorizzazioneQR(B);

[q r] = qr(B);


Q
q

R
r