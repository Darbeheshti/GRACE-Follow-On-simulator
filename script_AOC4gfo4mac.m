%%AOC for GRACE 
% based on script_TTL by Henry Wegener, AEI Hannover, 2018-10-22
% Written by Neda Darbeheshti, AIUB, 2021-08.
% from TN-01_SOE.txt
% x 0.0  GRACEC VKB 3  1.4443985 -0.000054 0.000448 Mon May 14 10:00:00 2018 by tamarab - values from ground calibration
% x 0.0  GRACED VKB 3  1.4444575 -0.000054 0.000230 Mon May 14 10:00:00 2018 by tamarab - values from ground calibration
% 0.0    GRACEC VKB 3  1.4443985 -0.00017  0.000448  Updated 2019-05-07 by hywen.  Add 53 mm to Z values (to translate from satellite build frame to Satellite/Science Reference Frame) on slide 6 of 2018-04-25 "GRACE-FO KBR & GPS POD Antenna Phase Center" powerpoint by Jeff Tien and Brian Schratz, then get dual-frequency combination of the K and Ka values.
% 0.0    GRACED VKB 3  1.4444575  0.000054 0.000230 Updated 2019-05-07 by hywen.  Add 53 mm to Z values (to translate from satellite build frame to Satellite/Science Reference Frame) on slide 6 of 2018-04-25 "GRACE-FO KBR & GPS POD Antenna Phase Center" powerpoint by Jeff Tien and Brian Schratz, then get dual-frequency combination of the K and Ka values.
% %%
%0.0  GRACEA VKB  3  1.4451172588 -0.0004233040 0.0022786600  latest solution by FW Tue Jun 21 12:00:00 2011 by FW Wed Jun 29 22:18:41 2011 by rl02
%0.0  GRACEB VKB  3  1.4443870350  0.0005761203 0.0033040887  latest solution by FW Tue Jun 21 12:00:00 2011 by FW Wed Jun 29 22:18:41 2011 by rl02
clear all
close all
format longg;
fform='png';
year='20';
rls='RL04';
filepathORB=['/Users/neda/Documents/ubuntu_backup26092019/code/mfiles_variational/gracetools-master/plotting/aiub_plotting/aiub_out/'];
filepathSTA=['/Users/neda/Documents/ubuntu_backup26092019/code/mfiles_variational/gracetools-master/plotting/aiub_plotting/aiub_out/'];
filepathNeda=['/storage/research/aiub_u_camp/NEDA/OUT/'];
sca_id='GFO';
gni_id='_GNI_';
kbrid='GFO';
d=[33];
time_shift=0.224;% in seconds according to Lemoine(2019)the time tagging of the file is late versus truth
sec2hor=3600;
%
pc_A = [1.4443985 -0.00017  0.000448]; % antenna phase center [SF]Updated 2019-05-07 by hywen.
pc_B = [1.4444575  0.000054 0.000230];                           %Updated 2019-05-07 by hywen.
pc_A_guess = pc_A + 1E-3*[0, 0, 0]; % guessed phase center (pc) position [SF]
pc_B_guess = pc_B + 1E-3*[0, 0, 0];
%
ds = sprintf('%03d',d);% %03d for day of the  year
%% loading daily files
% load KBR data
    data_KBR = [filepathORB,kbrid,year,ds,'0.KBR'];
    KBRB = readKBRgfo(data_KBR);
    gfo_pco_corr=KBRB(:,9);
    gfo_d_pco_corr=KBRB(:,10);
% load SCAA data
    data_SCAA = [filepathORB,sca_id,'C',year,ds,'0.ATT'];
    SCAA = readSCAgfo(data_SCAA);
    q_A_noisy=SCAA(:,2:5);
    timeSCAA=(SCAA(:,1)-SCAA(1,1))+time_shift;
% load SCAB data
    data_SCAB = [filepathORB,sca_id,'D',year,ds,'0.ATT'];
    SCAB = readSCAgfo(data_SCAB);
    q_B_noisy=SCAB(:,2:5);
% load GNIA data
    data_GNIA = [filepathSTA,sca_id,'C',gni_id,year,ds,'0.PRE'];
    GNIA = readGNIgfo(data_GNIA);
    pos_A_eci=GNIA(:,2:4);
    timeGNIA=(GNIA(:,1)-GNIA(1,1));
% load GNIB data
    data_GNIB = [filepathSTA,sca_id,'D',gni_id,year,ds,'0.PRE'];
    GNIB = readGNIgfo(data_GNIB);
    pos_B_eci=GNIB(:,2:4);
