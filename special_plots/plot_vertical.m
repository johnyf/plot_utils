function [] = plot_vertical(ax, x, y, varargin)
% plot a horizontal line at specified value, over given xdata.
%
%usage
%-----
%   plot_vertical(ax, x, y, varargin)
%
%input
%-----
%   ax = axes object handle
%   x = single abscissa of vertical line to be drawn
%   y = ordinate data vector
%     = [1 x n] | [n x 1]
%   varargin = passed to plot
%
%about
%-----
% 2013.02.27 (c) Ioannis Filippidis
%
% See also plot_horizontal.

ymin = min(y);
ymax = max(y);

plot(ax, x*ones(1, 2), [ymin, ymax], varargin{:} )