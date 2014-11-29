%getfr.m
%compute firing rate from strf and spectrogram of song
% function [fr,sizefr]=getfr(spec,strf,params)

%This file is part of computefr, written by Rajiv Narayan and used with permission.

function [fr,sizefr]=getfr(spec,strf,params)

    dimStrf = size(strf);
    dimSpec = size(spec);
    fSpecRange = dimStrf(1); %number of filter banks (rows)
    
    inputChannels = zeros(fSpecRange,dimStrf(2)+dimSpec(2)-1);
  %==========================================
  
  %Perform convolution STRF * stimulus
  
    for i = 1:fSpecRange
    	inputChannels(i,:) = conv(strf(i,:),spec(i,:)-mean(spec(i,:)));
    end
    
    %Generate firing rate 
        stimDur = dimStrf(2)+dimSpec(2)-1;
%        fr = zeros(params.firingDuration,1);
        fr=zeros(stimDur,1);
        fr(params.firingOnset:params.firingOnset+stimDur-1) = params.firingRateGain.*sum(inputChannels)';
        fr(find(fr < 0))=0;
%         meanfr = mean(fr(params.firingOnset:params.firingOnset+stimDur-1));
%         disp (meanfr);

% sizefr=[params.firingDuration,1];
sizefr=stimDur;
