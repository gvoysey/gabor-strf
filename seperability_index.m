% SEPERABILITY_INDEX: Determination of seperability.
%                     [alpha] = seperability_index(sigmas,k) takes sigmas, a row
%                     vector of significant values, and k, a number representing
%                     the kth-highest-order significant value to be considered.
%                     It returns alpha, a number between 0 and 1 that represents
%                     the seperability of the STRF represented by the
%                     significant values.  Values closer to 1 indicate a
%                     well-seperable STRF.

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



function [alpha] = seperability_index(sigmas,k)

num=sigmas(1)^2 - sum(sigmas(2:k).^2);
den=sigmas(1)^2 + sum(sigmas(2:k).^2);

if (den==0)
  error('Seperability uncalculatable; denominator is zero!');
end

alpha=num/den;