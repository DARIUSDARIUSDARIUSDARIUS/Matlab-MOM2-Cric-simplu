function [Dbi,Dbe] = dim_baza(H,F,tensiune_admisibila_beton,Din)
if H>=200
    Dbi = Din + 2 * H * tan(deg2rad(3));
else
    Dbi = Din + 2 * H * tan(deg2rad(6));
end

Dbe = sqrt((4*F)/(pi*tensiune_admisibila_beton)+Dbi^2);
end