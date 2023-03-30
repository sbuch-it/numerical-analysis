% Matrice di HouseHolder

clear
clc

x = [4; 7; 4]

format rat

Q = SL_MD_MatriceHouseHolder(x)
Q_trasposta = Q.'
Q_inversa = inv(Q)

format short

Q * x
