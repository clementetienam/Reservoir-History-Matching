clc;
clear all;
close all;
c=77;
%Get the localization for oil1 Well P1
A=zeros(120,60,5);
for j=1:5
    A(14,25,j)=1;
end

disp( 'calculate the euclidean distance function to the 6 producer wells')
    lf=reshape(A,120,60,5);
   for j=1:5;
     sdf=lf(:,:,j);
  [usdf,IDX] = bwdist(sdf);
  usdf=reshape(usdf,7200,1);
  young(:,j)=usdf;
   
   end
   sdfbig=reshape(young,36000,1);
   sdfbig1=abs(sdfbig);
   z=sdfbig1;
   % the value of the range should be computed accurately.
   %c=range(z);
  
  
   c0OIL1=zeros(36000,1);
   disp( 'compute the gaspari-cohn coefficent')
  for i=1:36000;
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
  c0OIL1=reshape(c0OIL1,120,60,5);

   [X,Y] = meshgrid(1:120,1:60);
 figure()
redd=slice(c0OIL1,[1 60],[1 120],[1 5]);
axis equal on
%axis([1 27 1 84 1 4 ])
% xlim([1 84])
% ylim([1 27])
% zlim([0 4])
shading flat
grid off
title('Best Log','FontName','Helvetica', 'Fontsize', 16);
xlabel('X','FontName','Helvetica', 'Fontsize', 16)
ylabel('Y','FontName','Helvetica', 'Fontsize', 16)
zlabel('Z','FontName','Helvetica', 'Fontsize', 16)
colorbar;
set(gca, 'FontName','Helvetica', 'Fontsize', 16)
set(gcf,'color','white')
hold on



hold on
direction = [0 1 0];
rotate(redd,direction,180)
plot3([25 25],[14 14],[1 50],'r','Linewidth',2);
% text(x1(i,1),y1(i,1),z1(i,1),['   ' ...
% num2str(time(i,1))],'HorizontalAlignment','left','FontSize',8);
text( 25, 14,52,'OIL 1','HorizontalAlignment','left','FontSize',11)
set(gcf,'color','white')
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
set(gca,'zticklabel',[])
saveas(gcf,'figure1','eps')
saveas(gcf,'figure1','jpg')
close(figure)








  
%Get the localization for oil2 Well P2
A=zeros(120,60,5);
for j=1:5
    A(38,39,j)=1;
end

disp( 'calculate the euclidean distance function to the 6 producer wells')
    lf=reshape(A,120,60,5);
   for j=1:5;
     sdf=lf(:,:,j);
  [usdf,IDX] = bwdist(sdf);
  usdf=reshape(usdf,7200,1);
  young(:,j)=usdf;
   
   end
   sdfbig=reshape(young,36000,1);
   sdfbig1=abs(sdfbig);
   z=sdfbig1;
   % the value of the range should be computed accurately.
   %c=range(z);
  
  
   c0OIL2=zeros(36000,1);
   disp( 'compute the gaspari-cohn coefficent')
  for i=1:36000;
 if (0<=z(i,:) || z(i,:)<=c)
  c0OIL2(i,:)=-0.25*(z(i,:)/c)^5+0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3-(5.0/3.0)*(z(i,:)/c)^2+1;
elseif z < 2*c
  c0OIL2(i,:)=(1.0/12.0)*(z(i,:)/c)^5-0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3+(5.0/3.0)*(z(i,:)/c)^2-5*(z(i,:)/c)+4-(2.0/3.0)*(c/z(i,:));
 elseif (c<=z(i,:) || z(i,:)<=2*c)
     c0OIL2(i,:)=-5*(z(i,:)/c)+4-0.667*(c/z(i,:));
 else
     c0OIL2(i,:)=0;
 end
  
  end
 c0OIL2=reshape(c0OIL2,120,60,5);
  figure()
redd=slice(c0OIL2,[1 60],[1 120],[1 5]);
axis equal on
%axis([1 27 1 84 1 4 ])
% xlim([1 84])
% ylim([1 27])
% zlim([0 4])
shading flat
grid off
title('Best Log','FontName','Helvetica', 'Fontsize', 16);
xlabel('X','FontName','Helvetica', 'Fontsize', 16)
ylabel('Y','FontName','Helvetica', 'Fontsize', 16)
zlabel('Z','FontName','Helvetica', 'Fontsize', 16)
colorbar;
set(gca, 'FontName','Helvetica', 'Fontsize', 16)
set(gcf,'color','white')
hold on



direction = [0 1 0];
rotate(redd,direction,180)
plot3([39 39],[38 38],[1 50],'r','Linewidth',2);
text( 39, 38, 52,'OIL 2','Fontsize', 11)
hold on
set(gcf,'color','white')
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
set(gca,'zticklabel',[])
saveas(gcf,'figure2','eps')
saveas(gcf,'figure2','jpg')
close(figure)
  
  
  
 %Get the localization for oil3 Well P3
