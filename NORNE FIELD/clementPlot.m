%%This code is to plot all the ensemble permeability field data at once

function [bestnorm3,PlogK]=clementPlot(nx,ny,nz, clementgrid,mumyperm,rossmary,N,bestprod,effective,inelly);
disp(' Author: Clement Etienam-PhD Visiting researcher,University of Manchester,July,2018')
disp('Supervisor: Dr Romman Chassagne')
disp('Supervisor: Dr Hammed Amini')
disp('Supervisor: Profesor Colin Macbeth')
% N - size of ensemble

disp(' extract the active grid cells' )
sgsim=reshape(mumyperm,113344,N);

perm=sgsim;

   disp(' get the dissimilarity for permeability reconstruction')

True=log10(rossmary);
True=True.*effective;
%True(True==0)=NaN;
True(isnan(True))=0;

Ause=perm;
A1=log10(Ause);
A1(A1==-Inf)=0;
A1(isnan(A1))=0;

B = repmat(effective,1,N);
A1=A1.*B;

for i=1:N
    J(:,i)=sqrt(((A1(:,i)-True).^2)./44431);
end
for i=1:N
test(i,:)=sum(abs((J(:,i))));
end
reali=[1:N]';

jj3=min(test);
index3 = test; 
bestnorm3 = find(index3 == min(index3));
fprintf('The best Norm Realization for Log(K) reconstruction  is number %i with value %4.4f \n',bestnorm3,jj3);

 PlogK = reshape(A1(:,3),46,112,22);
 PlogK(PlogK==0)=NaN;

Trueperm=reshape(True,46,112,22);
Trueperm(Trueperm==0)=NaN;

disp(' plot the mean of the ensemble')
A1=reshape(A1,113344,N);
A12mean=mean(A1,2);
A12mean=reshape(A12mean,nx,ny,nz);
A12mean(A12mean==0)=NaN;

A1match=reshape(A1(:,bestnorm3),46,112,22);
A1match(A1match==0)=NaN;

A1prod=reshape(A1(:,bestprod),46,112,22);
A1prod(A1prod==0)=NaN;


kxy2b=clementgrid;
kxy2b(:,7)=reshape(Trueperm,113344,1);
kxy2c=clementgrid;
kxy2c(:,7)=reshape(A12mean,113344,1);
kxy2d=clementgrid;
kxy2d(:,7)=reshape(A1match,113344,1);
kxy2e=clementgrid;
kxy2e(:,7)=reshape(A1prod,113344,1);

m=nx; n=ny; nz=nz;

Xcor(1:m,1:n,1:nz)=NaN;
Ycor(1:m,1:n,1:nz)=NaN;
Ycor(1:m,1:n,1:nz)=NaN;
poroj(1:m,1:n,1:nz)=NaN;
activej(1:m,1:n,1:nz)=NaN;
permj(1:m,1:n,1:nz)=NaN;
permjj(1:m,1:n,1:nz)=NaN;

for j=1:size(kxy2b,1)

  index=kxy2b(j,1);
  indey=kxy2b(j,2);
  indez=kxy2b(j,3);
Xcor(index,indey,indez)=kxy2b(j,4);
Ycor(index,indey,indez)=kxy2b(j,5);
Zcor(index,indey,indez)=kxy2b(j,6);
poroj(index,indey,indez)=kxy2b(j,7); %True
end

for j=1:size(kxy2b,1)

  index=kxy2b(j,1);
  indey=kxy2b(j,2);
  indez=kxy2b(j,3);
Xcor(index,indey,indez)=kxy2b(j,4);
Ycor(index,indey,indez)=kxy2b(j,5);
Zcor(index,indey,indez)=kxy2b(j,6);
activej(index,indey,indez)=kxy2c(j,7); %Mean
end

for j=1:size(kxy2b,1)

  index=kxy2b(j,1);
  indey=kxy2b(j,2);
  indez=kxy2b(j,3);
Xcor(index,indey,indez)=kxy2b(j,4);
Ycor(index,indey,indez)=kxy2b(j,5);
Zcor(index,indey,indez)=kxy2b(j,6);
permj(index,indey,indez)=kxy2d(j,7); %log-Match
end

for j=1:size(kxy2b,1)

  index=kxy2b(j,1);
  indey=kxy2b(j,2);
  indez=kxy2b(j,3);
Xcor(index,indey,indez)=kxy2b(j,4);
Ycor(index,indey,indez)=kxy2b(j,5);
Zcor(index,indey,indez)=kxy2b(j,6);
permjj(index,indey,indez)=kxy2e(j,7); %production-Match
end

yobo=figure();
subplot(2,2,1)
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
caxis([1.5 3])
%grid off
h = colorbar;
title(' 3D Permeability GIVEN NORNE FIELD')
ylabel(h, 'Log K(mD)','FontName','Helvetica', 'Fontsize', 13);
set(h, 'ylim', [1.5 3])
set(gca, 'FontName','Helvetica', 'Fontsize', 13)
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
hold on


end
%rotate(yobo,[1,0,0],45)

subplot(2,2,2)

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
title(' 3D Best Log-K match')
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
caxis([1.5 3])
%grid off
h = colorbar;
title(' 3D Permeability mean permeability')
ylabel(h, 'Log K(mD)','FontName','Helvetica', 'Fontsize', 13);
set(h, 'ylim', [1.5 3])
set(gca, 'FontName','Helvetica', 'Fontsize', 13)
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
hold on


end

subplot(2,2,4)
title(' 3D active cells NORNE FIELD')
for j=1:nz

    Xcor2D=Xcor(:,:,j);
    Ycor2D=Ycor(:,:,j);
    Zcor2D=Zcor(:,:,j);
    activejj2D=(permjj(:,:,j));
    
%figure
 %axes('Parent',figure,'FontSize',8)
% pcolor(Xcor2D, Ycor2D,permj2D);

surf(Xcor2D,Ycor2D,Zcor2D,((activejj2D)));
 shading flat;
 grid off
  colormap('jet')
%view([37.5 30]); from the side
view([90 -90]);% view directly overhead
caxis([1.5 3])
%grid off
h = colorbar;
title(' 3D best Production match')
ylabel(h, 'Log K(mD)','FontName','Helvetica', 'Fontsize', 13);
set(h, 'ylim', [1.5 3])
set(gca, 'FontName','Helvetica', 'Fontsize', 13)
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
hold on


end

saveas(gcf,sprintf('permeabilityevolution_iter%d.fig',inelly))
close(figure)

end
%run('testvar.m')