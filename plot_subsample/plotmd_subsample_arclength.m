function [] = plotmd_subsample_arclength(ax, x, n, varargin)
%PLOTMD_SUBSAMPLE_ARCLENGTH  Subsample wrt arclength metric & plotmd curve.
%
% usage
%   PLOTMD_SUBSAMPLE_ARCLENGTH(ax, x)
%   PLOTMD_SUBSAMPLE_ARCLENGTH(ax, x, n, varargin)
%
% input
%   ax = axes object handle where to plot
%   x = point abscissas (as passed to plot)
%
% input (optional)
%   y = point ordinates (as passed to plot)
%   n = number of points to keep
%     > 0
%   varargin = arguments passed to plot
%
% 2013.02.15 (c) Ioannis Filippidis, jfilippidis@gmail.com
%
% See also test_plot_subsample_arclength, plot_subsample,
%   plotmd_fewer_markers, plot_fewer_markers, plot, plotmd.

%% input
if nargin < 3
    disp('#points for plotmd_subsample not provided, using: n = 100.')
    n = 100;
end

if ~isscalar(n)
    error('n: # of sample, must be scalar.')
end

%% plot
x = subsample(x, n, 2, 'arclength');
plotmd(ax, x, varargin{:} )
