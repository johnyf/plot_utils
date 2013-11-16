function [] = plot_subsample(ax, x, y, n, varargin)
%PLOT_SUBSAMPLE     Plot subsampled line. Subsampling metric: index.
%
% usage
%   PLOT_SUBSAMPLE(ax, x, y)
%   PLOT_SUBSAMPLE(ax, x, y, n, varargin)
%
% input
%   ax = axes object handle where to plot
%   x = point abscissas (as passed to plot)
%   y = point ordinates (as passed to plot)
%
% optional input
%   n = [100] number of points to keep
%     > 0
%   varargin = arguments passed to plot
%
% 2012.11.04 - 2013.01.30 (c) Ioannis Filippidis, jfilippidis@gmail.com
%
% See also plotmd_subsample, plot_fewer_markers, plotmd_fewer_markers,
%          plot, plotmd, plot_subsample_arclength.

%% input
if nargin < 4
    disp('#points for plot_subsample not provided, using: n = 100.')
    n = 100;
end

if ~isscalar(n)
    error('n: # of sample, must be scalar.')
end

% assume row vectors
if (size(x, 1) > 1) || (size(y, 1) > 1)
    disp('size(x) = ')
    disp(size(x) )
    disp('size(y) = ')
    disp(size(y) )
    error('Either x or y is not a row vector.')
end

%% plot
xvec = [x; y];
xvec = subsample(xvec, n, 2);
[x, y] = disperse(xvec, 1);

plot(ax, x, y, varargin{:} )
