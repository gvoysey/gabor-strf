% PLOT_STRF_MODELS : Plots appropriately-windowed STRF models and
%                    experimental STRFs.  Saves them as 300dpi PNG files.

% Graham Voysey
% Senior Project 2005-2006

% Boston University, College of Engineering, Department of Biomedical
% Engineering 
% Natural Sounds and Neural Coding Lab 
% gvoysey at bu dot edu

% This file is part of gabor_strf.
% 
% gabor_strf is free software; you can redistribute it and/or modify it under
% the terms of the GNU General Public License as published by the Free Software
% Foundation; either version 2 of the License, or (at your option) any later
% version.
% 
% gabor_strf is distributed in the hope that it will be useful, but WITHOUT ANY
% WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
% A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License along with
% gabor_strf; if not, write to the Free Software Foundation, Inc., 51 Franklin
% St, Fifth Floor, Boston, MA 02110-1301 USA 

setparams;
load params;
a=dir('./*.mat'); %todo: this path should depend on user input.
b={a.name};
b=b';
for i=1:length(b),
load(b{i});

h=figure; imagesc(params.strfTScale, params.strfFScale,modelplot);
axis xy;
axis(params.strfAxesParams);
xlabel('Time (ms)');
ylabel('Freq (kHz)');
title(strcat(b{i},'-model'));
print(h,'-dpng','-r300',strcat(b{i},'-model.png'));

j=figure;imagesc(params.strfTScale, params.strfFScale,actualplot);
axis xy;
axis(params.strfAxesParams);
xlabel('Time (ms)');
ylabel('Freq (kHz)');
title(strcat(b{i},'-actual'));
print(j,'-dpng','-r300',strcat(b{i},'-actual.png'));
end