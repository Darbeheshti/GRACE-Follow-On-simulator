% This script makes KBR1B yaml files.
% 
% writtten by Neda Darbehesti 
% last update 02/2019


cd output
cd KBR

for d = 1:31
    
    ds = sprintf('%02d',d);
    filename = ['KBR1B_2005-05-',ds,'_Y_',version,'.txt'];
    fid = fopen(filename,'wt');
     
    fprintf(fid,  'header:\n');
    fprintf(fid, 'dimensions:\n');
    fprintf(fid,  'num_records: 17281\n');
    fprintf(fid, 'global_attributes:\n');
    fprintf(fid, 'acknowledgement: GRACE-FO is a joint mission of the US National Aeronautics and Space Administration and the German Research Center for Geosciences.  Use the digital object identifier provided in the id attribute when citing this data.  See https://podaac.jpl.nasa.gov/CitingPODAAC\n');
    fprintf(fid, 'conventions: CF-1.6, ACDD-1.3, ISO 8601\n');
    fprintf(fid, 'creator_email: gracefo@podaac.jpl.nasa.gov\n');
    fprintf(fid, 'creator_institution: NASA/JPL\n');
    fprintf(fid, 'creator_name: GRACE Follow-On Science Data System\n');
    fprintf(fid, 'creator_type: group\n');
    fprintf(fid, 'creator_url: http://gracefo.jpl.nasa.gov\n');
    fprintf(fid, 'date_created: 2019-01-31 13:14:05\n');
    fprintf(fid, 'date_issued: 2019-01-31 16:28:53\n');
    fprintf(fid, ' history:\n');
    fprintf(fid, ' - "INPUT FILE NAME               : KBR1A_C_0<-KBR1A_2019-01-30_C_00.dat"\n');
    fprintf(fid, ' - "INPUT FILE CREATION TIME (UTC): KBR1A_C_0<-2019-01-31 02:54:17 by operator"\n');
    fprintf(fid, '- "INPUT FILE NAME               : KBR1A_D_0<-KBR1A_2019-01-30_D_00.dat"\n');
    fprintf(fid, ' - "INPUT FILE CREATION TIME (UTC): KBR1A_D_0<-2019-01-31 01:38:14 by operator"\n');
    fprintf(fid, '- "INPUT FILE NAME               : KBR1A_C_1<-KBR1B_2019-01-30_C_00.dat"\n');
    fprintf(fid, '- "INPUT FILE CREATION TIME (UTC): KBR1A_C_1<-2019-01-31 02:55:01 by operator"\n');
    fprintf(fid, ' - "INPUT FILE SOFTWARE VERSION   : KBR1A_C_1<-"\n');
    fprintf(fid, ' - "INPUT FILE NAME               : KBR1A_D_1<-KBR1B_2019-01-30_D_00.dat"\n');
    fprintf(fid, ' - "INPUT FILE CREATION TIME (UTC): KBR1A_D_1<-2019-01-31 01:39:56 by operator"\n');
    fprintf(fid, ' - "INPUT FILE SOFTWARE VERSION   : KBR1A_D_1<-"\n');
    fprintf(fid, ' - "INPUT FILE NAME               : KBR1A_C_2<-KBR1B_2019-01-30_C_00.dat.ord"\n');
    fprintf(fid, '  - "INPUT FILE CREATION TIME (UTC): KBR1A_C_2<-2019-01-31 12:15:31 by operator"\n');
    fprintf(fid, ' - "INPUT FILE SOFTWARE VERSION   : KBR1A_C_2<-"\n');
    fprintf(fid, '- "INPUT FILE NAME               : KBR1A_D_2<-KBR1B_2019-01-30_D_00.dat.ord"\n');
     fprintf(fid, ' - "INPUT FILE CREATION TIME (UTC): KBR1A_D_2<-2019-01-31 12:15:33 by operator"\n');
     fprintf(fid, ' - "INPUT FILE SOFTWARE VERSION   : KBR1A_D_2<-"\n');
     fprintf(fid, ' - "INPUT FILE NAME               : PCI1A_C<-PCI1A_2019-01-30_C_00.dat"\n');
     fprintf(fid, ' - "INPUT FILE CREATION TIME (UTC): PCI1A_C<-2019-01-31 12:50:35 by operator"\n');
     fprintf(fid, ' - "INPUT FILE NAME               : PCI1A_D<-PCI1A_2019-01-30_D_00.dat"\n');
     fprintf(fid, ' - "INPUT FILE CREATION TIME (UTC): PCI1A_D<-2019-01-31 13:05:36 by operator"\n');
     fprintf(fid, ' - "INPUT FILE NAME               : USO1B_C<-USO1B_2019-01-30_C_00.dat"\n');
     fprintf(fid, ' - "INPUT FILE CREATION TIME (UTC): USO1B_C<-2019-01-31 12:15:33 by operator"\n');
     fprintf(fid, ' - "INPUT FILE NAME               : USO1B_D<-USO1B_2019-01-30_D_00.dat"\n');
     fprintf(fid, ' - "INPUT FILE CREATION TIME (UTC): USO1B_D<-2019-01-31 12:15:33 by operator"\n');
     fprintf(fid, 'id: 10.5067/GFJPL-L1B00\n');
     fprintf(fid, 'institution: NASA/JPL\n');
     fprintf(fid, 'instrument: KBR\n');
     fprintf(fid, 'instrument_vocabulary: NASA Global Change Master Directory instrument keywords\n');
     fprintf(fid, ' keywords: GRACE-FO, KBR\n');
     fprintf(fid, ' keywords_vocabulary: NASA Global Change Master Directory (GCMD) Science Keywords\n');
    fprintf(fid, 'license: https://science.nasa.gov/earth-science/earth-science-data/data-information-policy\n');
    fprintf(fid, 'naming_authority: org.doi.dx\n');
    fprintf(fid, 'platform: GRACE C+D\n');
   fprintf(fid, ' platform_vocabulary: NASA Global Change Master Directory platform keywords\n');
    fprintf(fid, 'processing_level: 1B\n');
   fprintf(fid, ' product_version: 00\n');
    fprintf(fid, 'program: NASA Earth Systematic Missions Program\n');
   fprintf(fid, ' project: NASA Gravity Recovery And Climate Experiment Follow-On (GRACE-FO)\n');
    fprintf(fid, 'publisher_email: podaac@jpl.nasa.gov\n');
   fprintf(fid, ' publisher_institution: NASA/JPL\n');
   fprintf(fid, ' publisher_name: Physical Oceanography Distributed Active Archive Center\n');
    fprintf(fid, 'publisher_type: group\n');
    fprintf(fid, 'publisher_url: http://podaac.jpl.nasa.gov\n');
    fprintf(fid, 'references: https://podaac.jpl.nasa.gov/gravity/gracefo-documentation\n');
    fprintf(fid, 'source: Inter-satellite range, range rate and range acceleration from KBR between GRACE-FO satellites\n');
   fprintf(fid, ' summary: Biased inter-satellite ranges and their first two time derivatives, range rate and range acceleration\n');
    fprintf(fid, 'time_coverage_start: 2019-01-30 00:00:00.00\n');
    fprintf(fid, 'time_coverage_stop: 2019-01-31 00:00:00.00\n');
    fprintf(fid, 'title: GRACE-FO Level-1B K-Band Ranging Data\n');
    fprintf(fid, 'non-standard_attributes:\n');
       fprintf(fid, 'epoch_time: 2000-01-01T12:00:00.00\n');
       fprintf(fid, ' software_build_time: 2018-11-16_00:01:01_PST\n');
       fprintf(fid, 'software_version: 583d\n');
       fprintf(fid, 'start_time_epoch_secs: 602078400\n');
       fprintf(fid, 'stop_time_epoch_secs: 602164800\n');
       fprintf(fid, 'variables:\n');
       fprintf(fid, '- gps_time:\n');
       fprintf(fid, ' comment: 1st column\n');
       fprintf(fid, ' coverage_content_type: referenceInformation\n');
       fprintf(fid, 'long_name: Continuous seconds past 01-Jan-2000 11:59:47 UTC\n');
       fprintf(fid, ' units: second\n');
       fprintf(fid, ' - biased_range:\n');
       fprintf(fid, 'comment: 2nd column\n');
       fprintf(fid, 'coverage_content_type: physicalMeasurement\n');
       fprintf(fid, ' long_name: CRN-filtered biased inter-satellite range with ionospheric correction\n');
       fprintf(fid, ' units: m\n');
       fprintf(fid, '- range_rate:\n');
       fprintf(fid, ' comment: 3rd column\n');
       fprintf(fid, ' coverage_content_type: modelResult\n');
       fprintf(fid, ' long_name: First time derivative of biased_range\n');
       fprintf(fid, ' units: m/s\n');
       fprintf(fid, ' - range_accl:\n');
       fprintf(fid, ' comment: 4th column\n');
       fprintf(fid, '  coverage_content_type: modelResult\n');
       fprintf(fid, ' long_name: Second time derivative of biased_range\n');
       fprintf(fid, ' units: m/s2\n');
       fprintf(fid, '- iono_corr:\n');
       fprintf(fid, ' comment: 5th column\n');
       fprintf(fid, ' coverage_content_type: modelResult\n');
       fprintf(fid, ' long_name: biased ionospheric correction for biased_range, for Ka frequency\n');
       fprintf(fid, ' - lighttime_corr:\n');
       fprintf(fid, ' comment: 6th column\n');
       fprintf(fid, ' coverage_content_type: modelResult\n');
       fprintf(fid, '  long_name: Light time correction for biased_range\n');
       fprintf(fid, ' units: m\n');
       fprintf(fid, ' - lighttime_rate:\n');
       fprintf(fid, 'comment: 7th column\n');
       fprintf(fid, ' coverage_content_type: modelResult\n');
       fprintf(fid, ' long_name: Light time correction for range_rate\n');
       fprintf(fid, ' units: m/s\n');
       fprintf(fid, '- lighttime_accl:\n');
       fprintf(fid, ' comment: 8th column\n');
       fprintf(fid, ' coverage_content_type: modelResult\n');
       fprintf(fid, ' long_name: Light time correction for range_accl\n');
       fprintf(fid, ' units: m/s2\n');
       fprintf(fid, ' - ant_centr_corr:\n');
       fprintf(fid, ' comment: 9th column\n');
       fprintf(fid, ' coverage_content_type: modelResult\n');
       fprintf(fid, 'long_name: Antenna phase center offset correction for biased_range\n');
       fprintf(fid, 'units: m\n');
       fprintf(fid, ' - ant_centr_rate:\n');
       fprintf(fid, ' comment: 10th column\n');
       fprintf(fid, ' coverage_content_type: modelResult\n');
       fprintf(fid, ' long_name: Antenna phase center offset correction for range_rate\n');
       fprintf(fid, ' units: m/s\n');
       fprintf(fid, '- ant_centr_accl:\n');
        fprintf(fid, ' comment: 11th column\n');
        fprintf(fid, ' coverage_content_type: modelResult\n');
        fprintf(fid, 'long_name: Antenna phase center offset correction for range_accl\n');
        fprintf(fid, 'units: m/s2\n');
       fprintf(fid, ' - K_A_SNR:\n');
       fprintf(fid, ' comment: 12th column\n');
       fprintf(fid, ' coverage_content_type: physicalMeasurement\n');
       fprintf(fid, ' long_name: SNR of K band for GRACE-FO C satellite\n');
       fprintf(fid, ' units: 0.1 db-Hz\n');
        fprintf(fid, '- Ka_A_SNR:\n');
        fprintf(fid, 'comment: 13th column\n');
        fprintf(fid, ' coverage_content_type: physicalMeasurement\n');
        fprintf(fid, 'long_name: SNR of Ka band for GRACE-FO C satellite\n');
        fprintf(fid, 'units: 0.1 db-Hz\n');
        fprintf(fid, ' - K_B_SNR:\n');
        fprintf(fid, ' comment: 14th column\n');
        fprintf(fid, 'coverage_content_type: physicalMeasurement\n');
        fprintf(fid, 'long_name: SNR of K band for GRACE-FO D satellite\n');
        fprintf(fid, ' units: 0.1 db-Hz\n');
        fprintf(fid, '- Ka_B_SNR:\n');
        fprintf(fid, 'comment: 15th column\n');
       fprintf(fid, ' coverage_content_type: physicalMeasurement\n');
       fprintf(fid, ' long_name: SNR of Ka band for GRACE-FO D satellite\n');
       fprintf(fid, ' units: 0.1 db-Hz\n');
       fprintf(fid, '- qualflg:\n');
       fprintf(fid, ' comment: 16th column\n');
       fprintf(fid, ' coverage_content_type: qualityInformation\n');
       fprintf(fid, '  flag_masks: 1b, 2b, 4b, 8b, 16b, 32b, 64b, 128b\n');
       fprintf(fid, ' flag_meanings:\n');
         fprintf(fid, '- bit 0 = Phase break\n');
         fprintf(fid, ' - bit 1 = unreliable PCI1A data for ant_centr_corr\n');
         fprintf(fid, ' - bit 2 = interpolated PCI1A data for ant_centr_corr\n');
         fprintf(fid, ' - bits 3-4 = Not defined\n');
         fprintf(fid, ' - bit 5 = data corrected for time tag bias in either K or Ka phase\n');
         fprintf(fid, ' - bit 6 = Interpolated data point (due to gap) exists > 5 s from center of CRN filter window\n');
         fprintf(fid, ' - bit 7 = Interpolated data point (due to gap) exists <= 5 s from center of CRN filter window\n');
         fprintf(fid, ' long_name: Quality flags, rightmost is bit 0\n');
         fprintf(fid, '# End of YAML header\n');
    
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