A=zeros(120,60,5);
for j=1:5
    A(96,23,j)=1;
end

disp( 'calculate the euclidean distance function to the 6 producer wells')
    lf=reshape(A,120,60,5);
   for j=1:5;
     sdf=lf(:,:,j);
  [usdf,IDX] = bwdist(sdf);
  usdf=reshape(usdf,7200,1);
  young(:,j)=usdf;
   
   end
   sdfbig=reshape(young,36000,1);
   sdfbig1=abs(sdfbig);
   z=sdfbig1;
   % the value of the range should be computed accurately.
   %c=range(z);
  
  
   c0OIL3=zeros(36000,1);
   disp( 'compute the gaspari-cohn coefficent')
  for i=1:36000;
 if (0<=z(i,:) || z(i,:)<=c)
  c0OIL3(i,:)=-0.25*(z(i,:)/c)^5+0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3-(5.0/3.0)*(z(i,:)/c)^2+1;
elseif z < 2*c
  c0OIL3(i,:)=(1.0/12.0)*(z(i,:)/c)^5-0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3+(5.0/3.0)*(z(i,:)/c)^2-5*(z(i,:)/c)+4-(2.0/3.0)*(c/z(i,:));
 elseif (c<=z(i,:) || z(i,:)<=2*c)
     c0OIL3(i,:)=-5*(z(i,:)/c)+4-0.667*(c/z(i,:));
 else
     c0OIL3(i,:)=0;
 end
  
  end
  
c0OIL3=reshape(c0OIL3,120,60,5);
  figure()
redd=slice(c0OIL3,[1 60],[1 120],[1 5]);
axis equal on
%axis([1 27 1 84 1 4 ])
% xlim([1 84])
% ylim([1 27])
% zlim([0 4])
shading flat
grid off
title('Best Log','FontName','Helvetica', 'Fontsize', 16);
xlabel('X','FontName','Helvetica', 'Fontsize', 16)
ylabel('Y','FontName','Helvetica', 'Fontsize', 16)
zlabel('Z','FontName','Helvetica', 'Fontsize', 16)
colorbar;
set(gca, 'FontName','Helvetica', 'Fontsize', 16)
set(gcf,'color','white')
hold on



direction = [0 1 0];
rotate(redd,direction,180)
plot3([23 23],[96 96],[1 30],'r','Linewidth',2);
text(23 ,96 , 35,'OIL 3','Fontsize', 11)
hold on
set(gcf,'color','white')
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
set(gca,'zticklabel',[])
saveas(gcf,'figure3','eps')
saveas(gcf,'figure3','jpg')
close(figure)
  
  
  
  
  
  
  
%Get the localization for oil4 Well P4
A=zeros(120,60,5);
for j=1:5
    A(67,41,j)=1;
end

disp( 'calculate the euclidean distance function to the 6 producer wells')
    lf=reshape(A,120,60,5);
   for j=1:5;
     sdf=lf(:,:,j);
  [usdf,IDX] = bwdist(sdf);
  usdf=reshape(usdf,7200,1);
  young(:,j)=usdf;
   
   end
   sdfbig=reshape(young,36000,1);
   sdfbig1=abs(sdfbig);
   z=sdfbig1;
   % the value of the range should be computed accurately.
   %c=range(z);
  
  
   c0OIL4=zeros(36000,1);
   disp( 'compute the gaspari-cohn coefficent')
  for i=1:36000;
 if (0<=z(i,:) || z(i,:)<=c)
  c0OIL4(i,:)=-0.25*(z(i,:)/c)^5+0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3-(5.0/3.0)*(z(i,:)/c)^2+1;
elseif z < 2*c
  c0OIL4(i,:)=(1.0/12.0)*(z(i,:)/c)^5-0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3+(5.0/3.0)*(z(i,:)/c)^2-5*(z(i,:)/c)+4-(2.0/3.0)*(c/z(i,:));
 elseif (c<=z(i,:) || z(i,:)<=2*c)
     c0OIL4(i,:)=-5*(z(i,:)/c)+4-0.667*(c/z(i,:));
 else
     c0OIL4(i,:)=0;
 end
  
  end  
c0OIL4=reshape(c0OIL4,120,60,5);
  figure()
