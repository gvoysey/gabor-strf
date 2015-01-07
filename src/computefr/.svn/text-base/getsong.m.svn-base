%GETSONG.M - Read song file
%[SONG] = getsong(songfile)
%Returns the songfile as a vector(SONG),
% returns [] if file not found

%This file is part of computefr, written by Rajiv Narayan and used with permission.

function [SONG,SONGLEN] = getsong(songfile)

if (nargin<1)
    s=sprintf('insufficient arguments to %s',mfilename('fullpath'))
    error(s)
end

DISPERR=1; %display error message

if (exist(songfile,'file'))
    
        SONG=load(songfile);  
        SONGLEN=length(SONG);
        
else %we couldnt find the file
        SONG=[];
        
        if (DISPERR)
            s=sprintf('File %s not found',songfile);
            disp(s)
        end
end
