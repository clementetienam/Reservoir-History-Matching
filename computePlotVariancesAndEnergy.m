function computePlotVariancesAndEnergy(Sig)
%  Authors: H. X. Vo and L. J. Durlorfky
%% Compute variance and relative energy
variance = Sig .* Sig; % variances are eigenvalues
Energy = cumsum(variance) / sum(variance); % relative energy
%% Plot variance and relative energy
figure;
hold on
plot(variance, 'b','linewidth',2);
xlabel('Number of retained eigenpairs','FontName','Times New Roman','FontSize',18,'FontWeight','n')
ylabel('Variance (eigenvalue)','FontName','Times New Roman','FontSize',18,'FontWeight','n')
set(gca,'FontName','Times New Roman','FontSize',18,'FontWeight','n')
%  Relative energy
figure
hold on
plot(Energy, 'b','linewidth',2);
xlabel('Number of retained eigenpairs','FontName','Times New Roman','FontSize',18,'FontWeight','n')
ylabel('Relative energy','FontName','Times New Roman','FontSize',18,'FontWeight','n')
set(gca,'FontName','Times New Roman','FontSize',18,'FontWeight','n')
end

