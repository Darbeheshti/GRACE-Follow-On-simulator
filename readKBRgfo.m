function KBR1B = readKBRgfo(file)

% Read GRACE KBR1B data
% cf. GRACE Level 1B Data Product User Handbook
% 
% Input:    file = file/path string to ascii file containing GRACE KBR1B data 
% 
% Output:   KBR1B = matrix containing GNV1B data
%
% Example: KBR1B = readACC('KBR1B_2002-12-02_A_02.asc')
%

%%

% Counts header lines and removes them.
header=0;
fid = fopen(file);
  while 1
      line = fgetl(fid);
      header = header+1;
      if (~isempty(strfind(line,'# End of YAML header')))
           break
      end
  end

% Reads the desired values from KBR1B data.
[gps_time, range, range_rate, range_acc,iono_corr, lighttime_corr, lighttime_rate, lighttime_accl, ant_centr_corr, ant_centr_rate, ant_centr_accl] = textread(file,'%f %f %f %f %f %f %f %f %f %f %f %*f %*f %*f %*f %*f','headerlines',header);

% Produces the matrix containing the desired values.
KBR1B = [gps_time, range, range_rate, range_acc,iono_corr, lighttime_corr, lighttime_rate, lighttime_accl, ant_centr_corr, ant_centr_rate, ant_centr_accl];

end