redd=slice(c0OIL4,[1 60],[1 120],[1 5]);
axis equal on
%axis([1 27 1 84 1 4 ])
% xlim([1 84])
% ylim([1 27])
% zlim([0 4])
shading flat
grid off
title('cov','FontName','Helvetica', 'Fontsize', 16);
xlabel('X','FontName','Helvetica', 'Fontsize', 16)
ylabel('Y','FontName','Helvetica', 'Fontsize', 16)
zlabel('Z','FontName','Helvetica', 'Fontsize', 16)
colorbar;
set(gca, 'FontName','Helvetica', 'Fontsize', 16)
set(gcf,'color','white')
hold on



direction = [0 1 0];
rotate(redd,direction,180)
plot3([41 41],[67 67],[1 50],'r','Linewidth',2)
text( 41, 67, 45,'OIL 4','Fontsize', 11)
hold on
set(gcf,'color','white')
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
set(gca,'zticklabel',[])
saveas(gcf,'figure4','eps')
saveas(gcf,'figure4','jpg')
close(figure)
  
  
  
  %Get the localization for water 1 Well P1
A=zeros(120,60,5);
for j=1:5
    A(14,25,j)=1;
end

disp( 'calculate the euclidean distance function to the 6 producer wells')
    lf=reshape(A,120,60,5);
   for j=1:5;
     sdf=lf(:,:,j);
  [usdf,IDX] = bwdist(sdf);
  usdf=reshape(usdf,7200,1);
  young(:,j)=usdf;
   
   end
   sdfbig=reshape(young,36000,1);
   sdfbig1=abs(sdfbig);
   z=sdfbig1;
   % the value of the range should be computed accurately.
   %c=range(z);
  
  
   c0WATER1=zeros(36000,1);
   disp( 'compute the gaspari-cohn coefficent')
  for i=1:36000;
 if (0<=z(i,:) || z(i,:)<=c)
  c0WATER1(i,:)=-0.25*(z(i,:)/c)^5+0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3-(5.0/3.0)*(z(i,:)/c)^2+1;
elseif z < 2*c
  c0WATER1(i,:)=(1.0/12.0)*(z(i,:)/c)^5-0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3+(5.0/3.0)*(z(i,:)/c)^2-5*(z(i,:)/c)+4-(2.0/3.0)*(c/z(i,:));
 elseif (c<=z(i,:) || z(i,:)<=2*c)
     c0WATER1(i,:)=-5*(z(i,:)/c)+4-0.667*(c/z(i,:));
 else
     c0WATER1(i,:)=0;
 end
  
  end
  
  

  %Get the localization for water 2 Well P2
A=zeros(120,60,5);
for j=1:5
    A(38,39,j)=1;
end

disp( 'calculate the euclidean distance function to the 6 producer wells')
    lf=reshape(A,120,60,5);
   for j=1:5;
     sdf=lf(:,:,j);
  [usdf,IDX] = bwdist(sdf);
  usdf=reshape(usdf,7200,1);
  young(:,j)=usdf;
   
   end
   sdfbig=reshape(young,36000,1);
   sdfbig1=abs(sdfbig);
   z=sdfbig1;
   % the value of the range should be computed accurately.
   %c=range(z);
  
  
   c0WATER2=zeros(36000,1);
   disp( 'compute the gaspari-cohn coefficent')
  for i=1:36000;
 if (0<=z(i,:) || z(i,:)<=c)
  c0WATER2(i,:)=-0.25*(z(i,:)/c)^5+0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3-(5.0/3.0)*(z(i,:)/c)^2+1;
elseif z < 2*c
  c0WATER2(i,:)=(1.0/12.0)*(z(i,:)/c)^5-0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3+(5.0/3.0)*(z(i,:)/c)^2-5*(z(i,:)/c)+4-(2.0/3.0)*(c/z(i,:));
 elseif (c<=z(i,:) || z(i,:)<=2*c)
     c0WATER2(i,:)=-5*(z(i,:)/c)+4-0.667*(c/z(i,:));
 else
     c0WATER2(i,:)=0;
 end
  
  end
  
  
  %Get the localization for water 3 Well P3
A=zeros(120,60,5);
for j=1:5
    A(96,23,j)=1;
end

disp( 'calculate the euclidean distance function to the 6 producer wells')
   lf=reshape(A,120,60,5);
   for j=1:5;
     sdf=lf(:,:,j);
  [usdf,IDX] = bwdist(sdf);
  usdf=reshape(usdf,7200,1);
  young(:,j)=usdf;
   
   end
   sdfbig=reshape(young,36000,1);
   sdfbig1=abs(sdfbig);
   z=sdfbig1;
   % the value of the range should be computed accurately.
   %c=range(z);
  
  
   c0WATER3=zeros(36000,1);
   disp( 'compute the gaspari-cohn coefficent')
  for i=1:36000;
 if (0<=z(i,:) || z(i,:)<=c)
  c0WATER3(i,:)=-0.25*(z(i,:)/c)^5+0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3-(5.0/3.0)*(z(i,:)/c)^2+1;
