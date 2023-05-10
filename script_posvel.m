% A script for producing GPS positions (with 1 cm white noise)
% 
% functions used: NumDiff
% 
% Henry Wegener, AEI Hannover, 2018-10-22


% error-free positions & velocities
pos_A_eci = GNVA1B(:,2:4); % [m]
pos_B_eci = GNVB1B(:,2:4); % [m]
pos_A_ecef = GNVA1B(:,8:10); % [m]
pos_B_ecef = GNVA1B(:,8:10); % [m]

vel_A_ecef = GNVA1B(:,11:13); % [m]
vel_B_ecef = GNVA1B(:,11:13); % [m]


% GPS position noise
noise_pos_A = 0.01*randn(L,3)*sqrt(0.2/2);
noise_pos_B = 0.01*randn(L,3)*sqrt(0.2/2);

std_pos_A = std(noise_pos_A);
std_pos_B = std(noise_pos_B);
std_vel_A = std(NumDiff(noise_pos_A,5));
std_vel_B = std(NumDiff(noise_pos_B,5));


pos_A_GNV = pos_A_ecef + noise_pos_A; % [m]
pos_B_GNV = pos_B_ecef + noise_pos_B; % [m]

vel_A_GNV = NumDiff(pos_A_GNV,5); % [m/s]
vel_B_GNV = NumDiff(pos_B_GNV,5); % [m/s]

