% SI: Matrix Similarity Index.
%     S = SI(signal1,signal2) returns the similarity index between two matrix
%     inputs signal1 and signal2, after first "vectorizing" the inputs.

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

function [similarity] = si(original,model)
% Like sii.m, this will calculate a similarity index between two items.
% However, these items are no longer vectors, and are m x n matricies instead.
% "The statistically significant samples of the STRF that exceeded a
% significance criterion of P < .002 were converted into a unidimensional vector
% from which the SI was determined" - qiu et al.

% THIS FILE HAS NOT YET BEEN IMPLEMENTED.