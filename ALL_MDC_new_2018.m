% This script contains all steps to generate MDC data (new 2018 version),
% except orbit integration.
% Henry Wegener, AEI Hannover, 2018-10-22
%%
% % % README
% 
% GENERAL
% ----------
% * one month data (31 days)
% * 535680 data points
% * 5 second sampling (0.2 Hz)
% * Start:      2005-05-01 00:00:00     [GPS time]
% * End:        2005-05-31 23:59:55     [GPS time]
% ----------
% Overall input:    Orbit A&B, ng. Forces A&B   (from orbit integrator)
%                   RPY (pointing angles) A&B   (from simulator)
% Overall output:   ACC, GNV, KBR, SCA(, LRI)
% ----------
% 
% 
%ltpda_startup
clear all
close all
clc
format long


% % % INPUT file % % %

input_file_name = 'AMDC118-Dec-2018';
load(input_file_name)

% GNV contains:   1 = time stamps (GRACE GPS seconds)
%               2:4 = total acc
%               5:7 = tides
%              8:10 = 3rd body
%             11:13 = ATD
%             14:16 = SRP
% 
% Forces contains:         1 = time stamps
%                   2:4, 5:7 = pos, vel (eci)
%                8:10, 11:13 = pos, vel (ecef)
% 
% KBR contains:     1 = time stamps
%                   2 = range
%                   3 = range rate
%                   4 = range acceleration
% % % % % % % % % % % % % % % % % % % % % % % % % % % % %


%% 0) general
range = KBR(:,2);
version = '02';
time_stamps = GNVA1B(:,1); % GRACE GPS time [s]
L = length(time_stamps); % 535680
t0 = '2005-05-01 00:00:00.000'; % epoch
fs = 0.2; % sampling frequency
% time_utc = gracegps2iso(time_stamps,'utc');


%% 1) positions, velocities

script_posvel


%% 2) produce GRACE-FO roll, pitch, yaw
script_rpy_pure

script_rpy_sca

script_py_dws


%% 3) produce quaternions 
script_quaternions


%% 4) non-gravitational forces
script_lin_acc

script_ang_acc


%% 5) TTL (errors & corrections from phase center / vertex point offsets) - KBR & LRI

script_TTL


%% 6) range - KBR & LRI

script_range


%% 7) save
%save(['AMDC_all_v',version,'_',datestr(today('datetime'))])
save(['AMDC_all_v',version,'_',datestr(now, 'dd-mmm-yyyy')])
clearvars -except ...
    time_stamps L version...
    acc_lin_A acc_lin_B acc_ang_A acc_ang_B acc_noise_A acc_noise_B ... % for ACC1B files
    pos_A_GNV pos_B_GNV vel_A_GNV vel_B_GNV std_pos_A std_vel_A std_pos_B std_vel_B ... % for GNV1B files
    q_A_sca q_B_sca ... % for SCA1B files
    range_KBR rangerate_KBR rangeacc_KBR pco_corr d_pco_corr dd_pco_corr ... % for KBR1B files
    range_LRI rangerate_LRI rangeacc_LRI vpo_corr d_vpo_corr dd_vpo_corr py_A_LRI py_B_LRI ... % for LRI1B files
    

%% 8) make Level-1B files

make_ACC1B
make_GNV1B
make_SCA1B
make_KBR1B
make_LRI1B


%%
% % % in the end:
% ACC files: lin. acc., ang. acc, std(noise)    (with acc noise, bias, scale)
% GNV files: pos, vel [ecef]                    (with gps noise)
% SCA files: q                                  (with sca noise, bias)
% KBR files: range                              (with kbr noise, bias and TTL)
% LRI files: range                              (with lri noise, bias and TTL)
%            + DWS angles (py)                  (with fsm noise, bias)