elseif z < 2*c
  c0WATER3(i,:)=(1.0/12.0)*(z(i,:)/c)^5-0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3+(5.0/3.0)*(z(i,:)/c)^2-5*(z(i,:)/c)+4-(2.0/3.0)*(c/z(i,:));
 elseif (c<=z(i,:) || z(i,:)<=2*c)
     c0WATER3(i,:)=-5*(z(i,:)/c)+4-0.667*(c/z(i,:));
 else
     c0WATER3(i,:)=0;
 end
  
  end
  
  
 %Get the localization for water 4 Well P4
A=zeros(120,60,5);
for j=1:5
    A(67,41,j)=1;
end

disp( 'calculate the euclidean distance function to the 6 producer wells')
    lf=reshape(A,120,60,5);
   for j=1:5;
     sdf=lf(:,:,j);
  [usdf,IDX] = bwdist(sdf);
  usdf=reshape(usdf,7200,1);
  young(:,j)=usdf;
   
   end
   sdfbig=reshape(young,36000,1);
   sdfbig1=abs(sdfbig);
   z=sdfbig1;
   % the value of the range should be computed accurately.
   %c=range(z);
  
  
   c0WATER4=zeros(36000,1);
   disp( 'compute the gaspari-cohn coefficent')
  for i=1:36000;
 if (0<=z(i,:) || z(i,:)<=c)
  c0WATER4(i,:)=-0.25*(z(i,:)/c)^5+0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3-(5.0/3.0)*(z(i,:)/c)^2+1;
elseif z < 2*c
  c0WATER4(i,:)=(1.0/12.0)*(z(i,:)/c)^5-0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3+(5.0/3.0)*(z(i,:)/c)^2-5*(z(i,:)/c)+4-(2.0/3.0)*(c/z(i,:));
 elseif (c<=z(i,:) || z(i,:)<=2*c)
     c0WATER4(i,:)=-5*(z(i,:)/c)+4-0.667*(c/z(i,:));
 else
     c0WATER4(i,:)=0;
 end
  
  end 
 
  
  
  
  %Get the localization for pressure 1 Well W1
A=zeros(120,60,5);
for j=1:5
    A(30,55,j)=1;
end

disp( 'calculate the euclidean distance function to the 6 producer wells')
    lf=reshape(A,120,60,5);
   for j=1:5;
     sdf=lf(:,:,j);
  [usdf,IDX] = bwdist(sdf);
  usdf=reshape(usdf,7200,1);
  young(:,j)=usdf;
   
   end
   sdfbig=reshape(young,36000,1);
   sdfbig1=abs(sdfbig);
   z=sdfbig1;
   % the value of the range should be computed accurately.
   %c=range(z);
  
  
   c0BHP1=zeros(36000,1);
   disp( 'compute the gaspari-cohn coefficent')
  for i=1:36000;
 if (0<=z(i,:) || z(i,:)<=c)
  c0BHP1(i,:)=-0.25*(z(i,:)/c)^5+0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3-(5.0/3.0)*(z(i,:)/c)^2+1;
elseif z < 2*c
  c0BHP1(i,:)=(1.0/12.0)*(z(i,:)/c)^5-0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3+(5.0/3.0)*(z(i,:)/c)^2-5*(z(i,:)/c)+4-(2.0/3.0)*(c/z(i,:));
 elseif (c<=z(i,:) || z(i,:)<=2*c)
     c0BHP1(i,:)=-5*(z(i,:)/c)+4-0.667*(c/z(i,:));
 else
     c0BHP1(i,:)=0;
 end
  
  end
c0BHP1=reshape(c0BHP1,120,60,5); 
  figure()
redd=slice(c0BHP1,[1 60],[1 120],[1 5]);
axis equal on
%axis([1 27 1 84 1 4 ])
% xlim([1 84])
% ylim([1 27])
% zlim([0 4])
shading flat
grid off
title('cov','FontName','Helvetica', 'Fontsize', 16);
xlabel('X','FontName','Helvetica', 'Fontsize', 16)
ylabel('Y','FontName','Helvetica', 'Fontsize', 16)
zlabel('Z','FontName','Helvetica', 'Fontsize', 16)
colorbar;
set(gca, 'FontName','Helvetica', 'Fontsize', 16)
set(gcf,'color','white')
hold on



direction = [0 1 0];
rotate(redd,direction,180)
plot3([55 55],[30 30],[1 50],'k','Linewidth',2);
text(55,30,55,'INJECTOR 1','Fontsize', 11)
hold on
set(gcf,'color','white')
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
set(gca,'zticklabel',[])
saveas(gcf,'figure5','eps')
saveas(gcf,'figure5','jpg')
close(figure)
  
  
  
   %Get the localization for pressure 2 Well W2
