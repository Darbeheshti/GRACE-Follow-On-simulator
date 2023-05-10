% This script makes ACC1B files(*.asc).
% 
% writtten by Neda Darbehesti 
% last update 14 March 2017
% adjusted for version 2, Henry Wegener, 30 October 2018

% ACC1B format: [GPS_time, GRACE_id, lin_accl_x, lin_accl_y, lin_accl_z, ang_accl_x, ang_accl_y, ang_accl_z,
%                                    acl_x_res,  acl_y_res,  acl_z_res, quality_flag]

cd output
cd ACC

for d = 1:31
    
    ds = sprintf('%02d',d);
    
    for str = {'A','B'}
        
        gt = cell2mat(str);
        filename = strcat('ACC1B_2005-05-',ds,'_',gt,'_MDC-',version,'.asc');
        fid = fopen(filename,'wt');
        
        fprintf(fid, 'PRODUCER AGENCY               : N/A\n');
        fprintf(fid, 'PRODUCER INSTITUTION          : Albert Einstein Institute and Institute of Geodesy, Hannover\n');
        fprintf(fid, 'FILE TYPE ipACC1BF            : 8\n');
        fprintf(fid, 'FILE FORMAT 0=BINARY 1=ASCII  : 1\n');
        fprintf(fid, 'NUMBER OF HEADER RECORDS      : 23\n');
        fprintf(fid, 'SOFTWARE VERSION              : AEI ACC1B simulator\n');
        fprintf(fid, 'SOFTWARE LINK TIME            : N/A\n');
        fprintf(fid, 'REFERENCE DOCUMENTATION       : GRACE-FO MDC User Handbook\n');
        fprintf(fid,['SATELLITE NAME                : GRACE ',gt,'\n']);        
        fprintf(fid, 'SENSOR NAME                   : ACC\n');
        fprintf(fid, 'TIME EPOCH (GPS TIME)         : 2000-01-01 12:00:00\n');
        
        fprintf(fid, 'TIME FIRST OBS(SEC PAST EPOCH): ');
        fprintf(fid, '%0.6f', time_stamps((d-1)*17280+1));
        fprintf(fid,[' (2005-05-',ds,' 00:00:00.00)\n']);
        fprintf(fid, 'TIME LAST OBS(SEC PAST EPOCH) : ');
        fprintf(fid, '%0.6f', time_stamps(d*17280));
        fprintf(fid,[' (2005-05-',ds,' 23:59:55.00)\n']);
        
        fprintf(fid, 'NUMBER OF DATA RECORDS        : 17280\n');
        fprintf(fid, 'PRODUCT CREATE START TIME(UTC): N/A\n');
        fprintf(fid, 'PRODUCT CREATE END TIME(UTC)  : N/A\n');
        fprintf(fid, 'FILESIZE (BYTES)              : N/A\n');
        fprintf(fid,['FILENAME                      : ',filename,'\n']);
        fprintf(fid, 'INPUT FILE NAME               : N/A\n');
        fprintf(fid, 'INPUT FILE TIME TAG (UTC)     : N/A\n');
        fprintf(fid, 'INPUT FILE NAME               : N/A\n');
        fprintf(fid, 'INPUT FILE TIME TAG (UTC)     : N/A\n');
        fprintf(fid, 'END OF HEADER\n');
        
        switch gt
            case 'A'
                accl = acc_lin_A;
                acca = acc_ang_A;
                std_acc = std(acc_noise_A);
            case 'B'
                accl = acc_lin_B;
                acca = acc_ang_B;
                std_acc = std(acc_noise_B);
        end
        
        for i = (d-1)*17280+1:d*17280
            fprintf(fid, '%9i', time_stamps(i));
            fprintf(fid, '%2c', gt);
            fprintf(fid, ' %1.15e %1.15e %1.15e', accl(i,:));
            fprintf(fid, ' %1.15e %1.15e %1.15e', acca(i,:));
            fprintf(fid, ' %1.15e %1.15e %1.15e', std_acc);
            fprintf(fid, ' 00000000\n');
        end
        
    end
    
    fclose(fid);
    
end
 
cd ..
cd ..
 
 