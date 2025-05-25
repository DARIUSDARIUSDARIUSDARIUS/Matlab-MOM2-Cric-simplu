function [Tt,Wt,hc,Mi,M14,dc,Dc,Dc_prim,dc_prim,Mtot] = dim_parghie(M12,d3,F,tensiune_admisibila_beton,coef_frecare,forta_muncitor)
aliaj = 'OL42';
dc_prim = d3+2;
Dc_prim = round(sqrt(dc_prim + (F * 4) / (pi * tensiune_admisibila_beton ) ));
dc = dc_prim + 2;
Dc = Dc_prim + 2;
limita_curgere = functie_switch_aliaje(aliaj);

M14 = (1/3) * coef_frecare * F * ( (Dc_prim^3 - dc_prim^3) / (Dc_prim^2 - dc_prim^2) );
Mtot = M12 + M14;
randament =  round(Mtot/forta_muncitor);
Lc = randament - Dc/2;
Mi = forta_muncitor * Lc;
dp_prim = round(nthroot((32*Mi) / (pi * limita_curgere) ,3)+0.5); %sigma admisibil

hc= (Dc-dp_prim) / 2;
Wt = 2 * (Dc^3/22.9) * ((2*hc) / Dc)^2.82;
Tt = Mtot/Wt;

if (Dc/hc)<2 || (Dc/hc)>8
    warning('jale mare mareste Dc')
end
end