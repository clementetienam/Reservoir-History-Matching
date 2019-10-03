function plotAnisotropicVariogramsAverage(h, aveVario_OPCA, aveVario_PCA)
%  Authors: H. X. Vo and L. J. Durlorfky
%% "0" degree (angle center) direction
figure
plot( h, aveVario_OPCA(:, 1), 'bo--', h, aveVario_PCA(:, 1), 'ro--');
legend('O-PCA', 'PCA');
xlabel('Distance (number of blocks)', 'FontName', 'Times New Roman', 'FontSize', 18, 'FontWeight', 'n')
ylabel('Semivariogram', 'FontName', 'Times New Roman', 'FontSize', 18, 'FontWeight', 'n')
set(gca,'FontName', 'Times New Roman', 'FontSize', 18, 'FontWeight', 'n')
% ylim([0, 0.5]); % for binary case
ylim([0, 15]); % for bimodal case
%% "45" degree (angle center) direction
figure
plot( h, aveVario_OPCA(:, 2), 'bo--', h, aveVario_PCA(:, 2), 'ro--');
legend('O-PCA', 'PCA');
xlabel('Distance (number of blocks)', 'FontName', 'Times New Roman', 'FontSize', 18, 'FontWeight', 'n')
ylabel('Semivariogram', 'FontName', 'Times New Roman', 'FontSize', 18, 'FontWeight','n')
set(gca,'FontName', 'Times New Roman', 'FontSize', 18, 'FontWeight', 'n')
% ylim([0, 0.5]); % for binary case
ylim([0, 15]); % for bimodal case
%% "90" degree (angle center) direction
figure
plot( h, aveVario_OPCA(:, 3), 'bo--', h, aveVario_PCA(:, 3), 'ro--');
legend( 'O-PCA', 'PCA');
xlabel('Distance (number of blocks)', 'FontName', 'Times New Roman', 'FontSize', 18, 'FontWeight', 'n')
ylabel('Semivariogram', 'FontName', 'Times New Roman', 'FontSize', 18, 'FontWeight', 'n')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18, 'FontWeight', 'n')
% ylim([0, 0.5]); % for binary case
ylim([0, 15]); % for bimodal case
end

