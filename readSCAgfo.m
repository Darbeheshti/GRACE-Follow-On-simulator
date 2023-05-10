function SCA1B = readSCAgfo(file)
% Input: ascii file containing GRACE SCA1B data 
% Output: matrix containing SCA1B data
% 
% cf. GRACE Level 1B Data Product User Handbook
%
% Example: SCA1B = readSCA('SCA1B_2002-12-02_A_02.asc')

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

% Reads the desired values from SCA1B data.
[gps_time, quatangle, quaticoeff, quatjcoeff, quatkcoeff, qual_rss] = textread(file,'%f %*s %*f %f %f %f %f %f %*f','headerlines',header);

% Produces the matrix containing the desired values.
SCA1B = [gps_time, quatangle, quaticoeff, quatjcoeff, quatkcoeff, qual_rss];


end