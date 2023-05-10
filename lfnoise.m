function LFN = lfnoise(lag,tmlength)
% This function generates a laser frequency noise time series 
% writtten by Neda Darbehesti 
% last update 17 March 2017
% input:  
%   lag:      in seconds, time step
%   tmlength: length of time series
% output: time seri of LF noise with the same length
%         plot of noise in frequency domain
%% Example 
% Call the function like this
% lfn=lfnoise(5,24*3600*30/5); generates noise time series for 1 month with 5 seconds step 

fmodf = ao(plist('fsfcn','(5*1E-10/0.1*sqrt(1+(0.1*f.^(-0.575)).^2)).^2','f1',1e-5,'f2',1e-1, 'yunits', 'm^2/Hz','name','Laser frequency noise'));

a = ao(plist('tsfcn', 'randn(size(t))', 'fs', 1/lag, 'nsecs', tmlength*lag, 'yunits', 'm','name','white noise'));

plng = plist(...
          'model', fmodf, ...      % model for colored noise psd
          'MaxIter', 50, ...      % maximum number of fit iteration per model order
          'PoleType', 2, ...      % generates complex poles distributed in the unitary circle
          'MinOrder', 2, ...      % minimum model order
          'MaxOrder', 10, ...     % maximum model order
          'Weights', 2, ...       % weight with 1/abs(model)
          'Plot', false, ...      % on to show the plot
          'Disp', false);         % on to display fit progress on the command window

ac = noisegen1D(a, plng);

LFN = ac.y;

% save('ao_lfn.mat','fmodf')



