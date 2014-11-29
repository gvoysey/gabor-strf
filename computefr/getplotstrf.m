%GETPLOTSTRF.M
%Returns color scale range for strf that can be plotted using imagesc
%[cLims] = GETPLOTSTRF(STRF)
% clims         scale factor for imagesc
% STRF      STRF data

%This file is part of computefr, written by Rajiv Narayan and used with permission.

function [cLims]=getplotstrf(strf)

    %compute range to scale the strf for display using imagesc
    maxForward = max(max(strf));
    minForward = min(min(strf));
    absForward = max(abs(maxForward),abs(minForward));
    cLims=[-absForward absForward];

