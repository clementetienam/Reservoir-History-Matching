This code is to run my methodologies for History matching the SPE10 reservoir
The MATLAB subroutines are called automatically in the run.
MATLAB 2017 is prefered for this run
CLEMENT ="matlab -r main_ESMDA" standard ESMDA
!CLEMENT ="matlab -r main_EnKF_MDA" standard EnKF Evensen style sequential simulation ! very computationally expensive
!CLEMENT ="matlab -r main_Levelset" ESMDA and Level set coupled
!CLEMENT ="matlab -r main_DCT" ESMDA and DCT coupled for domain reduction
!CLEMENT ="matlab -r main_sparsity" ESMDA and Sparsity coupled (machine learning)
!CLEMENT ="matlab -r main_SELE" ESMDA,Sparsity and Level set coupled (machine learning)
The overcomplete dictionary is done offline and is not included here.It is the machine earning part that converts the spatial permeability field to sparse field
The code is automated and has some user prompts, curently N=100 (ensemble size),nx=120,ny=60,nx=5
alpha for the ESMDA subroutines should be chosen between 4 and 8
Repeat the code alpha times by just clicking run from the Fortran main file. If alpha =8, repeat the code 8 times after the end of the run.
Please wait for the 'Fortran and MATLAB has been program executed' to be displayed before exiting
Citation of this code and modification is allowed, please reference us if used in any future work or research
Clement Oku Etienam, Rossmary Viellegas, Masoud Babaei