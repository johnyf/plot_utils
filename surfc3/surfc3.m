function [varargout] = surfc3(ax, X, Y, Z, contourV, zoffset)
%SURFC3     combination of surf/contour3 plot.
%   SURFC3(AX, X, Y, Z, CONTOURV, ZOFFSET) is the same as surf(ax, x, y, z)
%   and contour(ax, x, y, CONTOURV) with the difference that level sets
%   are vecrtically offsetted to appear below the surface.
%
% input
%   ax = axes object handle
%   X = abscissas 2D matrix
%   Y = ordinates 2D matrix
%   nfZ = coordinate matrix
%   contourV = row array of values corresponding to level sets (optional)
%            = [1 x #(level sets) ]
%   zoffset = 
%
% output
%   h = plotted surface handle
%
% Note: usage with X, Y as returned by meshgrid (and appropriate nfZ).
%
% See also SURFC, SURF, CONTOUR3, CONTOUR.
%
% File:      surfc3.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2010.09.20 - 2012.01.22
% Language:  MATLAB R2011b
% Purpose:   plot 3D scalar field surface with 2D level sets
% Copyright: Ioannis Filippidis, 2010-

%% input
[zmin, zmax] = extrema(Z);

if isempty(contourV)
    v = [0, 0.1, 0.2, 0.5, 0.6, 0.7, 0.8];
    v = normalized2actual_level_sets(zmin, zmax, v);
else
    v = contourV;
end

if isempty(zoffset)
    zoffset = auto_level_set_offset(zmin, zmax);
end

%% plot
held = takehold(ax);

hsurf = surf(ax, X, Y, Z);
offset_contour(ax, X, Y, Z, v, zoffset);

restorehold(ax, held)

%% output
if nargout == 1
    varargout{1, 1} = hsurf;
end

function [v] = normalized2actual_level_sets(zmin, zmax, v)
v = (zmax -zmin) *v +zmin;

function [zoff] = auto_level_set_offset(zmin, zmax)
zoff = zmin -0.2 *(zmax-zmin);
