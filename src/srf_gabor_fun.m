% SRF_GABOR_FUN : Gabor function for modeling of the Spectral Receptive Field.
%                 fitgabor = SRF_GABOR_FUN(x,xdata)

% Graham Voysey
% Original version of code provided by Gilberto Grana, endymion at bu dot edu
% Extensive assistance by Rajiv Narayan, rn at bu dot edu
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
% St, Fifth Floor, Boston, MA 02110-13v01 USA

function FITGABOR = srf_gabor_fun(x,xdata)
FITGABOR = x(1)*exp(-((2*(xdata-x(2))/(x(3))).^2)).*cos(2*pi*x(4)*(xdata-x(2))+ x(5));
% x(1): K, strength of response
% x(2): omega_0, center frequency
% x(3): BW, bandwidth (cannot be zero)
% x(4): Omega_o, best ripple density
% x(5): P , spectral phase
