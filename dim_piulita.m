function [Dbe,Dbi,Din,hg,Hp,Dg,Dg_prim,Dg_prim_min,De_prim,De,De_min] = dim_piulita(H,gamma,F,D4,P,nr_spire)
if H >= 200
    alpha = deg2rad(3);
else
    alpha = deg2rad(6);
end
aliaj = 'FC300';
[~,~,~,~, limita_rupere] = functie_switch_aliaje(aliaj);
De_min = sqrt( ((4 * gamma * F) / (pi * (limita_rupere/5))) + D4^2 );   % limita rupere / 5 coeficient de siguranta
De = round(De_min + 7); % 7 mm pt siguranta intre 5 si 10
De_prim = De + 2; % 2 mm pt tesitura

Dg_prim_min = round(sqrt( De_prim^2 + ((4 * F) / (pi * 100)))); % 100 MPa sigma as pentru otel fonta
Dg_prim = Dg_prim_min + 7; % pt siguranta
Dg = Dg_prim + 2; % pt tesitura

Hp = nr_spire * P; % inaltimea piulitei 10 fiind nr spire
hg = 0.25 * Hp; % inaltimea gulerului 0.25 constanta arbitrara intre 0.2 si 0.25

Din = De+7;

Dbi = round(2*(H*tan(alpha)) + Din);
Dbe = round(sqrt(Dbi^2 + (4*F) / (pi*100) ));  % 100 MPA sigma as pentru otel fonta
end