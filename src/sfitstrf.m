% SFITSTRF:  Spectral Receptive Field Modeling
%            [x, resnorm, model] = SFITSTRF(srfi) seeds lsqcurvefit with
%            appropriate-ish values to begin minimization fitting, calls
%            lsqcurvefit to minimize the spectral receptive field to the
%            function defined in SRF_GABOR_FUN.  Returns the row vector 
%            x of coefficents, values of the resnorms, and the model itself.


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

function [x, resnorm, model] = sfitstrf(srfi)

xdata=[500:250:8000];                   % frequency range
ydata=srfi';                            % the transpose of the input SRF
[ymax,yind]=max(ydata);                 % beginning to pick values to
                                        % populate x0
cf=xdata(yind);                         % center frequency
halfmax=ymax/2;
tophalf=find(ydata>halfmax);
if size(tophalf)==1                     % sanity check to make sure tophalf
                                        % has more than one value
  tophalf=[2+tophalf-1,2+tophalf+1];
end

bw=xdata(tophalf(end))-xdata(tophalf(1)); % bandwidth
x0=[ymax cf bw 5 0];
%lb=-ones(5,1)*inf;
%ub=-lb;
%opts=optimset('tolfun',1e-4,'maxiter',inf);
%[x,resnorm]=lsqcurvefit(@srf_gabor_fun,x0,xdata,ydata,lb,ub,opts);
[x,resnorm]=lsqcurvefit(@srf_gabor_fun,x0,xdata,ydata);
model=srf_gabor_fun(x,xdata);           % populate the model and preserve dimension

