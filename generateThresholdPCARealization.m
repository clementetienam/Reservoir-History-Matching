function xPCA_thr = generateThresholdPCARealization(xPCA)
%  Authors: H. X. Vo and L. J. Durlorfky
%% Truncation is done using Otsu's method (Sezgin and Sankur, 2004)
xPCA_thr = xPCA;
level = graythresh(xPCA_thr); % threshold is found using Otsu's method
lowPixelIndex = (xPCA_thr < level);
xPCA_thr(lowPixelIndex) = 0;
highPixelIndex = (xPCA_thr >= level);
xPCA_thr(highPixelIndex) = 1;
end

