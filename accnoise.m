function ACCN = accnoise(lag,tmlength)
% This function generates an ACC noise time series like Kim p.174
% Accelerometer less sensitive axis is YSF
% writtten by Neda Darbehesti 
% last update 12 April 2017
% input:  
%   lag:      in seconds, time step
%   tmlength: length of time series
% output: time seri of LF noise with the same length
%         plot of noise in frequency domain
%% Example 
% Call the function like this
% accn=accnoise(5,24*3600*30/5); generates noise time series for 1 month with 5 seconds step 


 
fmod =  ao(plist('fsfcn','(1+(0.005./f)).*1e-20','f1',1e-5,'f2',1e-1, 'yunits', 'm^2/s^4/Hz','name','ACC_noise'));
fmodw = ao(plist('fsfcn','(1+(0.1./f)).*1e-18','f1',1e-5,'f2',1e-1, 'yunits', 'm^2/s^4/Hz','name','ACC_less_sensitive axis'));
% generating three white noise time series
awx = ao(plist('tsfcn', 'randn(size(t))', 'fs', 1/lag, 'nsecs', tmlength*lag, 'yunits', 'm/s^2','name','white noise'));
awy = ao(plist('tsfcn', 'randn(size(t))', 'fs', 1/lag, 'nsecs', tmlength*lag, 'yunits', 'm/s^2','name','white noise'));
awz = ao(plist('tsfcn', 'randn(size(t))', 'fs', 1/lag, 'nsecs', tmlength*lag, 'yunits', 'm/s^2','name','white noise'));


plng = plist(...
          'model', fmod, ...      % model for colored noise psd
          'MaxIter', 50, ...      % maximum number of fit iteration per model order
          'PoleType', 2, ...      % generates complex poles distributed in the unitary circle
          'MinOrder', 2, ...      % minimum model order
          'MaxOrder', 10, ...     % maximum model order
          'Weights', 2, ...       % weight with 1/abs(model)
          'Plot', false, ...      % on to show the plot
          'Disp', false);         % on to display fit progress on the command window
      
plngw = plist(...
          'model', fmodw, ...      % model for colored noise psd
          'MaxIter', 50, ...      % maximum number of fit iteration per model order
          'PoleType', 2, ...      % generates complex poles distributed in the unitary circle
          'MinOrder', 2, ...      % minimum model order
          'MaxOrder', 10, ...     % maximum model order
          'Weights', 2, ...       % weight with 1/abs(model)
          'Plot', false, ...      % on to show the plot
          'Disp', false);         % on to display fit progress on the command window

      

acx = noisegen1D(awx, plng);
acy = noisegen1D(awy, plngw);
acz = noisegen1D(awz, plng);

ACCx=acx.y;
ACCy=acy.y;
ACCz=acz.y;

ACCN=[ACCx ACCy ACCz];

%plotting
%frequency domain
% pl2 = plist('Linecolors', {'b', 'g'}, 'LineWidths', {4, 4},'XRANGES',{[10^(-4) 10^(-1)],[10^(-4) 10^(-1)]},'SHOW PROVENANCE',0);
% iplot(sqrt(fmod),sqrt(fmodw),pl2)




