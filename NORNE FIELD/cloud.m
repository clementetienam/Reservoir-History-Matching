clc;
clear all;
load rossmary.GRDECL;
load rossmaryporo.GRDECL;
load sgsim.out;
load sgsimporo.out;
CMRmap=[0 0 0;.3 .15 .75;.6 .2 .50;1 .25 .15;.9 .5 0;.9 .9 .5;1 1 1];
[X,Y] = meshgrid(1:120,1:60);

%x=reshape(x,72000,100);
a=log10(rossmary);
aa=rossmary;
b=rossmaryporo;
disp( 'lets see how it looks like')
dd=zeros(72000,1);
for i=1:72000
if aa(i)>=100
    dd(i)=1;
end
end

disp(' Find values greater than 100')
indices=find(a>=2);
indices2=find(a<2);
kk=aa(indices); % permeability greater than 100
kk2=aa(indices2); %permeability less than 100

disp(' Find porosity values greater than 0.1805')
% indices=find(aa>=100);
% indices2=find(aa<100);
kkporo=b(indices); % permeability greater than 100
kkporo2=b(indices2);


disp( 'get polyfit equation for high permeability');
p = polyfit(log10(kk),kkporo,8);
dsa=log10(kk);
%outside=(p(:,1).*(dsa.^5))+(p(:,2).*(dsa.^4))+(p(:,3).*(dsa.^3))+(p(:,4).*(dsa.^2))+(p(:,5).*(dsa.^1))+p(:,6);
outside1=polyval(p,dsa);

disp(' get the polyfit for low permeability');
p22 = polyfit(log10(kk2),kkporo2,8);
dsa2=log10(kk2);
outside2=polyval(p22,dsa2);


 
 
 
 
ggg2=sgsimporo;
sgsimporo=reshape(sgsimporo,72000,100);

for kkk=1:2
    clem=sgsimporo(:,kkk);
    figure()
for i=1:10
    clem=reshape(clem,120,60,10);
subplot(2,5,i);
surf(X',Y',(clem(:,:,i)))

shading flat
axis([1 120 1 60 ])
grid off
title('True Layer 1','FontName','Helvetica', 'Fontsize', 13);
ylabel('Y', 'FontName','Helvetica', 'Fontsize', 13);
xlabel('X', 'FontName','Helvetica', 'Fontsize', 13);
colormap(CMRmap)
caxis([0.1 0.4])
h = colorbar;
ylabel(h, 'Log K(mD)','FontName','Helvetica', 'Fontsize', 13);
set(h, 'ylim', [0.1 0.4])
set(gca, 'FontName','Helvetica', 'Fontsize', 13)
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
end
end

sgg=reshape(sgsim,72000,100);
gggg=reshape(ggg2,72000,100);
for kv=1:100
    sgc=log10(sgg(:,kv));
    ggc=gggg(:,kv);
for j=1:10
    sgsub=reshape(sgc,7200,10);
    %ggsub=reshape(ggc,7200,10);
   dsa=sgsub(:,j); 
    if sgsub>=2
     outside=polyval(p,dsa); 
    else
      outside=polyval(p22,dsa);   
    end
% p = polyfit(sgsub(:,j),ggsub(:,j),10);

% outside=(p(:,1).*(dsa.^10))+(p(:,2).*(dsa.^9))+(p(:,3).*(dsa.^8))+(p(:,4).*(dsa.^7))+(p(:,5).*(dsa.^6))+(p(:,6).*(dsa.^5))...
%     +(p(:,7).*(dsa.^4))+(p(:,8).*(dsa.^3))+(p(:,9).*(dsa.^2))+(p(:,10).*(dsa.^1))+p(:,11);


outsidee(:,j)=reshape(outside,7200,1);
end
outsidew(:,kv)=reshape(outsidee,72000,1);

end

outsidew(outsidew>=0.4)=0.4;
outsidew=reshape(outsidew,7200000,1);
for i=1:7200000
if outsidew(i)>=0.28
    outsidew(i)=outsidew(i).*0.7;
end
end  
 
outsidew(outsidew<=0.05)=0.05;
outsidew=reshape(outsidew,72000,100);
for kkk=87:88
    clem=outsidew(:,kkk);
    figure()
for i=1:10
    clem=reshape(clem,120,60,10);
subplot(2,5,i);
surf(X',Y',(clem(:,:,i)))

shading flat
axis([1 120 1 60 ])
grid off
title('True Layer 1','FontName','Helvetica', 'Fontsize', 13);
ylabel('Y', 'FontName','Helvetica', 'Fontsize', 13);
xlabel('X', 'FontName','Helvetica', 'Fontsize', 13);
colormap(CMRmap)
caxis([0.1 0.4])
h = colorbar;
ylabel(h, 'Log K(mD)','FontName','Helvetica', 'Fontsize', 13);
set(h, 'ylim', [0.1 0.4])
set(gca, 'FontName','Helvetica', 'Fontsize', 13)
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])
end
end

file2 = fopen('sgsimporo2.out','w+'); %output the dictionary
for k=1:numel(outsidew)                                                                       
fprintf(file2,' %4.6f \n',outsidew(k) );             
end