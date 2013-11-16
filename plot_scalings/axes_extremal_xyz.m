function [xyz_minmax, dim] = axes_extremal_xyz(ax)
%AXES_EXTREMAL_XYZ  Minimum and maximum coordinates of graphics objects.
%
% usage
%   [xyz_minmax, dim] = AXES_EXTREMAL_XYZ(ax)
%
% input
%   ax = axes object handle
%
% output
%   xyz_minmax = coordinate extremals of objects in axes ax
%              = [xmin, xmax, ymin, ymax, zmin, zmax]
%   dim = dimension of space, depending on plotted objects
%       = 2 || 3
%
% See also PLOT_SCALINGS.
%
% File:      axes_extremal_xyz.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2009.02.12 - 2012.06.11
% Language:  MATLAB R2012a
% Purpose:   min & max coordinates of objects in plot
% Copyright: Ioannis Filippidis, 2009-

% todo
%   properly process quivergroup and cotourgroup objects

%% input
if nargin < 1
    ax = gca;
elseif isempty(ax) || ~ishandle(ax)
    ax = gca;
end

%% get plot objects, find coordinate limits
obj = get(ax, 'Children');
obj2 = findall(ax, 'Type', 'line'); % get hidden lines

obj = [obj; obj2];

% no graphics ?
if isempty(obj)
    warning('plot_scalings:extremalcoor', 'Axes do not have children.')
    xyz_minmax = [];
    dim = [];
    return
end

%% clear text objects
type = get(obj, 'type');
idx = strcmp(type, 'text');
txtobj = obj(idx);
obj(idx) = [];

%% clear light objects
type = get(obj, 'type');
idx = strcmp(type, 'light');
obj(idx) = [];

[coor_min, coor_max] = nontxt_obj_coor_extremals(obj);

% handle text objects separately
pos = get(txtobj, 'Position');
if iscell(pos)
    pos = cell2mat(pos);
end
mintxtcoor = min(pos, [], 1);
maxtxtcoor = max(pos, [], 1);

% no plot contents ?
if isempty(coor_min) && isempty(mintxtcoor)
    xyz_minmax = [];
    dim = [];
    return
end

if isempty(mintxtcoor)
    xyz_minmax(1, 1:2:6) = coor_min;
    xyz_minmax(1, 2:2:6) = coor_max;
elseif isempty(coor_min)
    xyz_minmax(1, 1:2:6) = mintxtcoor;
    xyz_minmax(1, 2:2:6) = maxtxtcoor;
else
    xyz_minmax(1, 1:2:6) = min(coor_min, mintxtcoor);
    xyz_minmax(1, 2:2:6) = max(coor_max, maxtxtcoor);
end

% dimension ?
if xyz_minmax(1, 5) == xyz_minmax(1, 6)
    xyz_minmax = xyz_minmax(1, 1:4);
end

dim = size(xyz_minmax, 2) /2;

function [coor_min, coor_max] = nontxt_obj_coor_extremals(obj)
% no non-text objects
if isempty(obj)
    coor_max = [];
    coor_min = [];
    return
end

X = get(obj, 'XData');
[minX, maxX] = coor_extremals_wrapper(X);

Y = get(obj, 'YData');
[minY, maxY] = coor_extremals_wrapper(Y);

Z = get(obj, 'ZData');
[minZ, maxZ] = coor_extremals_wrapper(Z);

% ensure [1 x 3] matrices are returned
if isempty(minZ)
    minZ = 0;
    maxZ = 0;
end

coor_min = [minX, minY, minZ];
coor_max = [maxX, maxY, maxZ];

function [minC, maxC] = coor_extremals_wrapper(C)
[minC, maxC] = coor_extremals(C);
