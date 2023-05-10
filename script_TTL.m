% A script for producing TTL errors and correction terms for KBR and LRI
% 
% error_pco = KBR range error from phase center offset (pco)
% pco_corr = correction term for error_apc ("antenna offset correction")
% error_vpo = LRI range error from vertex point offset (vpo)
% vpo_corr = correction term for error_vpo
% 
% Henry Wegener, AEI Hannover, 2018-10-22

% computation of ranging error (dL):
% dL = -(e_x)^T * R_SF2ICRF * vpo
% (computed for each SC and summed up)
% with vpo being the vertex point (VP) offset (= VP position in [SF])
% and e_x being the line-of-sight vector,
% for satellite A: e_x = (pos_B - pos_A)/norm(pos_A - pos_B)
% for satellite B: e_x = (pos_A - pos_B)/norm(pos_A - pos_B)


% % % true and guessed positions of pc and vp
pc_A = [1.4451172588, -0.0004233040, 0.0022786600]; % antenna phase center [SF]
pc_B = [1.4443870350,  0.0005761203, 0.0033040887];
vp_A = 1E-6*[10, 100, -200]; % TMA vertex point [SF]
vp_B = 1E-6*[-5, -80, -130];
pc_A_guess = pc_A + 1E-3*[0.9, 1.2, -0.8]; % guessed phase center (pc) position [SF]
pc_B_guess = pc_B + 1E-3*[1.0, -0.9, 0.4];
vp_A_guess = vp_A + 1E-6*[2, 15, -20]; % guessed vertex point (vp) position [SF]
vp_B_guess = vp_B + 1E-6*[5, -12, 22];


% % % errors
e_x = (pos_B_eci - pos_A_eci)./range; % line-of-sight unit vector
R_A = RotmatICRF2SF(q_A_pure);
R_B = RotmatICRF2SF(q_B_pure);
% rotate the pc from SF to ICRF (= eci)
pc_A_eci = threeDmulti_rot(R_A,repmat(pc_A,L,1),'backward');
pc_B_eci = threeDmulti_rot(R_B,repmat(pc_B,L,1),'backward');
error_pco = dot(e_x,pc_B_eci,2) - dot(e_x,pc_A_eci,2);
% rotate the vp from SF to ICRF (= eci)
vp_A_eci = threeDmulti_rot(R_A,repmat(vp_A,L,1),'backward');
vp_B_eci = threeDmulti_rot(R_B,repmat(vp_B,L,1),'backward');
error_vpo = dot(e_x,vp_B_eci,2) - dot(e_x,vp_A_eci,2);


% % % correction terms (same as errors but with guessed pc/vp positions and with noisy quaternions)
R_A_noisy = RotmatICRF2SF(q_A_noisy);
R_B_noisy = RotmatICRF2SF(q_B_noisy);

pc_A_eci_guess = threeDmulti_rot(R_A_noisy,repmat(pc_A_guess,L,1),'backward');
pc_B_eci_guess = threeDmulti_rot(R_B_noisy,repmat(pc_B_guess,L,1),'backward');
pco_corr = -dot(e_x,pc_B_eci_guess,2) + dot(e_x,pc_A_eci_guess,2); % correction term: opposite sign

vp_A_eci_guess = threeDmulti_rot(R_A_noisy,repmat(vp_A_guess,L,1),'backward');
vp_B_eci_guess = threeDmulti_rot(R_B_noisy,repmat(vp_B_guess,L,1),'backward');
vpo_corr = -dot(e_x,vp_B_eci_guess,2) + dot(e_x,vp_A_eci_guess,2); % correction term: opposite sign

d_pco_corr = NumDiff(pco_corr,5);
dd_pco_corr = NumDiff2(pco_corr,5);
d_vpo_corr = NumDiff(vpo_corr,5);
dd_vpo_corr = NumDiff2(vpo_corr,5);

