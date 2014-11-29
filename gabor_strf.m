% GABOR_STRF : STRF Modeling with Gabor Functions.  
%              GABOR_STRF() begins the process of modeling a STRF with a series
%              of gabor functions.  It will clear all current variables, then
%              ask the user for a data set to load.  The data set should be in
%              the form of Sen, et al's "oldsongs20" set, and contain a matrix
%              STRF_Cell which contains the STRF to be modeled.  Progress from
%              that point is automatic; GABOR_STRF() will output a host of
%              information about the STRF, a model, and a figure containing a
%              plot of the model and a plot of the original for comparison.

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
function [] = gabor_strf(strfdatapath,songdatapath,target_dir) 

% define constants here
parameter_number_srf=5;
parameter_number_trf=5;


% some file stuff is declared here
current_dir=pwd;
path(path,current_dir);
path(path,'./computefr');                 % kind of assumes you're in /path/to/gabor_strf.
[p,f,e]=fileparts(strfdatapath);
outfile = fullfile(target_dir,[f,'-model']);
outfig = fullfile(target_dir,[f,'-modelfig']);
% Step one: user input to decide what STRF to load.
% each matfile contains three matricies.  we only care about STRF_Cell.  the
% other two are matricies of standard deviations
load(strfdatapath);

% SVD and noise determination.
[strfi,trf,srf,sigmas,strfi_total_number,acausal_sigmas] = decomposestrf(STRF_Cell);

% begin modeling section.
% freq_ and time_ coeff have to have hardcoded constants.
 freq_coeff=zeros(parameter_number_srf,strfi_total_number); % num. param. in the freq. eqn is 5
 time_coeff=zeros(parameter_number_trf,strfi_total_number); % num. param. in the time eqn is 5

 freq_resnorm=zeros(1,strfi_total_number); % resnorms are of dimension 1
 time_resnorm=zeros(1,strfi_total_number);
 
 freq_model=zeros(size(srf,1),strfi_total_number); % 31 frequency channels
 time_model=zeros(size(trf,1),strfi_total_number); % 601 time channels.

% create pile of sub-models. blame matlab for the array-of-arrays data
% structure.  freq_coeff is a 5xstrfi_total_number matrix of the free
% paramters in the frequency gabor function, and freq_model is those
% parameters applied to a properly-dimensioned matrix.

for k=1:strfi_total_number,
  [freq_coeff(:,k),freq_resnorm(k),freq_model(:,k)]=sfitstrf(srf(:,k)); 
  [time_coeff(:,k),time_resnorm(k),time_model(:,k)]=tfitstrf(trf(k,:));
end
% begin computation of statistics.

% seperability index calculation
 seperability = seperability_index(sigmas,strfi_total_number);
 % similarity index calculation for srf and trf
 freq_si=zeros(1,strfi_total_number);
 time_si=zeros(1,strfi_total_number);
 % mean-squared error calculation for srf and trf
 freq_mse=zeros(1,strfi_total_number);
 time_mse=zeros(1,strfi_total_number);
% populate statistics matricies.
for k=1:strfi_total_number,
  freq_si(k)=sii(srf(:,k),freq_model(:,k));
  time_si(k)=sii(trf(k,:),time_model(:,k)');

  freq_mse(k)=mse(srf(:,k),freq_model(:,k));
  time_mse(k)=mse(trf(k,:),time_model(:,k)');
end

% creation of model and sampled original STRFs.  modelplot and actualplot
% reconstructed using the first strfi_total_number singular values, wholeplot
% is with every singular value.
modelplot=reassemble_strf(sigmas,freq_model,time_model,strfi_total_number,size(STRF_Cell));
actualplot=reassemble_actual_strf(sigmas,srf,trf,strfi_total_number,size(STRF_Cell)); ...
wholeplot=reassemble_actual_strf(sigmas,srf,trf,size(sigmas,1),size(STRF_Cell));
% scale!
minre=min(min(STRF_Cell));              % min of real STRF
maxre=max(max(STRF_Cell));              % max of real STRF
minmo=min(min(modelplot));              % min of model
maxmo=max(max(modelplot));              % max of model
modelplot=(((modelplot-minmo)/(maxmo-minmo))*(maxre-minre))+minre; %scales model to min/max of STRF_Cell


% calculation of model/actual firing rates.  see computefr for details.
[modelfr]=computefr(songdatapath,modelplot);
[actualfr]=computefr(songdatapath,actualplot);

% save data and figures!

ver=str2num(version('-release'));       % saves in appropriate .mat format
                                        % because mathworks fails at life

if (ver>=14)
   save(outfile,'-v6','time_model','freq_model','freq_coeff','time_coeff','seperability','freq_si','time_si','freq_mse','time_mse','modelplot','actualplot','srf','trf','sigmas','acausal_sigmas','modelfr','actualfr');
else
   save(outfile,'time_model','freq_model','freq_coeff','time_coeff','seperability','freq_si','time_si','freq_mse','time_mse','modelplot','actualplot','srf','trf','acausal_sigmas','sigmas','modelfr','actualfr');
end
