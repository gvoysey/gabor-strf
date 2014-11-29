%getsongspec.m
%[tSpec,fSpec,spec]=getsongspec(stim,params)
%tspec  time vector
%fSpec  freq vector
%spec   spectrogram
%stim   song vector
%params Structure containing global parameters (see Setparams.m)
%Compute spectrogram of stimulus

%Changes
%Fixed Freqency scaling variable, Changed 7/24/2003, RN
%Lower limit of frequency included while cropping the strf, 3/28/2006, RN 

%This file is part of computefr, written by Rajiv Narayan and used with permission.

function [tSpec,fSpec,spec]=getsongspec(stim,params)
    SAMP_RATE=params.songSampRate;
    window = params.specWindow;
    nfft = params.specFftN;
    noverlap = params.specNumOverlap;
    [b,fSpecOrig,tSpecOrig] = specgram(stim,nfft,SAMP_RATE,window,noverlap);
    b=b+(b==0)*eps; %to avoid dbz , 7/1/2003 RN
    bdB = 20*log10(abs(b));

    %keep frequency channels between 250 Hz to  8 KHz
    fSpecInd = find((fSpecOrig<=params.specBandwidth(2))&(fSpecOrig>=params.specBandwidth(1)));
    fMinInd = min(fSpecInd);
    fMaxInd = max(fSpecInd);
    fSpec = fSpecOrig(fMinInd:fMaxInd);
    specOrig = (bdB(fMinInd:fMaxInd,:));
    
    %perform upsampling by 2
    tSpec = interp(tSpecOrig,2);

    spec = zeros(length(fSpec),length(tSpec));

    for fInd = 1:length(fSpec)
    	spec(fInd,:) = interp(specOrig(fInd,:),2);
    end

