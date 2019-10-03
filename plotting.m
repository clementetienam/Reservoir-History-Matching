function plotting(xRecon, Nx, Ny, str, iInj, jInj, iProd, jProd, xLB, xUB)
%  Authors: H. X. Vo and L. J. Durlorfky
%% Plot image
figure
xMat = reshape(xRecon, Nx, Ny)'; % take transpose because reshape performs operation columnwise
imagesc(xMat); % origin in the top left corner by default of imagesc function
hold on

plot(iInj, jInj , 'ok', 'MarkerFaceColor', [0.99 0.99 0.99], 'MarkerSize', 8);
% plot(iInj, jInj, '^k', 'MarkerFaceColor', [0.99 0.99 0.99], 'MarkerSize', 8); % used to differentiate injection and production wells
% %  Write injection well names
% for index=1:length(iInj)
%     text(iInj(index)-1, jInj(index)-2, ['I' num2str(index)], 'FontName', 'Times New Roman', 'color', 'k', 'FontSize', 12, 'FontWeight', 'b');
% end

plot(iProd, jProd, 'ok', 'MarkerFaceColor',[0.99 0.99 0.99], 'MarkerSize',8);
% %  Write production well names
% for index=1:length(iProd)
%     text(iProd(index)-2, jProd(index)-2, ['P' num2str(index)], 'FontName', 'Times New Roman', 'color', 'k', 'FontSize', 12, 'FontWeight', 'b'); 
% end

title(str);
colorbar;
caxis([xLB, xUB]); 
set(gca, 'ydir', 'normal'); % put origin in the bottom left corner (normal location) 
axis equal tight
xlabel('', 'FontName', 'Times New Roman', 'FontSize', 18, 'FontWeight','n')
ylabel('', 'FontName', 'Times New Roman', 'FontSize', 18, 'FontWeight','n')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18, 'FontWeight','n')
%% Plot histogram (marginal PDF)
figure
hist(xRecon, 21);
title(str);
xlabel('Value', 'FontName', 'Times New Roman', 'FontSize', 18, 'FontWeight','n')
ylabel('Count', 'FontName', 'Times New Roman', 'FontSize', 18, 'FontWeight','n')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18, 'FontWeight','n')
xlim([xLB, xUB]); 
% ylim([0, 800]); % for bimodal
end