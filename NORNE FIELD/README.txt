This code is to run 4 optimization methods for History matching the NORNE Reservoir
The MATLAB subroutines are called automatically in the run.
The main file is Main.m
To couple Eclipse with MATLAB, navigate to the 'C:\ecl' folder (without the quotation marks).Enter the home folder folder and copy the eclrc.bat batch file. paste it in the macros folder.Exit the folders.
Click run on the main.m file and selcect the optimzation method.
1) ENSEMBLE SMOOTHER MULTIPLE DATA ASSIMILATION
2)ENSEMBLE SMOOTHER
3)ENSEMBLE KALMAN FILTER
4)GENETIC ALGORITHM--(Not Recommended)
For more understanding on the first 3 methods please see the included pdf file by Professor Geir Evensen
The Forward problem (3phase 3D flow problem) is solved by the industry standard Eclipse.TM. It runs in parallel and reduces the burden on computational complexity.
The code is automated and has some user prompts, curently N=100 (ensemble size),nx=46,ny=112,nx=22
alpha for the ESMDA subroutines should be chosen between 4 and 8
Citation of this code and modification is allowed, please see below appropriate references
Clement Oku Etienam-PhD Petroleum Engineering University of Manchester,2015-2018
(2016) Integrated Structural Reconstruction and History Matching Using Ensemble Filter and Low-frequency Electromagnetic Data. C. Etienam, R. Villegas & M. Babaei. EAGE conference proceeding. EAGE-SPE Annual Conference & Exhibition, Vienna, Austria, June 2016. 
(2018) Shape and Distributed Parameter Estimation for History Matching using a Modified Ensemble Kalman Filter and Level Sets. ; R. Villegas , C. Etienam, O. Dorn  and M Babaei .Inverse problems. 
(2017) History Matching of Reservoirs by Updating Fault Properties using 4D Seismic Results and Ensemble Kalman Filter. C. Etienam, I. Mahmood and R. Villegas.  SPE paper SPE-185780-MS. 79th EAGE-SPE Annual Conference & Exhibition, France, 12-15 June 2017. 
(2018) CO2 Sequestration Using Ensemble Kalman Filter and Considering a Sustainability Approach. R. Villegas, C. Etienam, F. Rahma. SPE paper SPE-185780-MS. 80th EAGE-SPE Annual Conference & Exhibition, Copenhagen, 11-14 June 2018. Accepted.
(2018) An Improved Reservoir Model Calibration using Sparsity and Stochastic Optimization. C. Etienam, R. Villegas , and O. Dorn. ECMI
