clc;
clear ;
close all;
load rossmary.GRDECL;
Trueperm1=reshape(log10(rossmary),120,60,10);
Trueperm=Trueperm1(:,:,3:7);
for i=1:5
    R=radon(Trueperm(:,:,i));
    R(R==0)=[];
    usee=reshape(R,25020,1);
    valuee(:,i)=usee;
end
valuee=reshape(valuee,139,180,5);
for i=1:5
    I1 = iradon(valuee(:,:,i),0:179);
    joy=reshape(I1,7200,1);
    valueb(:,i)=joy;
end
disp(' now do the inverse radon');

R = radon(Trueperm,0:179);
[X,Y] = meshgrid(1:120,1:60);

figure()
subplot(2,5,1);
surf(X',Y',Trueperm(:,:,3))

shading flat
axis([1 120 1 60 ])
grid off
title('True Layer 1','FontName','Helvetica', 'Fontsize', 13);
ylabel('Y', 'FontName','Helvetica', 'Fontsize', 13);
xlabel('X', 'FontName','Helvetica', 'Fontsize', 13);
caxis([1 5])
h = colorbar;
ylabel(h, 'Log K(mD)','FontName','Helvetica', 'Fontsize', 13);
set(h, 'ylim', [1 5])
set(gca, 'FontName','Helvetica', 'Fontsize', 13)
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])


subplot(2,5,2);
surf(X',Y',Trueperm(:,:,4))

shading flat
axis([1 120 1 60 ])
grid off
title('True Layer 2','FontName','Helvetica', 'Fontsize', 13);
ylabel('Y', 'FontName','Helvetica', 'Fontsize', 13);
xlabel('X', 'FontName','Helvetica', 'Fontsize', 13);
caxis([1 5])
h = colorbar;
ylabel(h, 'Log K(mD)','FontName','Helvetica', 'Fontsize', 13);
set(h, 'ylim', [1 5])
set(gca, 'FontName','Helvetica', 'Fontsize', 13)
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

subplot(2,5,3);
surf(X',Y',Trueperm(:,:,5))

shading flat
axis([1 120 1 60 ])
grid off
title('True Layer 3','FontName','Helvetica', 'Fontsize', 13);
ylabel('Y', 'FontName','Helvetica', 'Fontsize', 13);
xlabel('X', 'FontName','Helvetica', 'Fontsize', 13);
caxis([1 5])
h = colorbar;
ylabel(h, 'Log K(mD)','FontName','Helvetica', 'Fontsize', 13);
set(h, 'ylim', [1 5])
set(gca, 'FontName','Helvetica', 'Fontsize', 13)
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

subplot(2,5,4);
surf(X',Y',Trueperm(:,:,6))

shading flat
axis([1 120 1 60 ])
grid off
title('True Layer 4','FontName','Helvetica', 'Fontsize', 13);
ylabel('Y', 'FontName','Helvetica', 'Fontsize', 13);
xlabel('X', 'FontName','Helvetica', 'Fontsize', 13);
caxis([1 5])
h = colorbar;
ylabel(h, 'Log K(mD)','FontName','Helvetica', 'Fontsize', 13);
set(h, 'ylim', [1 5])
set(gca, 'FontName','Helvetica', 'Fontsize', 13)
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])

subplot(2,5,5);

surf(X',Y',Trueperm(:,:,7))

shading flat
axis([1 120 1 60 ])
grid off
title('True Layer 5','FontName','Helvetica', 'Fontsize', 13);
ylabel('Y', 'FontName','Helvetica', 'Fontsize', 13);
xlabel('X', 'FontName','Helvetica', 'Fontsize', 13);
caxis([1 5])
h = colorbar;
ylabel(h, 'Log K(mD)','FontName','Helvetica', 'Fontsize', 13);
set(h, 'ylim', [1 5])
set(gca, 'FontName','Helvetica', 'Fontsize', 13)
set(gcf,'color','white')
set(gca,'xticklabel',[])
set(gca,'yticklabel',[])