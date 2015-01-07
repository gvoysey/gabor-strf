%GETSTRF.M - Read strf file
%[STRF] = getstrf(strffile)
%Returns the strffile as a vector(SONG),
% returns [] if file not found

%This file is part of computefr, written by Rajiv Narayan and used with permission.

function [STRF] = getstrf(strffile)

if (nargin<1)
    s=sprintf('insufficient arguments to %s',mfilename('fullpath'))
    error(s)
end

DISPERR=1; %display error message

if (exist(strffile,'file'))
    
        STRF=load(strffile,'ascii');  

        %Crop STRF from 0 to 100 ms
%      	STRF = STRF(:,200:299);    

else %we couldnt find the file
        STRF=[];
        
        if (DISPERR)
            s=sprintf('File %s not found',strffile);
            disp(s)
        end
end