function SGEMSSandFracAve = computeAveSandFractionOfSGeMSRealizations(XSubset_SGeMS)
%  Authors: H. X. Vo and L. J. Durlorfky
%  Note: this function is not written for efficiency but rather than for easy to understand
%% Computing avaerage sand-fraction of SGeMS realizations
SGEMSShaleFracAve = 0;
SGEMSSandFracAve = 0;
NrSGEMS = size(XSubset_SGeMS, 2);
for realizCounter = 1:NrSGEMS %loop through each realization
    xr = XSubset_SGeMS(:, realizCounter);
    shaleFrac = sum(xr == 0) / (sum(xr == 0) + sum(xr == 1));
    SGEMSShaleFracAve = SGEMSShaleFracAve + shaleFrac/NrSGEMS; % computing average
    sandFrac = sum(xr == 1) / (sum(xr == 0) + sum(xr == 1));
    SGEMSSandFracAve = SGEMSSandFracAve + sandFrac/NrSGEMS; % computing average
end
end

