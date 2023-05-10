% A script for producing KBR and LRI range
% 
% Henry Wegener, AEI Hannover, 2018-10-22

% KBR range = range + KBR noise + bias + e_TTL_KBR
% LRI range = range + LFN + bias + e_TTL_LRI


noise_KBR = kbrnoise(5,L);
bias_KBR = 0.02;

range_KBR = range + bias_KBR + noise_KBR + error_pco;
rangerate_KBR = NumDiff(range_KBR,5);
rangeacc_KBR = NumDiff2(range_KBR,5);


noise_LRI = lfnoise(5,L);
bias_LRI = 0.01;

range_LRI = range + bias_LRI + noise_LRI + error_vpo;
rangerate_LRI = NumDiff(range_LRI,5);
rangeacc_LRI = NumDiff2(range_LRI,5);

