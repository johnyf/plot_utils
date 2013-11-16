function [] = ezquiver(ax, func, domain, resolution, varargin)
%EZQUIVER    Easy vector plot.
%
% usage
%   EZQUIVER(ax, func)
%   EZQUIVER(ax, func, domain)
%   EZQUIVER(ax, func, domain, resolution)
%   EZQUIVER(ax, func, domain, resolution, varargin)
%
% input
%   ax = axes object handle
%   func = function handle
%
% optional input
%   domain = rectangular plotting domain
%          = [xmin, xmax, ymin, ymax]
%   resolution = grid spacing
%              = [nx, ny]
%   varargin = additional arguments for input to func
%
% See also VEZSURF, VEZCONTOUR, EZSURF, FPLOT, SURF.
%
% File:      ezquiver.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.07.13
% Language:  MATLAB R2012a
% Purpose:   vectorized quivermd, for functions accepting vector arguments
% Copyright: Ioannis Filippidis, 2012-

% which axes ?
if isempty(ax)
    warning('vezsurf:axes', 'Axes object handle ax is empty, no plot.')
    return
end

% which domain ?
if nargin < 3
    domain = [0, 1, 0, 1];
end

% at what grid resolution ?
if nargin < 4
    resolution = [30, 29];
elseif isempty(resolution)
    resolution = [30, 29];
end

q = domain2vec(domain, resolution);
v = feval(func, q, varargin{:} );
quivermd(ax, q, v)
