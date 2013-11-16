function [] = plotmd_subsample(ax, x, n, varargin)
%PLOTMD_SUBSAMPLE     Plot subsampled line. Subsampling metric: index.
%
% usage
%   PLOTMD_SUBSAMPLE(ax, x, n, varargin)
%
% input
%   ax = axes object handle where to plot
%   x = point abscissas (as passed to plot)
%   y = point ordinates (as passed to plot)
%   n = number of points to keep
%     > 0
%   varargin = arguments passed to plot
%
% 2013.01.30 (c) Ioannis Filippidis, jfilippidis@gmail.com
%
% See also plot_subsample, plotmd_fewer_markers, plot_fewer_markers,
%          plot, plotmd, plotmd_subsample_arclength.

%% input
if nargin < 3
    disp('#points for plotmd_subsample not provided, using: n = 100.')
    n = 100;
end

if ~isscalar(n)
    error('n: # of sample, must be scalar.')
end

%% plot
x = subsample(x, n);
plotmd(ax, x, varargin{:} )
