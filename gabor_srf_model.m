% GABOR_SRF_MODEL : Least-Squares Modeling of SRF data.
%                   [ydataFit,x,resnorm] = gabor_srf_model(xdata,ydata)

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
% St, Fifth Floor, Boston, MA 02110-1301 USA

% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
% !NOTE! Requires MATLAB Optimization Toolbox!
% !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

% FITTER - A lazy-man's function for fitting exponentially-increasing data.
% Xdata and Ydata have to be defined from the beginning as XDATA = Time, YDATA =
% all points from t10 analysis

function [ydataFit,ydataAdj,x,resnorm,x0,tc] = gabor_srf_model(xdata,ydata)

numunits = size(ydata,1);
if ndims(ydata)==3
    numsets = size(ydata,3);
else
    numsets = 1;
end

% ydataAdj=ydata;

% Get the maximum values of each tCurve for each unit and, if applicable,
% each number of sets created
for i=1:numunits
    for j=1:numsets
        [meanYmax(i,j), meanYmaxdex(i,j)] = max(ydata(i,:,j));
        [meanYmin(i,j), meanYmindex(i,j)] = min(ydata(i,:,j));
        ydataAdj(i,meanYmaxdex(i,j):end,j) = meanYmax(i,j);
        
    end
end

% figure
% plot(xdata,ydataAdj)
% hold on
% plot(xdata,ydata,'.')

for i=1:numunits
    for j=1:numsets
        % x0(i,:)=[meanY_max(i)+5 meanY_max(i) 0.001]
        x0(i,:,j)=[meanYmax(i,j) meanYmax(i,j)-meanYmin(i,j) 0.001]';
%         ub(i,:,j)=[100 meanYmax(i,j)-meanYmin(i,j) 1]';
%         lb(i,:,j)=[meanYmin(i,j) 0 0]';
%        [x(i,:,j),resnorm(i,j)]=lsqcurvefit(@srf_gabor_fun,x0(i,:,j),xdata(i,:),ydata(i,:,j),lb(i,:,j),ub(i,:,j));
        [x(i,:,j),resnorm(i,j)]=lsqcurvefit(@srf_gabor_fun,x0(i,:,j),xdata(i,:),ydata(i,:,j));
       ydataFit(i,:,j)=srf_gabor_fun(x(i,:,j),xdata(i,:));
    end
end

%tc=1./x(:,3,:);                         
% figure
% plot(xdata,ydata,'.')
% hold on
% plot(xdata,ydataFit)

% for i=1:size(ydata,1)
% %    x(i,:)-0.5*max(yfitdata(i,:))
%     t_half(i)=-tc(i)*log((x(i,1)-0.5*max(yfitdata(i,:)))/x(i,2));
% end
