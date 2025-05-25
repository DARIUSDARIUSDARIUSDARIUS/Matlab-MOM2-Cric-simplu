function [a,b,lambda0,limita_curgere,limita_rupere] = functie_switch_aliaje(aliaj)
switch aliaj
    case 'OL37'    %OL37
        a=310;  %MPa
        b=1.14;  %MPa
        lambda0=100;
        limita_curgere = 225; % N/mm^2
        limita_rupere = 400;
    case 'OL42'    %OL42
        a=328;  %MPa
        b=1.15;  %MPa
        lambda0=96;
        limita_curgere = 245; % N/mm^2
        limita_rupere = 450;
    case 'OL50'    %OL50
        a=335;  %MPa
        b=1.62;  %MPa
        lambda0=89;
        limita_curgere = 280; % N/mm^2
        limita_rupere = 500;
    case 'FC300'
        limita_rupere = 300;
        a=0;
end