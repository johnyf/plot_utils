function [] = plot_horizontal(ax, x, y, varargin)
% plot a horizontal line at specified value, over given xdata.
%
%usage
%-----
%   plot_horizontal(ax, x, y, varargin)
%
%input
%-----
%   ax = axes object handle
%   x = abscissa data vector
%     = [1 x n] | [n x 1]
%   y = single ordinate of horizontal line to be drawn
%   varargin = passed to plot
%
%about
%-----
% 2013.02.27 (c) Ioannis Filippidis
%
% See also plot_vertical.

xmin = min(x);
xmax = max(x);

plot(ax, [xmin, xmax], y*ones(1, 2), varargin{:} )
