%GETSTRFPARAMS
% computes STRF parameters
% y = getstrfparams(x,params)
% y - structure containing the strf params:
%       y.cf - peak frequency (kHz)
%       y.tpeak - time to peak (ms)
%       y.ei - Excitation / Inhibition Ratio
%       y.maxval - Excitatory peak value
%       y.maxcoord - indices of maxval
%       y.minval - Inhibitory peak value
%       y.mincoord - indices of minval
%       y.absmaxval - Absolute max value
%       y.absmaxcoord - indices of absmaxval

%This file is part of computefr, written by Rajiv Narayan and used with permission.

function y = getstrfparams(x,params)

%find max across columns
[maxcol, maxind] = max(x); 
%find maximum
[y.maxval, maxt] = max(maxcol);
y.maxcoord = [maxind(maxt), maxt];

%find min value
[mincol, minind] = min(x);
[y.minval, mint] = min(mincol);
y.mincoord = [minind(mint), mint];

%find absolute maximum
[y.absmaxval, i] = max(abs([y.maxval, y.minval]));

switch (i)
    case 1 %then take the slice through maxval
        y.absmaxcoord = [maxind(maxt), maxt];
        y.tpeak = params.strfTScale(maxt); %time to peak in ms
        y.cf = params.strfFScale(maxind(maxt)); %peak frequency (kHz)

    case 2 %then take the slice through minval
        y.absmaxcoord = [minind(mint), mint];
        y.tpeak = params.strfTScale(mint); %time to peak in ms
        y.cf = params.strfFScale(minind(mint)); %peak frequency (kHz)

    otherwise
        disp (mfilename);
        disp('Unable to compute tpeak , cf');
end

%compute E/I Ratio
y.ei = abs(y.maxval) / abs(y.minval);


