function [h, angle_center, aveVario] = computeAnisotropicVariogramsAverage(XVario, Nx, Ny)
%  Authors: H. X. Vo and L. J. Durlorfky
%% mGstat toolbox (http://mgstat.sourceforge.net/) is used to compute the variograms
%% Setup for position of gridblock
temp = repmat((1:Nx)', 1, Ny);
iPos = temp(:);
temp = repmat((1:Ny), Nx, 1);
jPos = temp(:);
pos  = [iPos, jPos]; % (i,j) of each gridblock 
%% Using function from mGstat
addpath('M:/My Documents/Research/PHD/MGSTAT/'); % add a path where mGstat is
xr = XVario(:, 1); % values corresponding to (i,j)
ang = [-22.5, 22.5, 67.5, 112.5]; % angle ranges
[~, h, angle_center] = semivar_exp(pos, xr, 20, ang); % just to get length of h
aveVario = zeros(length(h), length(ang)-1); % average semivariogram
NVario = size(XVario, 2);
for j=1:NVario
    xr = XVario(:, j);
    [gamma, h, angle_center] = semivar_exp(pos, xr, 20, ang);
    aveVario = aveVario + gamma / NVario;
end
end