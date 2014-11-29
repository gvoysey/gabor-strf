% NOISE_ESTIMATION: estimation of noise levels in STRFs.
%                   NUM_SIG_VALS = NOISE_ESTIMATION(STRF,sigmas) returns the maximum
%                   number of significant values needed to recreate a STRF.
%                   The SVD of the acausal portion of the STRF is taken, and
%                   the highest value found is then used as a threshhold
%                   value to highpass filter the singular values of the
%                   overall STRF.  STRF is an experimental STRF, sigmas is
%                   its associated vector of singular values.

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

function [k,acausal_sigmas] = noise_estimation(STRF,sigmas)

% primary error checking (i'll do this later)

acausal=STRF(:,1:floor(size(STRF,2)/2));          % acausal is for t<0, not
                                                  % t<=0.  no assumptions
                                                  % about STRF size are made,
                                                  % hurray. 

acausal_sigmas=svd(acausal);             % decompose acausal portion, extract
                                         % singular values

% secondary error checking
if (acausal_sigmas(1)>sigmas(1))
  error('Acausal STRF more informative than Causal - This is an Ex-Zebra Finch!');
end

% begin highly ineffectual sort-and-count code block
k=0;
for j=1:size(sigmas,1),
  if (sigmas(j)>acausal_sigmas(1))
    k=k+1;                               % dear god why doesn't matlab have a
                                         % ++ operator?
  end
end
% end highly ineffectual sort-and-count code block
