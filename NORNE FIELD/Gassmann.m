function [ImpP, ImpS, VP, VS]=Gassmann(PORO,Pr,SO,SG)
%Poro - porosity (array shape)
%P - pressure (psi, eclipse formatted)
%SO - oil saturation (eclispe formatted)

    % Temperature (degrees Celsius)
    % 217 F
    T = 76.85; % C

 %Importing porosity and permeability values
    %load('POROVANCOUVER.DAT')
    %load('KVANCOUVER.DAT')
    
    PORO2 = PORO;
    
    %Data analysis
    avePorosity = mean(PORO2);
    minPorosity = min(PORO2);
    maxPorosity = max(PORO2);
    stDevPorosity = std(PORO2);

      % Read in pressure and oil saturation files

    PressureAfter1Year=Pr;
    OilSatAfter1Year=SO;
    GasSatAfter1Year=SG;
    %%
    % sorting out indices
    for i = 1:size(PORO2)
    zIndex(i) = idivide(int16(i)-1,5152) + 1;
    xyIndex(i) = mod(int16(i)-1,5152)+1;
    yIndex(i) = idivide(int16(xyIndex(i))-1,46) + 1;
    xIndex(i) = mod(xyIndex(i)-1,46) +1;
    % {z}(x,y)
    porosity{zIndex(i)}(xIndex(i),yIndex(i)) = PORO2(i);
    pressure{zIndex(i)}(xIndex(i),yIndex(i)) =  field2Metric(PressureAfter1Year(i), 'psi')*1E-6;
    saturation{zIndex(i)}(xIndex(i),yIndex(i)) = OilSatAfter1Year(i);
    Gsaturation{zIndex(i)}(xIndex(i),yIndex(i)) = GasSatAfter1Year(i);
    
    end

%     % Read in pressure and oil saturation files
% 
%     PressureAfter1Year=Pr;
%     OilSatAfter1Year=SO;
%     GasSatAfter1Year=SG;

    % labeling the imported data
%     for i = 1:532   %84*27
%         for j = 1:5
%             aux(i,j) = (i - 1)*5 + j;
%             xyIndex2(i,j) = mod(aux(i,j) - 1, 532) + 1;
%             yIndex2(i,j) = idivide(int16(xyIndex2(i,j))-1,19) + 1;
%             xIndex2(i,j) = mod(xyIndex2(i,j) - 1,19) +1;
%             zIndex2(i,j) = idivide(int16(aux(i,j) - 1),532) + 1;
%             % psia to MPa            
%                 pressure{zIndex2(i,j)}(xIndex2(i,j),yIndex2(i,j)) = ...
%                     field2Metric(PressureAfter1Year(i,j), 'psi')*1E-6;
%                 saturation{zIndex2(i,j)}(xIndex2(i,j),yIndex2(i,j)) = ...
%                     OilSatAfter1Year(i,j);                  
%         end
%     end
    %% 
    %%%%%%Water data%%%%%%
    % The water formation volume factor at the reference pressure
    BWater = 1.0042; % rb/stb
    
    % Compressibility
    CWater = 5.43E-05; % 1/psi
    
    % Density
%      rhoWater = field2Metric(64.00, 'lbft3'); % kg/m3
rhoWater=1000;
    %%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%Oil data%%%%%%%%
    
    % Gas Specific gravity
    G = 0.8515;
    
    % 600 SCF/BBL ->  m3/m3
    RG = 0; %600*0.0283168466/0.158987295;
    
    % Oil API
    API = 141.5/G - 131.5; % need rhoOil in g/cm^3
    %%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%Matrix data%%%%%%
    
    % From permeability - porosity graphs, assumed made of quartz and feldspar
    % quartz dominant
    
    % Compressibility
    CMatrix = 0.00045; % 1/psi ;
    
    % Density
    % From Carmichael (1986)
    % Try different percentage of quartz
    SQuartz = 0.6;
    SFeldspar = 1 - SQuartz;
    rhoQuartz = 2.65*1000; % kg/m3
    KQuartz = 37E9; % Pa
    GQuartz = 44E9; % Pa
    rhoFeldspar = 2.62*1000; % kg/m3
    KFeldspar = 37.5E9; % Pa
    GFeldspar = 15E9; % Pa
    KMatrix = ones(19,28)*(SQuartz.*KQuartz + SFeldspar.*KFeldspar)/2 + ...
        (SQuartz./KQuartz + SFeldspar./KFeldspar).^(-1)/2;
    %%%%%%%%%%%%%%%%%%%%%%
    
    %%%%%%%%Frame data%%%%
    
    % Lab data
    rhoDry = ones(46,112)*2169;
    KDry = ones(46,112)*field2Metric(2E6, 'psi') ;
    GDry = ones(46,112)*field2Metric(1.368E6, 'psi');
    
    % Calculate parameters from input data for each z value
    for i = 1:5
        P = pressure{i};
        SOil = saturation{i};
        SGas = Gsaturation{i};
        phi = porosity{i};
       
        
        % Oil data (Batzle and Wang)
        rho0 = 141.5/(API + 131.5); % g/cm3
        
        % volume formation factor
        B0 = 0.972 + 0.00038*(2.4*RG*sqrt(G/rho0)+ T + 17.8).^(1.175);
        
        % pseudo density
        rhopseudo = rho0/B0*(1+0.001*RG)^-1; % g/cm3
        
        % density of oil with gas
        rhoG = (rho0 + 0.0012*G*RG)/B0; % g/cm3
        
        % density corrected for pressure and temperature
        rhoOil = 1000*(rho0 + (0.00277.*P - 1.71E-7.*P.^3)*(rhoG - 1.15).^2 + ...
            P.*3.49E-4)/(0.972 + 3.81E-4*(T + 17.78)^1.175); % kg/m3
        
        % Oil velocity from API (Batzle and Wang)
        % Simplified version of the equation in the report
        VOil = 2096*(rhopseudo/(2.6 - rhopseudo))^0.5 - 3.7*T + 4.64*P +...
            0.0115*T.*P*(4.12*(1.08/rhopseudo - 1).^0.5 - 1); %m/s
        
        % Bulk modulus of oil
        KOil = rhoOil.*VOil.^2; % Pa
        
        % Bulk modulus of water
        KWater = field2Metric(1./CWater, 'psi'); % Pa
        
        %Gas data
        
