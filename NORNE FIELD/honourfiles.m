
clc
clear 
close all
disp( 'initial analysis of the NORNE field')
disp( 'Author: Clement Etienam-PhD Petroleum Engineering' )

load clementgrid.out
load rossmary.GRDECL;
perm=reshape(rossmary',46,112,22);
perm=reshape(perm,113344,1);

activegrid=perm;
activegrid(activegrid>0)=1;
load rossmaryporo.GRDECL;
porosity=reshape(rossmaryporo',46,112,22);
porosity=reshape(porosity,113344,1);
% load active.out;
% actv=importdata('active.out');
% active=reshape(active',46,112,22);
% active=reshape(active,113344,1);
kxy2b=clementgrid;
kxy2b(:,7)=porosity;
kxy2c=clementgrid;
kxy2c(:,7)=perm;
kxy2d=clementgrid;
kxy2d(:,7)=activegrid;


kxy2b(kxy2b==-99)=NaN;
m=46; n=112; nz=22;

Xcor(1:m,1:n,1:nz)=NaN;
Ycor(1:m,1:n,1:nz)=NaN;
Ycor(1:m,1:n,1:nz)=NaN;
poroj(1:m,1:n,1:nz)=NaN;
activej(1:m,1:n,1:nz)=NaN;
permj(1:m,1:n,1:nz)=NaN;
gasparij(1:m,1:n,1:nz)=NaN;

for j=1:size(kxy2b,1)

  index=kxy2b(j,1);
  indey=kxy2b(j,2);
  indez=kxy2b(j,3);
Xcor(index,indey,indez)=kxy2b(j,4);
Ycor(index,indey,indez)=kxy2b(j,5);
Zcor(index,indey,indez)=kxy2b(j,6);
poroj(index,indey,indez)=kxy2b(j,7);
end

for j=1:size(kxy2b,1)

  index=kxy2b(j,1);
  indey=kxy2b(j,2);
  indez=kxy2b(j,3);
Xcor(index,indey,indez)=kxy2b(j,4);
Ycor(index,indey,indez)=kxy2b(j,5);
Zcor(index,indey,indez)=kxy2b(j,6);
activej(index,indey,indez)=kxy2d(j,7);
end

for j=1:size(kxy2b,1)

  index=kxy2b(j,1);
  indey=kxy2b(j,2);
  indez=kxy2b(j,3);
Xcor(index,indey,indez)=kxy2b(j,4);
Ycor(index,indey,indez)=kxy2b(j,5);
Zcor(index,indey,indez)=kxy2b(j,6);
permj(index,indey,indez)=kxy2c(j,7);
end


poroj(poroj==0)=NaN;

yobo=figure();
subplot(2,2,1)
title(' 3D Porosity NORNE FIELD')
for j=1:nz

    Xcor2D=Xcor(:,:,j);
    Ycor2D=Ycor(:,:,j);
    Zcor2D=Zcor(:,:,j);
    poroj2D=(poroj(:,:,j));
    
%figure
 %axes('Parent',figure,'FontSize',8)
% pcolor(Xcor2D, Ycor2D,permj2D);

h1=surf(Xcor2D,Ycor2D,Zcor2D,(poroj2D));

 shading flat;
 grid off
  colormap('jet')
%view([37.5 30]); from the side
view([90 -90]);% view directly overhead
caxis([0.1 0.35])
%grid off
h = colorbar;
title(' 3D Porosity NORNE FIELD')
ylabel(h, 'porosity','FontName','Helvetica', 'Fontsize', 13);
set(h, 'ylim', [0.1 0.35])
set(gca, 'FontName','Helvetica', 'Fontsize', 13)
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
hold on


end
%rotate(yobo,[1,0,0],45)

permj=log10(permj);
permj(permj==-Inf)=NaN;
subplot(2,2,2)
title(' 3D permeability NORNE FIELD')
for j=1:nz

    Xcor2D=Xcor(:,:,j);
    Ycor2D=Ycor(:,:,j);
    Zcor2D=Zcor(:,:,j);
    permj2D=(permj(:,:,j));
    
%figure
 %axes('Parent',figure,'FontSize',8)
% pcolor(Xcor2D, Ycor2D,permj2D);

surf(Xcor2D,Ycor2D,Zcor2D,((permj2D)));
 shading flat;
 grid off
  colormap('jet')
%view([37.5 30]); from the side
view([90 -90]);% view directly overhead
caxis([1.5 3])
%grid off
h = colorbar;
title(' 3D Permeability NORNE FIELD')
ylabel(h, 'Log K(mD)','FontName','Helvetica', 'Fontsize', 13);
set(h, 'ylim', [1.5 3])
set(gca, 'FontName','Helvetica', 'Fontsize', 13)
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
hold on


end

subplot(2,2,3)
title(' 3D active cells NORNE FIELD')
for j=1:nz

    Xcor2D=Xcor(:,:,j);
    Ycor2D=Ycor(:,:,j);
    Zcor2D=Zcor(:,:,j);
    activej2D=(activej(:,:,j));
    
%figure
 %axes('Parent',figure,'FontSize',8)
% pcolor(Xcor2D, Ycor2D,permj2D);

surf(Xcor2D,Ycor2D,Zcor2D,((activej2D)));
 shading flat;
 grid off
  colormap('jet')
%view([37.5 30]); from the side
view([90 -90]);% view directly overhead
caxis([0 1])
%grid off
h = colorbar;
title(' 3D active cells NORNE FIELD')
ylabel(h, 'Active/Non-active cells','FontName','Helvetica', 'Fontsize', 13);
set(h, 'ylim', [0 1])
set(gca, 'FontName','Helvetica', 'Fontsize', 13)
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
hold on


end
%hfig = tightfig(yobo);



%%

c=5;
disp('write this file to ASCII')
file = fopen('effective.out','w+'); %output the dictionary
for k=1:numel(activegrid)                                                                       
fprintf(file,' %d \n',activegrid(k) );             
end

%%
A=zeros(46,112,22);
for j=1:22
    A(10,32,j)=1;
    A(14,28,j)=1;
    A(19,38,j)=1;
    A(26,44,j)=1;
    A(12,72,j)=1;
    A(23,15,j)=1;
    A(14,34,j)=1;
    A(9,13,j)=1;
    A(12,85,j)=1;
    A(9,37,j)=1;
    A(18,68,j)=1;
    A(18,83,j)=1;
    A(13,67,j)=1;
    A(38,98,j)=1;
    A(19,54,j)=1;
    A(6,57,j)=1;
    A(7,64,j)=1;
    A(36,68,j)=1;
    A(16,66,j)=1;
    A(25,37,j)=1;
    A(10,29,j)=1;
    A(15,74,j)=1;
    A(13,67,j)=1;
    A(19,54,j)=1;
    A(10,24,j)=1;
    A(11,38,j)=1;
    A(11,35,j)=1;
    A(15,21,j)=1;
    A(22,22,j)=1;
    
end
disp( 'calculate the euclidean distance function to the 6 producer wells')
    lf=reshape(A,46,112,22);
   for j=1:22;
     sdf=lf(:,:,j);
  [usdf,IDX] = bwdist(sdf);
  usdf=reshape(usdf,5152,1);
  young(:,j)=usdf;
   
   end
   sdfbig=reshape(young,113344,1);
   sdfbig1=abs(sdfbig);
   z=sdfbig1;

   c0OIL1=zeros(113344,1);
   disp( 'compute the gaspari-cohn coefficent')
  for i=1:113344;
 if (0<=z(i,:) || z(i,:)<=c)
  c0OIL1(i,:)=-0.25*(z(i,:)/c)^5+0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3-(5.0/3.0)*(z(i,:)/c)^2+1;
elseif z < 2*c
  c0OIL1(i,:)=(1.0/12.0)*(z(i,:)/c)^5-0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3+(5.0/3.0)*(z(i,:)/c)^2-5*(z(i,:)/c)+4-(2.0/3.0)*(c/z(i,:));
 elseif (c<=z(i,:) || z(i,:)<=2*c)
     c0OIL1(i,:)=-5*(z(i,:)/c)+4-0.667*(c/z(i,:));
 else
     c0OIL1(i,:)=0;
 end
  
  end
  
c0OIL1(c0OIL1<0)=0;
  %[c0OIL1] = calc_loccoeffs(c, 'Gaspari_Cohn', z); 

 disp(' get the gaspari cohn for Cyd') 
 kxy2e=clementgrid;
kxy2e(:,7)=c0OIL1; 
    schur=c0OIL1;
 for j=1:size(kxy2e,1)

  index=kxy2b(j,1);
  indey=kxy2b(j,2);
  indez=kxy2b(j,3);
Xcor(index,indey,indez)=kxy2b(j,4);
Ycor(index,indey,indez)=kxy2b(j,5);
Zcor(index,indey,indez)=kxy2b(j,6);
gasparij(index,indey,indez)=kxy2e(j,7);
end 
   
    subplot(2,2,4)

for j=1:nz

    Xcor2D=Xcor(:,:,j);
    Ycor2D=Ycor(:,:,j);
    Zcor2D=Zcor(:,:,j);
    activejgaspari=(gasparij(:,:,j));
    
surf(Xcor2D,Ycor2D,Zcor2D,((activejgaspari)));
 shading flat;
 grid off
  colormap('jet')
%view([37.5 30]); from the side
view([90 -90]);% view directly overhead
caxis([0 1])
%grid off
h = colorbar;
title(' 3D 5th-order localization coefficient field NORNE FIELD')
ylabel(h, 'correlation coefficient','FontName','Helvetica', 'Fontsize', 13);
set(h, 'ylim', [0 1])
set(gca, 'FontName','Helvetica', 'Fontsize', 13)
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
hold on


end
%hfig = tightfig(yobo);

saveas(gcf,'3DNorne','fig')
close(figure)
%%


% dd=log10(perm);
dd=perm;
dd(dd==0)=NaN;
figure()
G2=cartGrid([46 112 22]);
subplot(2,2,1);
plotCellData(G2,reshape(dd,113344,1));
view(3)
axis equal on
title('True','FontName','Helvetica', 'Fontsize', 13);
grid off
shading flat
caxis([50 3000])
colormap('jet')
% % h = colorbar;
% % ylabel(h, 'Log K(mD)','FontName','Helvetica', 'Fontsize', 13);
% % set(h, 'ylim', [1 5])
% hold on
% plot3([10 10],[22 22],[1 -8],'r','Linewidth',2);
% text(  10,22,-10,'P1','HorizontalAlignment','left','FontSize',11)
% hold on
% plot3([9 9],[17 17],[1 -8],'r','Linewidth',2);
% text(  9,17, -9,'P4','Fontsize', 11)
% hold on
% plot3([17 17],[11 11],[1 -8],'r','Linewidth',2);
% text(  17,11, -10,'P5','Fontsize', 11)
% hold on
% plot3([11 11],[24 24],[1 -12],'r','Linewidth',2);
% text(11 ,24, -14,'P11','Fontsize', 11)
% hold on
% plot3([15 15],[12 12],[1 -8],'r','Linewidth',2)
% text(  15,12, -14,'P12','Fontsize', 11)
% hold on
% plot3([17 17],[22 22],[1 -8],'r','Linewidth',2)
% text(  17,22, -12,'P4','Fontsize', 11)

set(gcf,'color','white')
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
set(gca,'zticklabel',[])


