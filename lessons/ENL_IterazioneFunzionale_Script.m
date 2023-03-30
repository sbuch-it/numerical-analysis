% Metodi di iterazione funzionale

clear
clc

% caso 1: non converge
% nemmeno partendo molto vicino
g=@(x) x.^4+x-4;
figure
ENL_IterazioneFunzionale(g,-1.4142)
title('caso 1: non converge')

% caso 2: converge monotonicamente
g=@(x) -(x.^4-4)/11+x;
figure
ENL_IterazioneFunzionale(g,1)
title('caso 2: converge monotonicamente')

% caso 3: converge oscillando
% si vede facendo uno zoom intorno al punto fisso)
g=@(x) -(x.^4-4)/8+x;
figure
ENL_IterazioneFunzionale(g,2)
title('caso 3: converge oscillando')
