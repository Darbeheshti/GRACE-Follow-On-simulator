function GNV1B = readGNI4gfo(file)
% Input: ascii file containing GRACE GNV1B data 
% Output: matrix containing GNV1B data
% 
% cf. GRACE Level 1B Data Product User Handbook
%
% Example: GNV1B = readGNV('GNV1B_2002-12-02_A_02.asc')

% Counts header lines and removes them.
header=0;
fid = fopen(file);
  while 1
      line = fgetl(fid);
      header = header+1;
      if (~isempty(strfind(line,'End of YAML header')))
           break
      end
  end
  
% Reads the desired values from GNV1B data.
[gps_time, xpos, ypos, zpos, xvel, yvel, zvel] = textread(file,'%f %*s %*s %f %f %f %*f %*f %*f %f %f %f %*f %*f %*f %*f ','headerlines',header);

% Produces the matrix containing the desired values.
GNV1B = [gps_time, xpos, ypos, zpos, xvel, yvel, zvel];

end