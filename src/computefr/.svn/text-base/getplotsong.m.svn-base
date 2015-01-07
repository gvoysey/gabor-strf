%GETPLOTSONG.M
%Returns spectrogram params that can be used with imagesc
%[tScale,fScale,cLims,axisParams] = GETPLOTSONG(spec,tspec,fspec)
% tscale        timescale
% fscale        freq scale
% clims         scale factor for imagesc
% spec          spec data
% tspec         time scale
% fspec          freq scale
% params        Structure containing global variables

%This file is part of computefr, written by Rajiv Narayan and used with permission.

function [tScale,fScale,cLims]=getplotsong(spec,tspec,fspec,params)

		tonset      = params.firingOnset; %start of stimulus (samples)
        maxamp = max(max(spec));
        cLims = [maxamp-75 maxamp];
        tScale=tonset+tspec*1000; %ms
        fScale=fspec/1000;  %khz