A=zeros(120,60,5);
for j=1:5
    A(58,18,j)=1;
end

disp( 'calculate the euclidean distance function to the 6 producer wells')
    lf=reshape(A,120,60,5);
   for j=1:5;
     sdf=lf(:,:,j);
  [usdf,IDX] = bwdist(sdf);
  usdf=reshape(usdf,7200,1);
  young(:,j)=usdf;
   
   end
   sdfbig=reshape(young,36000,1);
   sdfbig1=abs(sdfbig);
   z=sdfbig1;
   % the value of the range should be computed accurately.
   %c=range(z);
  
  
   c0BHP2=zeros(36000,1);
   disp( 'compute the gaspari-cohn coefficent')
  for i=1:36000;
 if (0<=z(i,:) || z(i,:)<=c)
  c0BHP2(i,:)=-0.25*(z(i,:)/c)^5+0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3-(5.0/3.0)*(z(i,:)/c)^2+1;
elseif z < 2*c
  c0BHP2(i,:)=(1.0/12.0)*(z(i,:)/c)^5-0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3+(5.0/3.0)*(z(i,:)/c)^2-5*(z(i,:)/c)+4-(2.0/3.0)*(c/z(i,:));
 elseif (c<=z(i,:) || z(i,:)<=2*c)
     c0BHP2(i,:)=-5*(z(i,:)/c)+4-0.667*(c/z(i,:));
 else
     c0BHP2(i,:)=0;
 end
  
  end
c0BHP2=reshape(c0BHP2,120,60,5); 
  figure()
redd=slice(c0BHP2,[1 60],[1 120],[1 5]);
axis equal on
%axis([1 27 1 84 1 4 ])
% xlim([1 84])
% ylim([1 27])
% zlim([0 4])
shading flat
grid off
title('cov','FontName','Helvetica', 'Fontsize', 16);
xlabel('X','FontName','Helvetica', 'Fontsize', 16)
ylabel('Y','FontName','Helvetica', 'Fontsize', 16)
zlabel('Z','FontName','Helvetica', 'Fontsize', 16)
colorbar;
set(gca, 'FontName','Helvetica', 'Fontsize', 16)
set(gcf,'color','white')
hold on



direction = [0 1 0];
rotate(redd,direction,180)
plot3([18 18],[58 58],[1 50],'k','Linewidth',2);
text(18 ,58 ,52,'INJECTOR 2','Fontsize', 11)
hold on
set(gcf,'color','white')
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
set(gca,'zticklabel',[])
saveas(gcf,'figure6','eps')
saveas(gcf,'figure6','jpg')
close(figure)

  %Get the localization for pressure 3 Well W3
A=zeros(120,60,5);
for j=1:5
    A(90,6,j)=1;
end

disp( 'calculate the euclidean distance function to the 6 producer wells')
    lf=reshape(A,120,60,5);
   for j=1:5;
     sdf=lf(:,:,j);
  [usdf,IDX] = bwdist(sdf);
  usdf=reshape(usdf,7200,1);
  young(:,j)=usdf;
   
   end
   sdfbig=reshape(young,36000,1);
   sdfbig1=abs(sdfbig);
   z=sdfbig1;
   % the value of the range should be computed accurately.
   %c=range(z);
  
  
   c0BHP3=zeros(36000,1);
   disp( 'compute the gaspari-cohn coefficent')
  for i=1:36000;
 if (0<=z(i,:) || z(i,:)<=c)
  c0BHP3(i,:)=-0.25*(z(i,:)/c)^5+0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3-(5.0/3.0)*(z(i,:)/c)^2+1;
elseif z < 2*c
  c0BHP3(i,:)=(1.0/12.0)*(z(i,:)/c)^5-0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3+(5.0/3.0)*(z(i,:)/c)^2-5*(z(i,:)/c)+4-(2.0/3.0)*(c/z(i,:));
 elseif (c<=z(i,:) || z(i,:)<=2*c)
     c0BHP3(i,:)=-5*(z(i,:)/c)+4-0.667*(c/z(i,:));
 else
     c0BHP3(i,:)=0;
 end
  
  end
c0BHP3=reshape(c0BHP3,120,60,5); 
  figure()
redd=slice(c0BHP3,[1 60],[1 120],[1 5]);
axis equal on
%axis([1 27 1 84 1 4 ])
% xlim([1 84])
% ylim([1 27])
% zlim([0 4])
shading flat
grid off
title('cov','FontName','Helvetica', 'Fontsize', 16);
xlabel('X','FontName','Helvetica', 'Fontsize', 16)
ylabel('Y','FontName','Helvetica', 'Fontsize', 16)
zlabel('Z','FontName','Helvetica', 'Fontsize', 16)
colorbar;
set(gca, 'FontName','Helvetica', 'Fontsize', 16)
set(gcf,'color','white')
hold on



