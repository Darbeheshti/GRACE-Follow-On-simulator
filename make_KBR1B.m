% This script makes KBR1B files.
% 
% writtten by Neda Darbehesti 
% last update 12 April 2017
% adjusted for version 2, Henry Wegener, 30 October 2018

cd output
cd KBR

for d = 1:31
    
    ds = sprintf('%02d',d);
    filename = ['KBR1B_2005-05-',ds,'_X_MDC-',version,'.asc'];
    fid = fopen(filename,'wt');
    
    fprintf(fid, 'PRODUCER AGENCY               : N/A\n');                                          
    fprintf(fid, 'PRODUCER INSTITUTION          : Albert Einstein Institute and Institute of Geodesy, Hannover\n');
    fprintf(fid, 'FILE TYPE ipKBR1BF            : 7\n');
    fprintf(fid, 'FILE FORMAT 0=BINARY 1=ASCII  : 1\n');
    fprintf(fid, 'NUMBER OF HEADER RECORDS      : 23\n');
    fprintf(fid, 'SOFTWARE VERSION              : IfE Orbit Simulator\n'); 
    fprintf(fid, 'SOFTWARE LINK TIME            : N/A\n');      
    fprintf(fid, 'REFERENCE DOCUMENTATION       : GRACE MDC user handbook\n');
    fprintf(fid, 'SATELLITE NAME                : GRACE A+B\n');
    fprintf(fid, 'SENSOR NAME                   : N/A\n');
    fprintf(fid, 'TIME EPOCH (GPS TIME)         : 2000-01-01 12:00:00\n');
    fprintf(fid, 'TIME LAST OBS(SEC PAST EPOCH) : ');
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
    
    for i = (d-1)*17280+1:d*17280
        fprintf(fid, '%9i', time_stamps(i));
        fprintf(fid, ' %6.18f', range_KBR(i));
        fprintf(fid, ' %1.20f', rangerate_KBR(i));
        fprintf(fid, ' %1.20e', rangeacc_KBR(i));
        
        fprintf(fid, ' 0');
        fprintf(fid, ' 0');
        fprintf(fid, ' 0');
        fprintf(fid, ' 0');
        
        fprintf(fid, ' %1.15f', pco_corr(i));
        fprintf(fid, ' %1.15e', d_pco_corr(i));
        fprintf(fid, ' %1.15e', dd_pco_corr(i));
        
        fprintf(fid, ' 700');
        fprintf(fid, ' 700');
        fprintf(fid, ' 700');
        fprintf(fid, ' 700');
        
        fprintf(fid, ' 00000000\n');
    end
    
    fclose(fid);
    
end

cd ..
cd ..

