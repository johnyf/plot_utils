function [] = plot_quadrant_bisector(ax, x, y, varargin)
%PLOT_QUADRANT_BISECTOR   Bisector of first quadrant.
%
% usage
%   PLOT_QUADRANT_BISECTOR
%   PLOT_QUADRANT_BISECTOR(ax, x, y, varargin)
%
% input
%   ax = axes object handle [gca]
%   x = abscissa values
%     = vector (column /row)
%   y = ordinate values
%     = vector (column /row)
%   varargin = additional arguments passed to plot
%            = see plot function
%
% output
%   plots the bisector of the 1st quadrant,
%   i.e., the line y=x, so that it starts and
%   ends including all values (min, max) of x,y.
%
% Date:   2012.12.02
% Author: Ioannis Filippidis, Copyright 2012-
%
% See also plotidy, plot_scalings, plot.

%% input
if nargin < 1
    ax = gca;
end

if isempty(ax)
    ax = gca;
end

if nargin < 2
    x = [0, 1];
end

if nargin < 3
    y = [];
end

%% calc
data = [x(:); y(:) ];
data(isinf(data) ) = nan;

xmin = min(data);
xmax = max(data);

%% plot
x = [xmin, xmax];
y = x;
plot(ax, x, y, varargin{:} )
