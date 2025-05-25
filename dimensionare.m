function d3_calculat = dimensionare(aliaj,F,gamma)
limita_curgere = functie_switch_aliaje(aliaj);
d3_calculat = sqrt((4 * gamma * F) / (pi * limita_curgere));
end