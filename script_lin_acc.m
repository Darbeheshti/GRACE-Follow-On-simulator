% A script for producing linear accelerations (ACC)
% Neda Darbeheshti & Henry Wegener, AEI Hannover, 2018-10-22

% The noise, bias and scale added to the accelerometer data in SF are based
% on Eq. (5.4) of Kim (2000), page 153 

% % % gather all ng-accelerations
acc_ng_A_eci = ForcesA(:,11:13) + ForcesA(:,14:16);
acc_ng_B_eci = ForcesB(:,11:13) + ForcesB(:,14:16);

% % % rotate non-gravitational accelerations from ICRF to SF
acc_ng_A_SF = QuatRotICRF2SF(acc_ng_A_eci,q_A_pure,'forward');
acc_ng_B_SF = QuatRotICRF2SF(acc_ng_B_eci,q_B_pure,'forward');

% % % add bias and scale
acc_scale_A = [0.9595 0.9797  0.9485];
acc_bias_A = [-1.106 27.042 -0.5486];
acc_ng_SF_bs_A = acc_ng_A_SF.*acc_scale_A + acc_bias_A*1E-6;

acc_scale_B = [0.9465 0.9842   0.9303];
acc_bias_B = [-0.5647 7.5101 -0.8602];
acc_ng_SF_bs_B = acc_ng_B_SF.*acc_scale_B + acc_bias_B*1E-6;

% % % add instrument noise
acc_noise_A = accnoise(5,L);
acc_lin_A = acc_ng_SF_bs_A + acc_noise_A;

acc_noise_B = accnoise(5,L);
acc_lin_B = acc_ng_SF_bs_B + acc_noise_B;

