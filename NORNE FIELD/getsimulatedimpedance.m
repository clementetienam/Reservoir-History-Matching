function [IEn83,IEn89]=getsimulatedimpedance(N,nx,ny,nz);
%cd(oldfolder) % returning to original directory
oldfolder=cd;
cd(oldfolder);
for m=1:2

    for i=1:N %list of folders 
    
    f = 'Realization_';
 folder = strcat(f, sprintf('%d',i));
    cd(folder)
    
    %Loading values
    if m==1
    PORO = importdata('porosity.dat',' ',1);
    PORO=PORO.data;
    Pr=load('P1983.out');
    SO=load('SO1983.out');
    end
    
    if m==2
    PORO = importdata('porosity.dat',' ',1);
    PORO=PORO.data;
    Pr=load('P1989.out');
    SO=load('SO1989.out');
    end
    
        %Calc Impedance
    ImpP=Gassmann(PORO,Pr,SO);

    %Saving Results
    if m==1
        save('I1983.out','ImpP', '-ascii');
        IEn83(:,i)=reshape(ImpP,2268,1);
    end
    if m==2
        save('I1989.out','ImpP', '-ascii');
        IEn89(:,i)=reshape(ImpP,2268,1);
    end

    cd(oldfolder) % setting original directory
    
    end
end

if m==1
    IEn83=reshape(IEn83,nx*ny*N,1);
end    

if m==2
    IEn89=reshape(IEn89,nx*ny*N,1);
end
end