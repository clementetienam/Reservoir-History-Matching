function plottinglocations(xRecon2, Nx, Ny,Nz, str,iProd, jProd, xLBd, xUBd,effective)
%  Author: Clement Etienam,PhD Petroleum Engineering 2015-2018
% Supervisor :Dr Rossmary Villegas
% Co-Supervisor: Dr Masoud Babei
%% Plot image
xRecon2=(xRecon2.*reshape(effective,532,5));
xRecon2(xRecon2==0)=NaN;
figure;
for ii=1:Nz
 xRecon=xRecon2(:,ii);
%  xLB=xLBd(:,ii);
%  xUB=xUBd(:,ii);
hhh=subplot(2,3,ii);
xMat = reshape(xRecon, Nx, Ny)'; % take transpose because reshape performs operation columnwise
imagesc(xMat); % origin in the top left corner by default of imagesc function
hold on

%plot(iInj, jInj , 'ok', 'MarkerFaceColor', [0 1 0], 'MarkerSize', 8);
% plot(iInj, jInj, '^k', 'MarkerFaceColor', [0.99 0.99 0.99], 'MarkerSize', 8); % used to differentiate injection and production wells
% %  Write injection well names
% for index=1:length(iInj)
%     text(iInj(index)-1, jInj(index)-2, ['I' num2str(index)], 'FontName', 'Times New Roman', 'color', 'k', 'FontSize', 12, 'FontWeight', 'b');
% end

plot(iProd, jProd, 'ok', 'MarkerFaceColor',[1 1 1], 'MarkerSize',8);

hold on
title([' Layer(' num2str(ii) ')'],'FontName','Helvetica', 'Fontsize', 13)
colormap('jet')
colorbar;
caxis([2.3, 6.9]); 
h = colorbar;
ylabel(h, 'Log K(mD)','FontName','Helvetica', 'Fontsize', 13);
set(h, 'ylim', [2.3 6.9])
set(gca, 'ydir', 'normal'); % put origin in the bottom left corner (normal location) 
axis equal tight
xlabel('', 'FontName', 'Times New Roman', 'FontSize', 18, 'FontWeight','n')
ylabel('', 'FontName', 'Times New Roman', 'FontSize', 18, 'FontWeight','n')
set(gca, 'FontName', 'Times New Roman', 'FontSize', 18, 'FontWeight','n')
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
%  direction = [1 0];
%  rotate(hhh,direction,180)

end
%saveas(gcf,'location_Best','fig')
%
end