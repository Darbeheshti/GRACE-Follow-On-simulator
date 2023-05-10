% A script for converting rpy (pure -and- SCA) to quaternions (pure -and- SCA)
% Also produces "noisy" quaternions (with SCA noise but without bias) for AOC computation
% Henry Wegener, AEI Hannover, 2018-10-22

% computation:
% R1 = R_SF2LOSF
%    = R_ICRF2LOSF * R_SF2ICRF
% R2 = R_ICRF2LOSF
%
% R = R_SF2ICRF
%   = R_LOSF2ICRF * R_SF2LOSF
%   = R2^T * R1

for i = 1:6
    
    switch i
        case 1
            rpy = rpy_A_pure;
            R2 = RotmatICRF2LOSF(pos_A_eci,pos_B_eci,'A');
        case 2
            rpy = rpy_B_pure;
            R2 = RotmatICRF2LOSF(pos_A_eci,pos_B_eci,'B');
        case 3
            rpy = rpy_A_sca;
            R2 = RotmatICRF2LOSF(pos_A_eci,pos_B_eci,'A');
        case 4
            rpy = rpy_B_sca;
            R2 = RotmatICRF2LOSF(pos_A_eci,pos_B_eci,'B');
        case 5
            rpy = rpy_A_sca - mean(rpy_A_sca);
            R2 = RotmatICRF2LOSF(pos_A_eci,pos_B_eci,'A');
        case 6
            rpy = rpy_B_sca - mean(rpy_B_sca);
            R2 = RotmatICRF2LOSF(pos_A_eci,pos_B_eci,'B');
    end
    
    R1 = Euler2Rot(rpy);
    R = zeros(3,3,L);
    for j = 1:L
        R(:,:,j) = R2(:,:,j)' * R1(:,:,j);
    end
    q = Rot2Quat(R);
    
    switch i
        case 1
            q_A_pure = q;
        case 2
            q_B_pure = q;
        case 3
            q_A_sca = q;
        case 4
            q_B_sca = q;
        case 5
            q_A_noisy = q;
        case 6
            q_B_noisy = q;
    end
    
end