direction = [0 1 0];
rotate(redd,direction,180)
plot3([6 6],[90 90],[1 50],'k','Linewidth',2);
text(6 ,90 , 51,'INJECTOR 3','Fontsize', 11)
hold on
set(gcf,'color','white')
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
set(gca,'zticklabel',[])
saveas(gcf,'figure7','eps')
saveas(gcf,'figure7','jpg')
close(figure)

    %Get the localization for pressure 4 Well W4
A=zeros(120,60,5);
for j=1:5
    A(101,39,j)=1;
end

disp( 'calculate the euclidean distance function to the 6 producer wells')
    lf=reshape(A,120,60,5);
   for j=1:5;
     sdf=lf(:,:,j);
  [usdf,IDX] = bwdist(sdf);
  usdf=reshape(usdf,7200,1);
  young(:,j)=usdf;
   
   end
   sdfbig=reshape(young,36000,1);
   sdfbig1=abs(sdfbig);
   z=sdfbig1;
   % the value of the range should be computed accurately.
   %c=range(z);
  
  
   c0BHP4=zeros(36000,1);
   disp( 'compute the gaspari-cohn coefficent')
  for i=1:36000;
 if (0<=z(i,:) || z(i,:)<=c)
  c0BHP4(i,:)=-0.25*(z(i,:)/c)^5+0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3-(5.0/3.0)*(z(i,:)/c)^2+1;
elseif z < 2*c
  c0BHP4(i,:)=(1.0/12.0)*(z(i,:)/c)^5-0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3+(5.0/3.0)*(z(i,:)/c)^2-5*(z(i,:)/c)+4-(2.0/3.0)*(c/z(i,:));
 elseif (c<=z(i,:) || z(i,:)<=2*c)
     c0BHP4(i,:)=-5*(z(i,:)/c)+4-0.667*(c/z(i,:));
 else
     c0BHP4(i,:)=0;
 end
  
  end
  
c0BHP4=reshape(c0BHP4,120,60,5); 
  figure()
redd=slice(c0BHP4,[1 60],[1 120],[1 5]);
axis equal on
%axis([1 27 1 84 1 4 ])
% xlim([1 84])
% ylim([1 27])
% zlim([0 4])
shading flat
grid off
title('cov','FontName','Helvetica', 'Fontsize', 16);
xlabel('X','FontName','Helvetica', 'Fontsize', 16)
ylabel('Y','FontName','Helvetica', 'Fontsize', 16)
zlabel('Z','FontName','Helvetica', 'Fontsize', 16)
colorbar;
set(gca, 'FontName','Helvetica', 'Fontsize', 16)
set(gcf,'color','white')
hold on



direction = [0 1 0];
rotate(redd,direction,180)
plot3([39 39],[101 101],[1 50],'k','Linewidth',2);
text(39 ,101 , 31,'INJECTOR 4','Fontsize', 11)
hold on
set(gcf,'color','white')
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
set(gca,'zticklabel',[])
saveas(gcf,'figure8','eps')
saveas(gcf,'figure8','jpg')
close(figure)
  
  
  c=77;
  
  %Get the localization for GOR 1 Well P1
A=zeros(120,60,5);
for j=1:5
    A(14,25,j)=1;
end

disp( 'calculate the euclidean distance function to the 6 producer wells')
    lf=reshape(A,120,60,5);
   for j=1:5;
     sdf=lf(:,:,j);
  [usdf,IDX] = bwdist(sdf);
  usdf=reshape(usdf,7200,1);
  young(:,j)=usdf;
   
   end
   sdfbig=reshape(young,36000,1);
   sdfbig1=abs(sdfbig);
   z=sdfbig1;
   % the value of the range should be computed accurately.
   %c=range(z);
  
  
   c0GOR1=zeros(36000,1);
   disp( 'compute the gaspari-cohn coefficent')
  for i=1:36000;
 if (0<=z(i,:) || z(i,:)<=c)
  c0GOR1(i,:)=-0.25*(z(i,:)/c)^5+0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3-(5.0/3.0)*(z(i,:)/c)^2+1;
elseif z < 2*c
  c0GOR1(i,:)=(1.0/12.0)*(z(i,:)/c)^5-0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3+(5.0/3.0)*(z(i,:)/c)^2-5*(z(i,:)/c)+4-(2.0/3.0)*(c/z(i,:));
 elseif (c<=z(i,:) || z(i,:)<=2*c)
     c0GOR1(i,:)=-5*(z(i,:)/c)+4-0.667*(c/z(i,:));
 else
     c0GOR1(i,:)=0;
 end
  
  end


  %Get the localization for GOR 2 Well P2
