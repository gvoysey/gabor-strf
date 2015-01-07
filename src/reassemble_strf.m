% REASSEMBLE_STRF :  Recombine many model STRFi's into an overal STRFm.

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
% St, Fifth Floor, Boston, MA 02110-1301 USA % Graham Voysey


function [reassembled] = reassemble_strf(sigmas,srf,trf,strfi_total_number,size_of_strf)

reassembled=zeros(size_of_strf);
for k=1:strfi_total_number,
  temp=sigmas(k)*srf(:,k)*trf(:,k)';     % remember to invert when calling
                                        % function if needed
  reassembled=reassembled+temp;
end
