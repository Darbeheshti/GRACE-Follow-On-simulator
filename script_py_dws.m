% A script for producing py (DWS) from rpy (pure)
% Henry Wegener, AEI Hannover, 2017-04-13


% pitch DWS-A bias: 0.9 mrad        rounding: 4.5�rad
% yaw DWS-A bias: -0.7 mrad         rounding: 6.0�rad

% DWS measurement pitch A
bias_pitch_DWS_A = ao(0.9*1E-3,plist('yunits','rad','name','DWS bias pitch A'));
sim_pitch_DWS_A = round(pitch_GFO_A/(4.5E-6))*4.5E-6 + bias_pitch_DWS_A;

% DWS measurement yaw A
bias_yaw_DWS_A = ao(-0.7*1E-3,plist('yunits','rad','name','DWS bias yaw A'));
sim_yaw_DWS_A = round(yaw_GFO_A/(6E-6))*6E-6 + bias_yaw_DWS_A;


% pitch DWS-B bias: 1.1 mrad        rounding: 4.5�rad
% yaw DWS-B bias: 0.4 mrad          rounding: 6.0�rad

% DWS measurement pitch B
bias_pitch_DWS_B = ao(1.1*1E-3,plist('yunits','rad','name','DWS bias pitch B'));
sim_pitch_DWS_B = round(pitch_GFO_B/(4.5E-6))*4.5E-6 + bias_pitch_DWS_B;

% DWS measurement yaw B
bias_yaw_DWS_B = ao(0.4*1E-3,plist('yunits','rad','name','DWS bias yaw B'));
sim_yaw_DWS_B = round(yaw_GFO_B/(6E-6))*6E-6 + bias_yaw_DWS_B;


py_A_LRI = [sim_pitch_DWS_A.y, sim_yaw_DWS_A.y];
py_B_LRI = [sim_pitch_DWS_B.y, sim_yaw_DWS_B.y];

