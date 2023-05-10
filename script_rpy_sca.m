% A script for producing rpy (SCA = noisy, biased) from rpy (pure = error-free).
% Henry Wegener, AEI Hannover, 2018-10-22

% roll SCA-A noise: 20 urad/rtHz        roll SCA-A bias: +1.2 mrad
% pitch SCA-A noise: 20 urad/rtHz       pitch SCA-A bias: -2.2 mrad
% yaw SCA-A noise: 20 urad/rtHz         yaw SCA-A bias: +1.8 mrad


% SCA noise roll A (white noise, noise level: 20�rad/rtHz)
nr_A = randn(L,1)*sqrt(fs/2)*2E-5;
noise_roll_SCA_A = ao( plist('type','tsdata','yvals',nr_A,'fs',fs,'t0',t0,'yunits','rad','name','SCA noise roll A') );
bias_roll_SCA_A = ao(1.2*1E-3,plist('yunits','rad','name','SCA bias roll A'));
sim_roll_SCA_A = roll_GFO_A + noise_roll_SCA_A + bias_roll_SCA_A;

% SCA noise pitch A
np_A = randn(L,1)*sqrt(fs/2)*2E-5;
noise_pitch_SCA_A = ao( plist('type','tsdata','yvals',np_A,'fs',fs,'t0',t0,'yunits','rad','name','SCA noise pitch A') );
bias_pitch_SCA_A = ao(-2.2*1E-3,plist('yunits','rad','name','SCA bias pitch A'));
sim_pitch_SCA_A = pitch_GFO_A + noise_pitch_SCA_A + bias_pitch_SCA_A;

% SCA noise yaw A
ny_A = randn(L,1)*sqrt(fs/2)*2E-5;
noise_yaw_SCA_A = ao( plist('type','tsdata','yvals',ny_A,'fs',fs,'t0',t0,'yunits','rad','name','SCA noise yaw A') );
bias_yaw_SCA_A = ao(1.8*1E-3,plist('yunits','rad','name','SCA bias yaw A'));
sim_yaw_SCA_A = yaw_GFO_A + noise_yaw_SCA_A + bias_yaw_SCA_A;


% roll SCA-B noise: 20 urad/rtHz        roll SCA-B bias: -2.9 mrad
% pitch SCA-B noise: 20 urad/rtHz       pitch SCA-B bias: -1.8 mrad
% yaw SCA-B noise: 20 urad/rtHz         yaw SCA-B bias: +2.1 mrad


% SCA noise roll B (white noise, noise level: 20�rad/rtHz)
nr_B = randn(L,1)*sqrt(fs/2)*2E-5;
noise_roll_SCA_B = ao( plist('type','tsdata','yvals',nr_B,'fs',fs,'t0',t0,'yunits','rad','name','SCA noise roll B') );
bias_roll_SCA_B = ao(1.2*1E-3,plist('yunits','rad','name','SCA bias roll B'));
sim_roll_SCA_B = roll_GFO_B + noise_roll_SCA_B + bias_roll_SCA_B;

% SCA noise pitch B
np_B = randn(L,1)*sqrt(fs/2)*2E-5;
noise_pitch_SCA_B = ao( plist('type','tsdata','yvals',np_B,'fs',fs,'t0',t0,'yunits','rad','name','SCA noise pitch B') );
bias_pitch_SCA_B = ao(-2.2*1E-3,plist('yunits','rad','name','SCA bias pitch B'));
sim_pitch_SCA_B = pitch_GFO_B + noise_pitch_SCA_B + bias_pitch_SCA_B;

% SCA noise yaw B
ny_B = randn(L,1)*sqrt(fs/2)*2E-5;
noise_yaw_SCA_B = ao( plist('type','tsdata','yvals',ny_B,'fs',fs,'t0',t0,'yunits','rad','name','SCA noise yaw B') );
bias_yaw_SCA_B = ao(1.8*1E-3,plist('yunits','rad','name','SCA bias yaw B'));
sim_yaw_SCA_B = yaw_GFO_B + noise_yaw_SCA_B + bias_yaw_SCA_B;


rpy_A_sca = [sim_roll_SCA_A.y, sim_pitch_SCA_A.y, sim_yaw_SCA_A.y];
rpy_B_sca = [sim_roll_SCA_B.y, sim_pitch_SCA_B.y, sim_yaw_SCA_B.y];