%% correction terms (same as errors but with guessed pc/vp positions and with noisy quaternions)
range=vecnorm(pos_B_eci - pos_A_eci,2,2);
e_x = (pos_B_eci - pos_A_eci)./range; % line-of-sight unit vector
% test_e_x=vecnorm(e_x,2,2);
% figure
% plot(test_e_x)
%
L = length(SCAA); % 86400
%
R_A_noisy = RotmatICRF2SF(q_A_noisy);
R_B_noisy = RotmatICRF2SF(q_B_noisy);
%
pc_A_eci_guess = threeDmulti_rot(R_A_noisy,repmat(pc_A_guess,L,1),'backward');
pc_B_eci_guess = threeDmulti_rot(R_B_noisy,repmat(pc_B_guess,L,1),'backward');
%
pco_corr = -dot(e_x,pc_B_eci_guess,2) + dot(e_x,pc_A_eci_guess,2); % correction term: opposite sign
%d_pco_corr = NumDiff(pco_corr,1);
%matlab_d_pco_corr = diff(pco_corr);
d_pco_corr=diff1(pco_corr);
%% time shift of quaternions with spline
q_A_spline(:,1)= spline(timeSCAA,q_A_noisy(:,1),timeGNIA);
q_A_spline(:,2)= spline(timeSCAA,q_A_noisy(:,2),timeGNIA);
q_A_spline(:,3)= spline(timeSCAA,q_A_noisy(:,3),timeGNIA);
q_A_spline(:,4)= spline(timeSCAA,q_A_noisy(:,4),timeGNIA);
%
q_B_spline(:,1)= spline(timeSCAA,q_B_noisy(:,1),timeGNIA);
q_B_spline(:,2)= spline(timeSCAA,q_B_noisy(:,2),timeGNIA);
q_B_spline(:,3)= spline(timeSCAA,q_B_noisy(:,3),timeGNIA);
q_B_spline(:,4)= spline(timeSCAA,q_B_noisy(:,4),timeGNIA);
%
R_A_spline = RotmatICRF2SF(q_A_spline);
R_B_spline = RotmatICRF2SF(q_B_spline);
%
pc_A_eci_spline = threeDmulti_rot(R_A_spline,repmat(pc_A_guess,L,1),'backward');
pc_B_eci_spline = threeDmulti_rot(R_B_spline,repmat(pc_B_guess,L,1),'backward');
%
pco_corr_spline = -dot(e_x,pc_B_eci_spline,2) + dot(e_x,pc_A_eci_spline,2); % correction term: opposite sign
d_pco_corr_spline = NumDiff(pco_corr_spline,1);
%% plots
subplot(3,1,1)
plot(gfo_pco_corr,'-+','color','r')
hold on
plot(pco_corr(1:5:end),'-+','color','b')
hold on
plot(pco_corr_spline(1:5:end),'-+','color','g')
ylabel('$AOC[ m]$','Interpreter','latex');
legend('GFO','Calculate','Calculate&Tshift')
title ({[rls, '  20',year,' ',ds]});
xlim([0 1000]);
%
subplot(3,1,2)
plot(pco_corr(1:5:end)-gfo_pco_corr,'-+','color','m')
ylabel('$AOC[ m]$','Interpreter','latex');
legend('Calculate-GFO')
title ({[rls, '  20',year,' ',ds]});
xlim([0 1000]);
%
subplot(3,1,3)
plot(pco_corr(1:5:end)-gfo_pco_corr,'-+','color','m')
ylabel('$AOC[ m]$','Interpreter','latex');
legend('Calculate-GFO')
title ({[rls, '  20',year,' ',ds]});
xlim([0 1000]);
%
figure
plot(gfo_d_pco_corr,'-+','color','r')
hold on 
plot(d_pco_corr(1:5:end),'-+','color','b')
plot(d_pco_corr_spline(1:5:end),'-+','color','g')
ylabel('$\dot{AOC}[m/s]$','Interpreter','latex');
title ({[rls, '  20',year,' ',ds]});
legend('GFO','Calculate','Calculate&Tshift')%'MATLAB'
xlim([0 100])


figure
plot(d_pco_corr(1:5:end)-gfo_d_pco_corr,'-+','color','m')
ylabel('$AORC[m/s]$','Interpreter','latex');
legend('Calculate-GFO')
title ({[rls, '  20',year,' ',ds]});
xlim([0 1000]);
%% time shift of quaternions with slerp
% interval_f=.5* ones(L-1,1);
% %
% q_A_normal = quatnormalize(q_A_noisy);
% q_A_inter = quatinterp(q_A_normal(1:end-1,:),q_A_normal(2:end,:),interval_f);
% %
% q_B_normal = quatnormalize(q_B_noisy);
% q_B_inter = quatinterp(q_B_normal(1:end-1,:),q_B_normal(2:end,:),interval_f);
% %
% R_A_inter = RotmatICRF2SF(q_A_inter);
% R_B_inter = RotmatICRF2SF(q_B_inter);
% %
% pc_A_eci_inter = threeDmulti_rot(R_A_inter,repmat(pc_A_guess,L-1,1),'backward');
% pc_B_eci_inter = threeDmulti_rot(R_B_inter,repmat(pc_B_guess,L-1,1),'backward');
% %
% pco_corr_inter = -dot(e_x(1:end-1,:),pc_B_eci_inter,2) + dot(e_x(1:end-1,:),pc_A_eci_inter,2); % correction term: opposite sign
% d_pco_corr_inter = NumDiff(pco_corr_inter,1);

















