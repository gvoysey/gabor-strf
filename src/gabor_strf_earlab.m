% GABOR_STRF_EARLAB : creation of EarLab Data Viewer-readable binary files
% from GABOR_STRF-generated data.  
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

function [a] = gabor_strf_earlab(inputpath,outputpath,numstrfs)
a=dir(strcat(inputpath,'/*.mat'));	% all .mat files from inputpath;
                                        % these should be models only!
b={a.name};				% further evidence of >=matlab7.1 requirements.
b=b';
[b,indb]=sort(b);
earlab_matrix=zeros(1617,numstrfs);	% create a bunch of 1617-element row
                                        % vectors
for i=1:numstrfs,
  load(strcat(inputpath,'/',b{i}));
  earlab_matrix(:,i)=modelfr;
end

earlab_matrix=earlab_matrix';
earlab_matrix_ud=flipud(earlab_matrix);

fid=fopen(strcat(outputpath,'/earlabmodel_asciisort.binary'),'w');
count=fwrite(fid,earlab_matrix,'float');
stat=fclose(fid);

fid2=fopen(strcat(outputpath,'/earlabmodel_iicsasort.binary'),'w');
count2=fwrite(fid,earlab_matrix_ud,'float');
stat2=fclose(fid2);

% b={ 'gn03-33-oldsongs20-model.mat';
%     'bg-38-oldsongs20-model.mat';
%     'gn03-25-oldsongs20-model.mat';
%     'bg-51-oldsongs20-model.mat';
%     'gn02-4-oldsongs20-model.mat';
%     'ae-14-oldsongs20-model.mat';
%     'gn03-29-oldsongs20-model.mat';
%     'yw10-3-oldsongs20-model.mat';
%     'bg-43-oldsongs20-model.mat';
%     'gn03-31-oldsongs20-model.mat';
% }
