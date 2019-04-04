clc
clear 
close all
disp( 'initial analysis of the NORNE field')
disp( 'Author: Clement Etienam-PhD Petroleum Engineering' )

load clement.out

kxy2b=clement;
%actnum=zeros(
kxy2b(kxy2b==-99)=NaN;
m=46; n=112; nz=22;

Xcor(1:m,1:n,1:nz)=NaN;
Ycor(1:m,1:n,1:nz)=NaN;
Ycor(1:m,1:n,1:nz)=NaN;
permj(1:m,1:n,1:nz)=NaN;

for j=1:size(kxy2b,1)

  index=kxy2b(j,1);
  indey=kxy2b(j,2);
  indez=kxy2b(j,3);
Xcor(index,indey,indez)=kxy2b(j,4);
Ycor(index,indey,indez)=kxy2b(j,5);
Zcor(index,indey,indez)=kxy2b(j,6);
permj(index,indey,indez)=kxy2b(j,7);
end

yobo=figure();
title(' 3D NORNE FIELD')
for j=1:nz

    Xcor2D=Xcor(:,:,j);
    Ycor2D=Ycor(:,:,j);
    Zcor2D=Zcor(:,:,j);
    permj2D=(permj(:,:,j));
    
%figure
 %axes('Parent',figure,'FontSize',8)
% pcolor(Xcor2D, Ycor2D,permj2D);

surf(Xcor2D,Ycor2D,Zcor2D,(permj2D));
 shading flat;
 grid off
  colormap('jet')
%view([37.5 30]); from the side
view([0 90]);% view directly overhead
caxis([0.1 0.3])
%grid off
h = colorbar;
title(' 3D NORNE FIELD')
ylabel(h, 'porosity','FontName','Helvetica', 'Fontsize', 13);
set(h, 'ylim', [0.1 0.3])
set(gca, 'FontName','Helvetica', 'Fontsize', 13)
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
hold on


end
%hfig = tightfig(yobo);
saveas(gcf,'3DNorne','eps')
saveas(gcf,'3DNorne','fig')
close(figure)

%figure()
for j=1:nz

   Xcor2D=Xcor(:,:,j);
    Ycor2D=Ycor(:,:,j);
    Zcor2D=Zcor(:,:,j);
    permj2D=(permj(:,:,j));
figure()
%subplot(6,4,j);
 %axes('Parent',figure,'FontSize',8)
% pcolor(Xcor2D, Ycor2D,permj2D);
surf(Xcor2D,Ycor2D,Zcor2D,permj2D);
 %mesh(Xcor2D, Ycor2D,Zcor2D,permj2D);
 shading flat;
 grid off
  colormap('jet')
 view([0 90])
%axis([-1000 3546 -900 0 -1300 -1200])

%colorbar
caxis([0.1 0.3])
%grid off
h = colorbar;
ylabel(h, 'porosity','FontName','Helvetica', 'Fontsize', 13);
set(h, 'ylim', [0.1 0.3])
set(gca, 'FontName','Helvetica', 'Fontsize', 13)
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
istring=int2str(j);
title(['layer ',istring]);
% title 'Delta A (seismic domain)'
% title('f1 fig1')
saveas(gcf,sprintf('Norne_Layerprime%d.fig',j))

end
%%
disp(' extract the active grid cells' )
sgsim=clement(:,7);
perm=sgsim;

actnum=perm;
actnum(isnan(actnum))=0;
for i=1:113344
if actnum(i)>0;
    actnum(i)=1;
end
end
disp('write this file to ASCII')
file = fopen('actnum.out','w+'); %output the dictionary
for k=1:numel(actnum)                                                                       
fprintf(file,' %d \n',actnum(k) );             
end


True=perm;
perm(perm==-99)=NaN;
G2=cartGrid([46 112 22]);
for i=1:22
yobo=figure();
plotSlice(G2,(perm),i,3)
%view(3)
%title(['Layer(' num2str(i) ')'],'FontName','Helvetica', 'Fontsize', 13)
%title('Layer 1','FontName','Helvetica', 'Fontsize', 13)
 title(['Layer(' num2str(i) ')'],'FontName','Helvetica', 'Fontsize', 13)
grid off
shading flat
 caxis([0.1 0.35])
 colormap('jet')
 h = colorbar;
ylabel(h, 'porosity','FontName','Helvetica', 'Fontsize', 13);
set(h, 'ylim', [0.1 0.3])
set(gcf,'color','white')
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
set(gca,'zticklabel',[])
hfig = tightfig(yobo);
saveas(gcf,sprintf('Norne_Layer%d.fig',i))
close(figure)
end


for i=1:22
yobo=figure();
plotSlice(G2,(actnum),i,3)
%view(3)
%title(['Layer(' num2str(i) ')'],'FontName','Helvetica', 'Fontsize', 13)
%title('Layer 1','FontName','Helvetica', 'Fontsize', 13)
 title(['Layer(' num2str(i) ')'],'FontName','Helvetica', 'Fontsize', 13)
grid off
shading flat
 caxis([0 1])
 colormap('jet')
 h = colorbar;
ylabel(h, 'porosity','FontName','Helvetica', 'Fontsize', 13);
set(h, 'ylim', [0 1])
set(gcf,'color','white')
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
set(gca,'zticklabel',[])
hfig = tightfig(yobo);
saveas(gcf,sprintf('Norneactive_Layer%d.fig',i))
close(figure)
end

figure()
hist(perm);
set(gca, 'FontName','Helvetica', 'Fontsize', 13)
set(gcf,'color','white')
xlabel('Porosity distribution','FontName','Helvetica', 'Fontsize', 13);
ylabel('Frequency','FontName','Helvetica', 'Fontsize', 13);
saveas(gcf,sprintf('Porositydistribution.fig'))
close(figure)