A=zeros(120,60,5);
for j=1:5
    A(38,39,j)=1;
end

disp( 'calculate the euclidean distance function to the 6 producer wells')
    lf=reshape(A,120,60,5);
   for j=1:5;
     sdf=lf(:,:,j);
  [usdf,IDX] = bwdist(sdf);
  usdf=reshape(usdf,7200,1);
  young(:,j)=usdf;
   
   end
   sdfbig=reshape(young,36000,1);
   sdfbig1=abs(sdfbig);
   z=sdfbig1;
   % the value of the range should be computed accurately.
   %c=range(z);
  
  
   c0GOR2=zeros(36000,1);
   disp( 'compute the gaspari-cohn coefficent')
  for i=1:36000;
 if (0<=z(i,:) || z(i,:)<=c)
  c0GOR2(i,:)=-0.25*(z(i,:)/c)^5+0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3-(5.0/3.0)*(z(i,:)/c)^2+1;
elseif z < 2*c
  c0GOR2(i,:)=(1.0/12.0)*(z(i,:)/c)^5-0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3+(5.0/3.0)*(z(i,:)/c)^2-5*(z(i,:)/c)+4-(2.0/3.0)*(c/z(i,:));
 elseif (c<=z(i,:) || z(i,:)<=2*c)
     c0GOR2(i,:)=-5*(z(i,:)/c)+4-0.667*(c/z(i,:));
 else
     c0GOR2(i,:)=0;
 end
  
  end



    %Get the localization for GOR 3 Well P3
A=zeros(120,60,5);
for j=1:5
    A(96,23,j)=1;
end

disp( 'calculate the euclidean distance function to the 6 producer wells')
    lf=reshape(A,120,60,5);
   for j=1:5;
     sdf=lf(:,:,j);
  [usdf,IDX] = bwdist(sdf);
  usdf=reshape(usdf,7200,1);
  young(:,j)=usdf;
   
   end
   sdfbig=reshape(young,36000,1);
   sdfbig1=abs(sdfbig);
   z=sdfbig1;
   % the value of the range should be computed accurately.
   %c=range(z);
  
  
   c0GOR1=zeros(36000,1);
   disp( 'compute the gaspari-cohn coefficent')
  for i=1:36000;
 if (0<=z(i,:) || z(i,:)<=c)
  c0GOR3(i,:)=-0.25*(z(i,:)/c)^5+0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3-(5.0/3.0)*(z(i,:)/c)^2+1;
elseif z < 2*c
  c0GOR3(i,:)=(1.0/12.0)*(z(i,:)/c)^5-0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3+(5.0/3.0)*(z(i,:)/c)^2-5*(z(i,:)/c)+4-(2.0/3.0)*(c/z(i,:));
 elseif (c<=z(i,:) || z(i,:)<=2*c)
     c0GOR3(i,:)=-5*(z(i,:)/c)+4-0.667*(c/z(i,:));
 else
     c0GOR3(i,:)=0;
 end
  
  end
 
 

   %Get the localization for GOR 4 Well P4
A=zeros(120,60,5);
for j=1:5
    A(67,41,j)=1;
end

disp( 'calculate the euclidean distance function to the 6 producer wells')
    lf=reshape(A,120,60,5);
   for j=1:5;
     sdf=lf(:,:,j);
  [usdf,IDX] = bwdist(sdf);
  usdf=reshape(usdf,7200,1);
  young(:,j)=usdf;
   
   end
   sdfbig=reshape(young,36000,1);
   sdfbig1=abs(sdfbig);
   z=sdfbig1;
   % the value of the range should be computed accurately.
   %c=range(z);
  
  
   c0GOR4=zeros(36000,1);
   disp( 'compute the gaspari-cohn coefficent')
  for i=1:36000;
 if (0<=z(i,:) || z(i,:)<=c)
  c0GOR4(i,:)=-0.25*(z(i,:)/c)^5+0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3-(5.0/3.0)*(z(i,:)/c)^2+1;
elseif z < 2*c
  c0GOR4(i,:)=(1.0/12.0)*(z(i,:)/c)^5-0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3+(5.0/3.0)*(z(i,:)/c)^2-5*(z(i,:)/c)+4-(2.0/3.0)*(c/z(i,:));
 elseif (c<=z(i,:) || z(i,:)<=2*c)
     c0GOR4(i,:)=-5*(z(i,:)/c)+4-0.667*(c/z(i,:));
 else
     c0GOR4(i,:)=0;
 end
  
  end
  
  
  
    %Get the localization for FOE Well P1-P4
A=zeros(120,60,5);
for j=1:5
    A(14,25,j)=1;
	A(38,39,j)=1;
	A(96,23,j)=1;
	A(67,41,j)=1;
