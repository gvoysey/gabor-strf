% MSE: Mean-Squared Error.
%      E = MSE(signal1,signal2) returns the mean-squared error between the two,
%      considering signal1 to be the "original" signal and signal2 to be the
%      "model".
%                               
%      signal1 and signal2 must be of like dimension.
%      
%      If the squared-sum of the components of signal1 is 0, no MSE can be
%      calculated.
%      
%      MSE will always return a value between 0 and 1, with values closer to 0
%      indicating a closer match between signals.

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



function[mserr] = mse(original,model)

% check that input1 and input2 are of the same size
if (nargin ~=2)
  error('Not enough inputs');
end

if (size(original) ~= size(model))
  error('Input dimension mismatch');
end

% compute MSE.
num=0;
den=0;
for i=1:size(original,1)
  for j=1:size(original,2)
    num=num+((model(i,j)-original(i,j))^2);
    den=den+(original(i,j)^2);
  end
end

if (den==0)
  error('MSE uncalculatable; denominator is zero!');
end

mserr=num/den;
