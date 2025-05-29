function [lambda,cfj,imin,Imin,A,Ff] = flambaj(H,d3,F,aliaj) % lambda0 pentru OL50 = 89
lungime_flambaj = (1.35*H)*2;
E = 2.1*10^5;
A = (pi*d3^2)/4;
Imin = (pi*d3^4)/64;
imin = sqrt(Imin/A);
lambda = lungime_flambaj/imin;
[a,b,lambda0] = functie_switch_aliaje(aliaj);

if lambda < lambda0
    disp('flambaj plastic')
    Ff = (a-b*lambda)*A;
else
    disp('flambaj elastic')
    Ff = (pi^2*E*Imin)/lungime_flambaj^2;
end
cfj = Ff/F; %coeficient siguranta la flambaj

if (5>cfj) && (cfj>3)
    disp('Coeficientul de siguranta la flambaj este bun')
else
    disp('coeficientul de siguranta la flambaj NU este bun')
end
end