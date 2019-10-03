function NrCovMatConvergenceStudy(X)
%  This function do convergence study of covariance matrix as a function of
%  Nr. The code for this function is not aiming at efficiency but explaing
%  the concepts.
%  Authors: H. X. Vo and L. J. Durlorfky
%% Compute covariance matrices corresponding to different Nr
Nr_vector = [2:10, 20:10:100, 200:100:5000];
V_1 = zeros(1, length(Nr_vector));
V_2 = zeros(1, length(Nr_vector));
C_1 = zeros(1, length(Nr_vector));
C_2 = zeros(1, length(Nr_vector));
C_3 = zeros(1, length(Nr_vector));
C_4 = zeros(1, length(Nr_vector));
% C_M_all = cell(1, length(Nr_vector)); % if enough memory to store
for j=1:length(Nr_vector)
    % Compute covariance matrix 
    X_temp   = X(:, 1:Nr_vector(j)); % data matrix
    x_m_temp = mean(X_temp, 2); % mean
    X_temp_c = (X_temp - repmat(x_m_temp, 1, Nr_vector(j))); % center the data matrix
    C_M_temp = (X_temp_c * X_temp_c') / (Nr_vector(j) - 1); % covariance matrix
%     C_M_all{j} = C_M_temp; % if enough memory to store
    % Some random variances
    V_1(j) = C_M_temp(2,2);
    V_2(j) = C_M_temp(1000,1000);
    % Some random covariances
    C_1(j) = C_M_temp(2,6);
    C_2(j) = C_M_temp(100,500);
    C_3(j) = C_M_temp(1000,1005);
    C_4(j) = C_M_temp(1500,1700);
    clear X_temp x_m_temp X_temp_c X_temp_c C_M_temp;
end
%% 
% Plot variances and covariance
figure
semilogx(Nr_vector, V_1,'r');
hold on;
semilogx(Nr_vector, V_2,'m');
semilogx(Nr_vector, C_1,'k');
semilogx(Nr_vector, C_2,'g');
semilogx(Nr_vector, C_3,'b');
semilogx(Nr_vector, C_4,'c');
hold off
% legend('C(2,2)', 'C(1000,1000)', 'C(2,6)', 'C(100,500)', 'C(1000,1005)', 'C(1500,1700)');
xlabel('{N_r}','FontAngle','italic','FontName','Times New Roman','FontSize',18,'FontWeight','n')
ylabel('Covariance','FontName','Times New Roman','FontSize',18,'FontWeight','n')
set(gca,'FontName','Times New Roman','FontSize',18,'FontWeight','n')

% save('S22Cond60x60_NrCovMatConvergenceStudy_C_M.mat', 'Nr_vector', 'C_M_all');

end

