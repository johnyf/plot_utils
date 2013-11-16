function [h] = vcontour(ax, q, z, resolution, varargin)
%VCONTOUR  Vectorized wrapper for contour plot.
%
% usage
%   h = VCONTOUR(ax, q, z, resolution, varargin)
%
% input
%   ax = axes object handle
%   q = coordinates of surface points
%     = [2 x #points] |
%   z = row vector of height data for surface points
%     = [1 x #points]
%   resolution = resolution of surface
%              = [nx, ny]
%   varargin = passed to contour function as given, see its help
%
% output
%   h = handle to contourgroup object created.
%
% 2012.06.15 (c) Ioannis Filippidis, jfilippidis@gmail.com
%
% See also CONTOUR, VSURF, VEC2MESHGRID.

% depends
%   vec2meshgrid, res2meshsize

%% input

% axes handle missing ?
if isempty(ax)
    ax = gca;
end

resolution = res2meshsize(resolution);

% Z ?
if isempty(z)
    z = zeros(1, size(q, 2) );
elseif isnan(z)
    z = 5 *rand(1, size(q, 2) ); % random surface
elseif isscalar(z)
    z = z *ones(1, size(q, 2) );
end

%% calc
ndim = size(q, 1);
if ndim < 3
    h = vcontour2(ax, q, z, resolution, varargin{:} );
else
    error('vcontour:ndim', 'Dimension of vector q is not 2.')
end

if nargout < 1
    clear('h')
end

function [h] = vcontour2(ax, q, z, res, varargin)
[X, Y] = vec2meshgrid(q, [], res);
Z = vec2meshgrid(z, [], res);

h = contour(ax, X, Y, Z, varargin{:} );
