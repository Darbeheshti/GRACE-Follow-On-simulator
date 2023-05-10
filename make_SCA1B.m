% This script makes SCA1B files(*.asc).
% 
% writtten by Neda Darbehesti 
% last update 14 March 2017
% adjusted for version 2, Henry Wegener, 30 October 2018

% SCA1B format: [GPS_time, GRACE_id, sca_id, q0, q1, q2, q3, rss_error, quality_flag]
rss_error = 1e-5;% rss guess of quternions from GRACE star camera data

cd output
cd SCA

for d = 1:31
    
    ds = sprintf('%02d',d);
      
    for str = {'A','B'}
        
        gt = cell2mat(str);
        filename = ['SCA1B_2005-05-',ds,'_',gt,'_MDC-',version,'.asc'];
        fid = fopen(filename,'wt');
        
        fprintf(fid, 'PRODUCER AGENCY               : N/A\n');
        fprintf(fid, 'PRODUCER INSTITUTION          : Albert Einstein Institute and Institute of Geodesy, Hannover\n');
        fprintf(fid, 'FILE TYPE ipSCA1BF            : 6\n');
        fprintf(fid, 'FILE FORMAT 0=BINARY 1=ASCII  : 1\n');
        fprintf(fid, 'NUMBER OF HEADER RECORDS      : 23\n');
        fprintf(fid, 'SOFTWARE VERSION              : AEI SCA1B simulator\n');
        fprintf(fid, 'SOFTWARE LINK TIME            : N/A\n');
        fprintf(fid, 'REFERENCE DOCUMENTATION       : GRACE-FO MDC User Handbook\n');
        fprintf(fid,['SATELLITE NAME                : GRACE ',gt,'\n']);
        fprintf(fid, 'SENSOR NAME                   : IPU 4\n');
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
                q = q_A_sca;
            case 'B'
                q = q_B_sca;
        end
        
        for i = (d-1)*17280+1:d*17280
            fprintf(fid, '%9i', time_stamps(i));
            fprintf(fid, '%2c', gt);
            fprintf(fid, '%2c', '4');
            fprintf(fid, ' %1.15f %1.15f %1.15f %1.15f', q(i,:));
            fprintf(fid, ' %1.15e', rss_error);
            fprintf(fid, ' 00000000\n');
        end
        
    end
    
    fclose(fid);
    
end

cd ..
cd ..

