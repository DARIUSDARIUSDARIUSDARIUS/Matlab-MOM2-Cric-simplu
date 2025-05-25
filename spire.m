function [nr_spire_calculat,nr_spire,li,A_filet,W,solicitare_incovoiere,solicitare_forfecare,tensiunea_echivalenta,tensiune_admisibila] = spire(P,aliaj,F,d,D1,H,D4)
Km = mean(linspace(0.55,0.75,10)); % coeficient de corectie

if P<2
    ac = 0.15;
elseif 2<=P && P<=5
    ac = 0.25;
elseif 5<P && P<=12
    ac = 0.5;
elseif P>12
    ac = 1;
end

limita_curgere = functie_switch_aliaje(aliaj);
presiune_admisibila = mean(5:15);
nr_spire_calculat = F/((pi/4) * (d^2-D1^2) * presiune_admisibila);
nr_spire = round(nr_spire_calculat + 1);

li = (H/2) * ac;
A_filet = pi * D4 * ((P/2) + 2 * li * tan(deg2rad(15)));
W = (pi * D4 * ((P/2) + 2 * li * tan(deg2rad(15)))^2) / 6;

solicitare_incovoiere = ((F/nr_spire)*li)/W;
solicitare_forfecare = (F/(Km*nr_spire))/A_filet;
tensiunea_echivalenta = sqrt(solicitare_incovoiere^2 + 4 * solicitare_forfecare^2);
tensiune_admisibila = limita_curgere / 3; % 3 fiind coeficientu de siguranta si 280 limita de curgere

if tensiunea_echivalenta < tensiune_admisibila
    disp('e bine')
else
    disp('nu-i bine')
end
end