function [h] = vsurf(ax, q, z, resolution, varargin)
%VSURF  Vectorized surf.
%   VSURF(ax, q, z, res) is a vectorized wrapper for the surf function.
%   When q is 2-dimensional, then z is the height function.
%   When q is 3-dimensional, then z is the color function of the surface.
%
% usage
%   h = VSURF(ax, q, z, res, varargin)
%
% input
%   ax = axes object handle
%   q = coordinates of surface points
%     = [2 x #points] |
%     = [3 x #points], when color data are provided in vector z
%   z = row vector of height or color data for surface points
%     = [1 x #points] | [], depending on the cases:
%       
%     1) when size(q, 1) == 2, then z is assumed to be the values of a
%       scalar function to be plotted over the 2-dimensional domain defined
%       by the points in the matrix of column position vectors q.
%
%     2) when size(q, 1) == 3, then q are the coordinates of the points in
%        3-dimensional space, whereas z is assumed to be the row vector
%        specifying the surface color at each point.
%     
%     special cases: [] (0 color)
%                    nan (random colors)
%                    scalar (uniform color)
%                    'scaled' (scaled colors indexed in colormap)
%
%   resolution = resolution of surface
%              = [nx, ny] | [nx, ny, nz]
%
% output
%   h = handle to surface object created.
%
% See also SURF, VCONTOUR, VEC2MESHGRID.
%
% File:      vsurf.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.05.24 - 2012.09.02
% Language:  MATLAB R2012a
% Purpose:   Vectorized surf
% Copyright: Ioannis Filippidis, 2012-

% depends
%   vec2meshgrid, res2meshsize

%% input

% axes handle missing ?
if isempty(ax)
    ax = gca;
end

% multiple axes ?
nax = size(ax, 2);
if nax > 1
    h = nan(1, nax);
    for i=1:nax
        curax = ax(1, i);
        
        h(1, i) = vsurf(curax, q, z, resolution, varargin{:} );
    end
    return
end

if size(q, 1) < 2
    error('q is not a matrix of column vectors.')
end

resolution = res2meshsize(resolution);

% Z ?
if isempty(z)
    z = zeros(1, size(q, 2) );
elseif isnan(z)
    z = 5 *rand(1, size(q, 2) );
elseif strcmp(z, 'scaled')
    z = [];
elseif isscalar(z)
    z = z *ones(1, size(q, 2) );
end

%% calc
ndim = size(q, 1);
if ndim < 3
    h = vsurf2(ax, q, z, resolution, varargin{:} );
else
    h = vsurf_color(ax, q, z, resolution, varargin{:} );
end

if nargout < 1
    clear('h')
end

function [h] = vsurf2(ax, q, z, res, varargin)
[X, Y] = vec2meshgrid(q, [], res);
Z = vec2meshgrid(z, [], res);

h = surf(ax, X, Y, Z, varargin{:} );

function [h] = vsurf_color(ax, q, c, res, varargin)
[X, Y, Z] = vec2meshgrid(q, [], res);

% no color ?
if isempty(c)
    h = surf(ax, X, Y, Z, varargin{:} );
else
    C = vec2meshgrid(c, [], res);
    h = surf(ax, X, Y, Z, C, varargin{:} );
end
