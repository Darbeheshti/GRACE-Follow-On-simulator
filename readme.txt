Advanced Mock Data Challenge (updated 2018)
===========================================


Contains all Matlab scripts necessary to produce Level-1B ascii files.
Just run the script "ALL_MDC_new_2018.m".
For more details, see below.

Input must be given:
	- some utility functions (see below)
	- .mat file containing orbit and forces
 	  --> must contain the variables ForcesA, ForcesB, GNVA1B, GNVB1B, KBR
	      the format of those variables is specified in "ALL_MDC_new_2018.m"

Moreover, the following files are needed, but are already contained in this git repository
	- kbrnoise.m
 	- lfnoise.m
	- accnoise.m
	- GFO_RPY_models_02Hz.mat

- - - - - - - - - - - - - - - - - - - - - - - - - - - - -
================DETAILED DESCRIPTION=====================

to produce the ASCII files (*.asc):

	- make sure that your Matlab path contains the following functions [can be found here]
		NumDiff 			[gitlab/gfr-matlab/mfiles/utilityfunctions]
		NumDiff2 			[gitlab/gfr-matlab/mfiles/utilityfunctions]
		ts_simulation 			[gitlab/geoq-toolbox/ts_simulation]
		RotmatICRF2LOSF 		[gitlab/gfr-matlab/mfiles/coordinatetransformations]
		Euler2Rot 			[gitlab/gfr-matlab/mfiles/coordinatetransformations]
 		Rot2Quat 			[gitlab/gfr-matlab/mfiles/coordinatetransformations]
		QuatRotICRF2SF 			[gitlab/gfr-matlab/mfiles/coordinatetransformations]
		threeDmulti_rot			[gitlab/gfr-matlab/mfiles/coordinatetransformations]
		

	  (to be on the safe side, pull the respective gitlab repositories mentioned above)

	- 
	- open the script "ALL_MDC_new_2018.m" in Matlab
	- make sure Matlab is operating in the path of this repository [gitlab/amdc-2018]
	- change the input_file_name, i.e. the name of the .mat file which contains the orbit and the forces (required format is specified in "ALL_MDC_new_2018.m")
	- run ltpda_startup
	- run the script

=========================================================
- - - - - - - - - - - - - - - - - - - - - - - - - - - - -


In case you are missing any of the functions which are used by the scripts, or for any other question, ask me (Henry Wegener, AEI Hannover, henry.wegener@aei.mpg.de)
---END---
