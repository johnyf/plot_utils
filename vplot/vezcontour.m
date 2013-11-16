function [] = vezcontour(ax, func, domain, resolution, values, varargin)
%VEZCONTOUR     Vectorized easy contour.
%
% usage
%   VEZCONTOUR(ax, func)
%   VEZCONTOUR(ax, func, domain)
%   VEZCONTOUR(ax, func, domain, resolution)
%   VEZCONTOUR(ax, func, domain, resolution, values)
%   VEZCONTOUR(ax, func, domain, resolution, values, varargin)
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
%   values = level set values
%          = [v1, v2, ..., vN]
%   varargin = additional arguments for input to func
%
% See also VEZSURF, EZCONTOUR, FPLOT, CONTOUR.
%
% File:      vezcontour.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.05.13
% Language:  MATLAB R2012a
% Purpose:   vectorized ezcontour, for functions accepting vector arguments
% Copyright: Ioannis Filippidis, 2012-

% which axes ?
if isempty(ax)
    warning('vezcontour:axes', 'Axes object handle ax is empty, no plot.')
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

% which level sets ?
if nargin < 5
    values = [];
end

% compute surface
[q, X, Y] = domain2vec(domain, resolution);
f = feval(func, q, varargin{:} );
Z = vec2meshgrid(f, X);

% default level set values ?
if isempty(values)
    contour(ax, X, Y, Z)
else
    contour(ax, X, Y, Z, values)
end
