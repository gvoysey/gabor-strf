% SII: Vector Similarity Index.  
%     S = SII(signal1, signal2): returns the similarity index between the two,
%     considering signal1 to be the "original" signal and signal2 to be the
%     model.
%                                
%     Calculates a similarity index between two vectors using the algorithm
%     given in "Gabor Analysis of Auditory Midbrain Receptive Fields:
%     Spectro-Temporal and Binaural Composition", Qiu et al, J. Neurophysiol,
%     2003.  Numerically equivalent to the Pearson Correlation Coefficient.
%     
%     If either signal1 or signal2 have a norm-2 of 0 (eg, they are zeros-only),
%     no index can be calculated.
%     
%     SII will always return a value between -1 and +1.  Values closer to abs(1)
%     indicate a closer correlation.  A value of 1 will be returned if the
%     signals are identical, and a value of -1 if they differ only by a negative
%     sign.

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

function[similarity] = sii(original,model)
% error checking
if (nargin ~=2)
  error('Not enough inputs');
end

if (size(original) ~= size(model))
  error('Input dimension mismatch');
end

if (norm(original,2) == 0 || norm(model,2) ==0)
  error('similarity uncalculatable; a norm = 0!');
end
% calculation
similarity=dot(original,model)/(norm(original,2)*norm(model,2));
