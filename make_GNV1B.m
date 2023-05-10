% This script makes GNV1B files(*.asc).
% 
% writtten by Neda Darbehesti 
% last update 12 April 2017
% adjusted for version 2, Henry Wegener, 30 October 2018

cd output
cd GNV

for d = 1:31
    
    ds = sprintf('%02d',d);
    
    for str = {'A','B'}
        
        gt = cell2mat(str);
        filename = ['GNV1B_2005-05-',ds,'_',gt,'_MDC-',version,'.asc'];
        fid = fopen(filename,'wt');
        
        fprintf(fid, 'PRODUCER AGENCY               : N/A\n');
        fprintf(fid, 'PRODUCER INSTITUTION          : Albert Einstein Institute and Institute of Geodesy, Hannover\n');
        fprintf(fid, 'FILE TYPE ipGNV1BF            : 5\n');
        fprintf(fid, 'FILE FORMAT 0=BINARY 1=ASCII  : 1\n');
        fprintf(fid, 'NUMBER OF HEADER RECORDS      : 23\n');
        fprintf(fid, 'SOFTWARE VERSION              : IfE Orbit Simulator\n');
        fprintf(fid, 'SOFTWARE LINK TIME            : N/A\n');
        fprintf(fid, 'REFERENCE DOCUMENTATION       : GRACE MDC user handbook\n');
        fprintf(fid,['SATELLITE NAME                : GRACE ',gt,'\n']);
        fprintf(fid, 'SENSOR NAME                   : GNV\n');
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
        
        switch gt
            case 'A'
                pos = pos_A_GNV;
                vel = vel_A_GNV;
                std_pos = std_pos_A;
                std_vel = std_vel_A;
            case 'B'
                pos = pos_B_GNV;
                vel = vel_B_GNV;
                std_pos = std_pos_B;
                std_vel = std_vel_B;
        end
        
        for i = (d-1)*17280+1:d*17280
            fprintf(fid, '%9i', time_stamps(i));
            fprintf(fid, '%2c', gt);
            fprintf(fid, '%2c', 'E');
            fprintf(fid, ' %7.9f %7.9f %7.9f', pos(i,:));
            fprintf(fid, ' %1.15e %1.15e %1.15e', std_pos);
            fprintf(fid, ' %4.12f %4.12f %4.12f', vel(i,:));
            fprintf(fid, ' %1.15e %1.15e %1.15e', std_vel);
            fprintf(fid, ' 00000000\n');
        end
        
%         fprintf(fileID,'%9i %c %c %17.8f %17.8f %17.8f %18.17f %18.17f %18.17f %18.11f %18.11f %18.11f %15.14e %15.14e %15.14e %0.8i\n',GNV(1:16,(day-1)*17280+1:day*17280));
        
        fclose(fid);
        
    end
    
end

cd ..
cd ..

