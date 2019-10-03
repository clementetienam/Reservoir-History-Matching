function [OPCASandFracAve, OPCAThresSandFracAve] = computeAveSandFractionOfOPCARealizations(OPCARealizMat, Nc)
%  Authors: H. X. Vo and L. J. Durlorfky
%  Note: this function is not written for efficiency but rather than for easy to understand
%% Computing sand-fraction using pixels with values "0" and "1" only
OPCAShaleFracAve = 0;
OPCASandFracAve = 0;
NrOPCA = size(OPCARealizMat, 2);
for realizCounter=1:NrOPCA %loop through each realization
    xr = OPCARealizMat(:, realizCounter);
    shaleFrac = sum(xr == 0) / (sum(xr == 0) + sum(xr == 1));
    OPCAShaleFracAve = OPCAShaleFracAve + shaleFrac / NrOPCA; % computing average
    sandFrac = sum(xr == 1) / (sum(xr == 0) + sum(xr == 1));
    OPCASandFracAve = OPCASandFracAve + sandFrac / NrOPCA; % computing average
end
%% Computing sand-fraction using threshold for pixel values
OPCAThresShaleFracAve = 0;
OPCAThresSandFracAve = 0;
for realizCounter=1:NrOPCA %loop through each realization
    xr = OPCARealizMat(:, realizCounter);
    level = 0.5;
    shaleFrac = sum(xr < level) / Nc;
    OPCAThresShaleFracAve = OPCAThresShaleFracAve + shaleFrac / NrOPCA; % computing average
    sandFrac = sum(xr >= level) / Nc;
    OPCAThresSandFracAve = OPCAThresSandFracAve + sandFrac / NrOPCA; % computing average
end
end