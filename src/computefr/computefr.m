%COMPUTEFR computes the firing rate from a strf and a song
%   FR = COMPUTEFR(songname, strfname)
%   Returns the firing rate obtaing from songname and strfname

%This file is part of computefr, written by Rajiv Narayan and used with permission.

function [fr,spec] = computefr(songname,strffull)

%load parameters
        load params;
        
%load songfile
        song=getsong(songname);

%crop region of interest
         strf=strffull(:, params.strfCropRange);
         
%compute spectrogram of song
       [tSpec,fSpec,spec]=getsongspec(song,params);
       
%compute firing rate
        [fr,frlength]=getfr(spec, strf, params);

% %plot song spec
%             figure;
% 			[tScale,fScale,cLims] = getplotsong (spec, tSpec, fSpec, params);
             
% %             %Display spectrogram
% %            imagesc (tScale,fScale,spec,cLims);
%             imagesc(tScale,fScale,spec);
%            axis xy; %set cartesian coord mode
%             xlabel('Time (ms)');
%             ylabel('Freq (kHz)');
       
% %display strf
%     figure;
%             %get plotting params
% %            [cLims]=getplotstrf(strf);
            
%             %plot the strf
% %            imagesc (params.strfTScale, params.strfFScale, strffull, cLims);
%             imagesc (params.strfTScale, params.strfFScale, strffull);
%             axis xy
%             axis(params.strfAxesParams);
%             xlabel('Time (ms)');
%             ylabel('Freq (kHz)');
            
