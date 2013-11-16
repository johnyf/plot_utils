function [h] = vcontourf(ax, q, z, resolution, varargin)
%VCONTOURF  Vectorized contourf plot.
%   VCONTOURF(ax, q, z, res) is a vectorized wrapper for the contour function.
%
% usage
%   h = VCONTOURF(ax, q, z, resolution, varargin)
%
% input
%   ax = axes object handle
%   q = coordinates of surface points
%     = [2 x #points] |
%   z = row vector of height data for surface points
%     = [1 x #points]
%   resolution = resolution of surface
%              = [nx, ny]
%
% output
%   h = handle to filled contourgroup object created.
%
% See also VCONTOUR, VSURF, VEC2MESHGRID.
%
% File:      vcontourf.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.06.15
% Language:  MATLAB R2012a
% Purpose:   Vectorized filled contour plot
% Copyright: Ioannis Filippidis, 2012-

% depends
%   vcontour

h = vcontour(ax, q, z, resolution, 'Fill', 'on', varargin{:} );

if nargout < 1
    clear('h')
end
