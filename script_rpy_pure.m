% A script for simulating GRACE-FO roll, pitch, yaw
% Henry Wegener, AEI Hannover, 2018-10-22

load GFO_RPY_models_02Hz
ts_spec = model_GFO_roll_02.ts_spec_in;

ts_spec.name = 'Roll GFO A';
roll_GFO_A = ts_simulation(L,model_GFO_roll_02,ts_spec);

ts_spec.name = 'Roll GFO B';
roll_GFO_B = ts_simulation(L,model_GFO_roll_02,ts_spec);

ts_spec.name = 'Pitch GFO A';
pitch_GFO_A = ts_simulation(L,model_GFO_pitch_02,ts_spec);

ts_spec.name = 'Pitch GFO B';
pitch_GFO_B = ts_simulation(L,model_GFO_pitch_02,ts_spec);

ts_spec.name = 'Yaw GFO A';
yaw_GFO_A = ts_simulation(L,model_GFO_yaw_02,ts_spec);

ts_spec.name = 'Yaw GFO B';
yaw_GFO_B = ts_simulation(L,model_GFO_yaw_02,ts_spec);
% asd_yaw_GFO_B = psd(yaw_GFO_B,plist('scale','asd','navs',60));
% iplot(asd_yaw_GFO_B)


rpy_A_pure = [roll_GFO_A.y, pitch_GFO_A.y, yaw_GFO_A.y];
rpy_B_pure = [roll_GFO_B.y, pitch_GFO_B.y, yaw_GFO_B.y];

