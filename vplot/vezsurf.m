function [varargout] = vezsurf(ax, func, domain, resolution, varargin)
%VEZSURF    Vectorized ezsurf.
%
% usage
%   VEZSURF(ax, func)
%   VEZSURF(ax, func, domain)
%   VEZSURF(ax, func, domain, resolution)
%   [q, f] = VEZSURF(ax, func, domain, resolution, varargin)
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
% output
%   q = domain points
%   f = function values at q
%
% See also VEZCONTOUR, EZSURF, FPLOT, SURF.
%
% File:      vezsurf.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.05.10
% Language:  MATLAB R2012a
% Purpose:   vectorized ezsurf, for functions accepting vector arguments
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
f = feval(func, q, varargin{:} );
vsurf(ax, q, f, resolution)

if nargout > 0
    varargout{1, 1} = q;
    varargout{1, 2} = f;
end
