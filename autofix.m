function [psi,phi,M12,sigma,tau,sigma_echivalent,sigma_admisibil] = autofix(P,d2,coef_frecare,F,d3,limita_curgere)
psi = atan(P / (pi*d2));
phi = atan(coef_frecare/( cos(deg2rad(15)) ));
M12 = F * (d2/2) * tan(psi + phi);
sigma = F /( (pi*d3^2)/4 );
tau = M12 /( (pi*d3^3)/16 );
sigma_echivalent = tensiune_echivalenta(sigma,tau);
sigma_admisibil = limita_curgere/3; % coeficient de siguranta - 3


if sigma_echivalent < sigma_admisibil
    disp('rezista')
else
    disp('nu rezista')
end
end