% DECOMPOSESTRF: STRF decomposition.
%                [strfi,trf,srf,sigmas,k]= DECOMPOSESTRF(strf_measured) returns
%                strfi, a m x n x k matrix where strfi(:,:,k) is the kth linear
%                strf component created by SVD and ready to be modeled. trf and
%                srf are the temporal receptive field and the spectral receptive
%                field, respectively.  K is determined by noise_estimation.m ,
%                and represents the number of singular values used to create
%                strfi.

% Graham Voysey Senior Project 2005-2006 
% Boston University, College of
% Engineering, Department of Biomedical Engineering
% Natural Sounds and Neural Coding Lab
% 
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

function [strfi,trf,srf,sigmas,strfi_total_number,acausal_sigmas] =decomposestrf(strf_measured)

% step two: deompose STRF
[srf, s, trft]=svd(strf_measured);
trf=trft';
sigmas=diag(s);

[strfi_total_number,acausal_sigmas]=noise_estimation(strf_measured,sigmas); % heeey, this
                                                           % works now.

% step three: create K strfs in one large matrix, which may or may not be the
% Right Thing.

% create a matrix strfi whose rows x columns are the same as
% STRF_Cell, and is strfi_total_number deep.

%strfi=zeros(size(STRF_Cell,1), size(STRF_Cell,2),strfi_total_number); <--what
%was i *thinking* ?

for(k=1:strfi_total_number),
  strfu=srf(:,k)*trf(k,:);
  temp=sigmas(k)*strfu;
  strfi(:,:,k)=temp;
end