%Density of gas
R=8.314;
        Ta=T+273.15;
        Tpr=Ta./(94.72+170.75.*G);
        Ppr=P./(4.892-0.4048.*G);
        E=0.109.*(3.85.*Tpr).^2.*exp(-(0.45+8.*(0.56-1./Tpr).^2).*((Ppr.^2)./Tpr));
        Z=(0.03+0.00527.*(3.5-Tpr).^3).*Ppr+0.642.*Tpr-0.007.*Tpr.^4-0.52+E;
        rhoGas=(28.8.*G.*P)./(Z.*R.*Ta);
        
        %Bulk modulus of gas
        F=-1.2.*((Ppr.^0.2)./Tpr).*(0.45+8.*(0.56-(1./Tpr)).*exp(-(0.45+(8.*((0.56-1./Tpr).^2)).*((Ppr.^1.2)./Tpr))));
        dZoverdPpr=0.03+0.00527.*((3.5-Tpr).^2)+0.109.*((3.85-Tpr).^2).*F;
        yo=0.85.*(5.6./(Ppr+2))+27.1./((Ppr+3.5).^2)-8.7.*exp(-0.65.*(Ppr+1));
        KGas=(P./(1-(Ppr./Z).*(dZoverdPpr))).*yo./1000;
        
        % Woodcock's equation
        KFluid = ((1 - SGas - SOil)./KWater + SOil./KOil + SGas./KGas).^(-1); %Pa
        rhoFluid = (1 - SOil -SGas).*rhoWater + SOil.*rhoOil+SGas.*rhoGas; % kg/m3
        
        % Gassmann equations (in SI units)
        KSat{i} = KDry + ...
            (1 - KDry./KMatrix).^2./(phi./KFluid + (1 - phi)./KMatrix - KDry./KMatrix.^2);
        GSat = GDry;
        % Density equation
        rhoSat{i} = rhoDry + phi.*rhoFluid;
    end
    
    %%
    % Backus Average
    for i = 1:max(xIndex)
        for j = 1:max(yIndex)
            for k = 1:max(zIndex)
                element(k) = 1/(KSat{k}(i,j) + 4/3*GSat(i,j));
                density(k) = rhoSat{k}(i,j);
            end
            D(i,j) = GSat(i,j);
            C(i,j) = mean(element)^(-1);
            rho(i,j) = mean(density);
    end
    end
    
    % P and S wave velocities 
    VP = (C./rho).^0.5; % m/s
    VS = (D./rho).^0.5;
 
    % Seismic data (output) 
%     VP = field2Metric(VP, 'ms'); % ft/s
%     VS = field2Metric(VS, 'ms');
    
    rho = rho/1000; % g/cm3
    
    % Impedance
    ImpP = rho.*VP;
    ImpS = rho.*VS;
        
    % mean values 
    VPMean = mean(mean(VP));
    VSMean = mean(mean(VS));
    ImpPMean = mean(mean(ImpP));
    ImpSMean = mean(mean(ImpS));
    rhoSatMean = mean(mean(rho));
    
    % Difference from mean value
    VPD = (VP - VPMean)./VPMean*100;
    VSD = (VS - VSMean)./VSMean*100;
    ImpPD = (ImpP - ImpPMean)./ImpPMean*100;
    ImpSD = (ImpS - ImpSMean)./ImpSMean*100;
    rhoSatD = (rho - rhoSatMean)./rhoSatMean*100;
end