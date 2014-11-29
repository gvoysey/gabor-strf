% GABOR_STRF_BATCH : Batch modeling and image generation using
% GABOR_STRF-generated data.  
% 

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

a=dir('./*.mat');			% this is getting all modeled STRF
                                        % mat-files from current directory -
                                        % not the best way to do things!

b={a.name};				% further evidence of >=matlab7.1 requirements.
b=b';
srfit=zeros(length(b),1);
trfit=zeros(length(b),1);
srmse=zeros(length(b),1);
trmse=zeros(length(b),1);

for i=1:length(b),
load(b{i});
srfit(i)=freq_si(1);			% takes time, frequency SIs and MSEs
                                        % for first singular values.
trfit(i)=time_si(1);
srmse(i)=freq_mse(1);
trmse(i)=time_mse(1);
end

h=figure;
plot(srfit,'+:','linewidth',2);
xlabel('STRF Index','fontsize',22);
ylabel('Fit Value','fontsize',22);
title('Spectral Similarity Index, Sigma=1, 10 STRFs','fontsize',22);

j=figure;
plot(trfit,'+:','linewidth',2);
xlabel('STRF Index','fontsize',22);
ylabel('Fit Value','fontsize',22);
title('Temporal Similarity Index, Sigma=1, 10 STRFs','fontsize',22);

setparams;
load params;

for i=1:length(b),
load(b{i});

k=figure; imagesc(params.strfTScale, params.strfFScale,modelplot);
axis xy;
axis(params.strfAxesParams);
xlabel('Time (ms)');
ylabel('Freq (kHz)');
title(strcat(b{i},',model'));
print(k,'-dpng','-r300',strcat(b{i},'model'));

l=figure;imagesc(params.strfTScale, params.strfFScale,actualplot);
axis xy;
axis(params.strfAxesParams);
xlabel('Time (ms)');
ylabel('Freq (kHz)');
title(strcat(b{i},',actual'));
print(l,'-dpng','-r300',strcat(b{i},'actual'));
end