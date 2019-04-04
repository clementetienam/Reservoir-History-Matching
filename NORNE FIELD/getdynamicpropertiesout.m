function [PclementEn83,SclementEn83,PclementEn89,SclementEn89]=getdynamicpropertiesout(N);
oldfolder=cd;
cd(oldfolder);
for iie=1:N %list of folders 
    
   f = 'Realization_';
 folder = strcat(f, sprintf('%d',iie));
    cd(folder)   
    
    %if m==1  % 1983
        
    %Pressure data lines [670-2937]
    Pclement = importdata('FULLNORNE.F0001',' ',669);
    Pclement=Pclement.data;
    
    %Saturation data lines [2939-5206]
    Sclement = importdata('FULLNORNE.F0001',' ',2938);
    Sclement=Sclement.data;
    SOclement=ones(2268,4)-Sclement;
    
    save('P1983.out','Pclement','-ascii');
    save('SO1983.out','SOclement','-ascii');
    
    %Reshape 
    %Pressure
    Aclement=Pclement;
    Bclement=Eclipse2Matlab(Aclement);
    Bclement = resize(Bclement,[9072,1]);
    Bclement=reshape(Bclement,9072,1);
    PclementEn83(:,iie)=Bclement;
    %Saturation
    A2clement=SOclement;
    B2clement=Eclipse2Matlab(A2clement);
    B2clement = resize(B2clement,[9072,1]);
    B2clement=reshape(B2clement,9072,1);
    SclementEn83(:,iie)=B2clement;  
    %end
    
    %if m==2  % 1989
   
    %Pressure data lines [670-2937]
    P1989clement = importdata('FULLNORNE.F0016',' ',669);
    P1989clement=P1989clement.data;
    
    %Saturation data lines [2939-5206]
    SW1989clement = importdata('FULLNORNE.F0016',' ',2938);
    SW1989clement=SW1989clement.data;
    SO1989clement=ones(2268,4)-SW1989clement;
    
    save('P1989.out','P1989clement','-ascii');
    save('SO1989.out','SO1989clement','-ascii');
    
    %Reshape 
    %Pressure
    A3clement=P1989clement;
    B3clement=Eclipse2Matlab(A3clement);
    B3clement = resize(B3clement,[9072,1]);
    B3clement=reshape(B3clement,9072,1);
    PclementEn89(:,iie)=B3clement;
    %Saturation
    A4clement=SO1989clement;
    B4clement=Eclipse2Matlab(A4clement);
    B4clement = resize(B4clement,[9072,1]);
    B4clement=reshape(B4clement,9072,1);
    SclementEn89(:,iie)=B4clement;  
    %end
    
    cd(oldfolder) % returning to original directory

end
end