end

disp( 'calculate the euclidean distance function to the 6 producer wells')
   lf=reshape(A,120,60,5);
   for j=1:5;
     sdf=lf(:,:,j);
  [usdf,IDX] = bwdist(sdf);
  usdf=reshape(usdf,7200,1);
  young(:,j)=usdf;
   
   end
   sdfbig=reshape(young,36000,1);
   sdfbig1=abs(sdfbig);
   z=sdfbig1;
   % the value of the range should be computed accurately.
   %c=range(z);
  
  
   c0FOE=zeros(36000,1);
   disp( 'compute the gaspari-cohn coefficent')
  for i=1:36000;
 if (0<=z(i,:) || z(i,:)<=c)
  c0FOE(i,:)=-0.25*(z(i,:)/c)^5+0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3-(5.0/3.0)*(z(i,:)/c)^2+1;
elseif z < 2*c
  c0FOE(i,:)=(1.0/12.0)*(z(i,:)/c)^5-0.5*(z(i,:)/c)^4+0.625*(z(i,:)/c)^3+(5.0/3.0)*(z(i,:)/c)^2-5*(z(i,:)/c)+4-(2.0/3.0)*(c/z(i,:));
 elseif (c<=z(i,:) || z(i,:)<=2*c)
     c0FOE(i,:)=-5*(z(i,:)/c)+4-0.667*(c/z(i,:));
 else
     c0FOE(i,:)=0;
 end
  
  end
c0FOE=reshape(c0FOE,120,60,5); 
  figure()
redd=slice(c0FOE,[1 60],[1 120],[1 5]);
axis equal on
%axis([1 27 1 84 1 4 ])
% xlim([1 84])
% ylim([1 27])
% zlim([0 4])
shading flat
grid off
title('cov','FontName','Helvetica', 'Fontsize', 16);
xlabel('X','FontName','Helvetica', 'Fontsize', 16)
ylabel('Y','FontName','Helvetica', 'Fontsize', 16)
zlabel('Z','FontName','Helvetica', 'Fontsize', 16)
colorbar;
set(gca, 'FontName','Helvetica', 'Fontsize', 16)
set(gcf,'color','white')
hold on
direction = [0 1 0];
rotate(redd,direction,180)
plot3([25 25],[14 14],[1 50],'r','Linewidth',2);
% text(x1(i,1),y1(i,1),z1(i,1),['   ' ...
% num2str(time(i,1))],'HorizontalAlignment','left','FontSize',8);
text( 25, 14,52,'P1','HorizontalAlignment','left','FontSize',11)
hold on
plot3([39 39],[38 38],[1 50],'r','Linewidth',2);
text( 39, 38, 52,'P2','Fontsize', 11)
hold on
plot3([23 23],[96 96],[1 30],'r','Linewidth',2);
text(23 ,96 , 35,'P3','Fontsize', 11)
hold on
plot3([41 41],[67 67],[1 50],'r','Linewidth',2)
text( 41, 67, 45,'P4','Fontsize', 11)
set(gcf,'color','white')
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
set(gca,'zticklabel',[])
saveas(gcf,'figure9','eps')
saveas(gcf,'figure9','jpg')
close(figure)
  
  
  
 disp(' get the gaspari cohn for Cyd') 
 c0OIL1=reshape(c0OIL1,36000,1);
 c0OIL2=reshape(c0OIL2,36000,1);
 c0OIL3=reshape(c0OIL3,36000,1);
 c0OIL4=reshape(c0OIL4,36000,1);
 c0BHP1=reshape(c0BHP1,36000,1);
 c0BHP2=reshape(c0BHP2,36000,1);
 c0BHP3=reshape(c0BHP3,36000,1);
 c0BHP4=reshape(c0BHP4,36000,1);
 c0FOE=reshape(c0FOE,36000,1);
  schur=zeros(36000,17);
  schur(:,1)=c0OIL1;
  schur(:,2)=c0OIL2;
  schur(:,3)=c0OIL3;
  schur(:,4)=c0OIL4;
  schur(:,5)=c0WATER1;
  schur(:,6)=c0WATER2;
  schur(:,7)=c0WATER3;
  schur(:,8)=c0WATER4;
  schur(:,9)=c0BHP1;
  schur(:,10)=c0BHP2;
  schur(:,11)=c0BHP3;
  schur(:,12)=c0BHP4;
  schur(:,13)=c0OIL1;
  schur(:,14)=c0OIL2;
  schur(:,15)=c0OIL3;
  schur(:,16)=c0OIL4;
  schur(:,17)=c0FOE;
  
  yoboschur=ones(144017,17);
 
  yoboschur(72001:108000,:)=schur;
  yoboschur(108001:144000,:)=schur;
  
  


