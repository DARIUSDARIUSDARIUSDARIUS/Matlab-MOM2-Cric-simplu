% Define input parameters
F = 16000; % N
H = 200; % mm
d3 = 20.5; % mm
d = 26; % mm
d2 = 23.5; % mm
D1 = 21; % mm
D4 = 26.5; % mm
gamma = 1.3;
P = 5; % mm
forta_muncitor = 125; % newtoni
coef_frecare = 0.2; % otel pe fonta
tensiune_admisibila_beton = 2.5; % MPa

% Define aliaj (material alloy)
aliaj = 'OL50';

% Get material properties
[~,~,~,limita_curgere, limita_rupere] = functie_switch_aliaje(aliaj);

% Call autofix to get M12
[~, ~, M12, ~, ~, ~, ~] = autofix(P, d2, coef_frecare, F, d3, limita_curgere);


% Let's call the functions in sequence, ensuring dependencies are met:
[psi,phi,M12_calc,sigma,tau,sigma_echivalent,sigma_admisibil] = autofix(P,d2,coef_frecare,F,d3,limita_curgere);
disp(['M12 calculated by autofix: ', num2str(M12_calc)]);
disp(rad2deg(phi))
disp(rad2deg(psi))

[Tt,Wt,hc,Mi,M14,dc,Dc,Dc_prim,dc_prim,Mtot_calc] = dim_parghie(d3,F,tensiune_admisibila_beton,coef_frecare,forta_muncitor,M12_calc);
disp(['Mtot calculated by dim_parghie: ', num2str(Mtot_calc)]);


% Calculate randament_total after Mtot is obtained
randament_total = (F*P)/(Mtot_calc * 2 * pi);
disp(['Total efficiency (randament_total): ', num2str(randament_total)]);


% Other function calls you might want to include:
d3_calculated = dimensionare(aliaj,F,gamma);
disp(['Calculated d3: ', num2str(d3_calculated)]);

[Dbe_nut,Dbi_nut,Din_nut,hg,Hp,Dg,Dg_prim,Dg_prim_min,De_prim,De,De_min] = dim_piulita(H,gamma,F,limita_rupere,D4,P);
disp(['Nut outer diameter (Dbe_nut): ', num2str(Dbe_nut)]);

[nr_spire_calc,nr_spire_round,li,A_filet,W,sol_incov,sol_forf,tens_echiv_spire,tens_admis_spire] = spire(P,aliaj,F,d,D1,H,D4);
disp(['Number of threads calculated: ', num2str(nr_spire_calc)]);

[lambda,cfj,imin,Imin,A,Ff] = flambaj(H,d3,F,aliaj);
disp(['Buckling safety coefficient (cfj): ', num2str(cfj)]);

% For dim_baza, Din is needed. It's an output of dim_piulita.
[Dbi_base,Dbe_base] = dim_baza(H,F,tensiune_admisibila_beton,Din_nut);
disp(['Base outer diameter (Dbe_base): ', num2str(Dbe_base)]);