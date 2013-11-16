function [] = assign_cmaps(ax, h1, h2, cmap1, cmap2, data1, data2, freeze)
%ASSIGN_CMAPS   Set different colormaps for two sets of surfaces.
%
% usage
%   ASSIGN_CMAPS(ax, h1, h2, cmap1, cmap2, data1, data2, freeze)
%
% input
%   ax = axes handle to freeze colors
%   h1 = handles to surfaces to which the first colormap applies
%   h2 = handles to surfaces to which the second colormap applies
%   cmap1 = first colormap
%   cmap2 = second colormap
%   data1 = datasource for first group
%         = 'CData' | 'ZData'
%   data2 = datasource for second group
%         = 'CData' | 'ZData'
%   freeze = option to freeze the colormaps after assignment
%          = 0 | 1 (note that using this sets CData to RGB and the Painters
%          renderer cannot be used afterwards, allowing only raster export)
%
% See also FREEZECOLORS, COLORMAP.
%
% File:      assign_cmaps.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.05.24
% Language:  MATLAB R2012a
% Purpose:   assign to each set of objects a different colormap
% Copyright: Ioannis Filippidis, 2012-

% depends
%   coor_extremals, freezeColors

%% input
if isempty(ax)
    ax = gca;
end

if nargin < 8
    freeze = 0;
end

n(1, 1) = length(h1);
n(2, 1) = length(h2);

handles{1, 1} = h1;
handles{1, 2} = h2;

cmaps{1, 1} = cmap1;
cmaps{1, 2} = cmap2;

data{1} = data1;
data{2} = data2;

ncolormaps = size(handles, 2);

M = nan(1, ncolormaps);
for i=1:ncolormaps
    curmap = cmaps{1, i};
    M(1, i) = size(curmap, 1);
end

% set aggregate colormap
fullcmap = [cmap1; cmap2];
colormap(fullcmap)

%% assign
curbase = 1;
for i=1:ncolormaps
    curhandles = handles{1, i};
    
    % extremal z values to be mapped to ends of the current colormap
    [cmin, cmax] = min_max_zdata(curhandles, data{i} );
    
    for j=1:n(i, 1)
        h = curhandles(1, j);
        
        Z = get(h, data{i} );
        
        m = M(1, i);
        
        rounded = round((m-1)*(Z-cmin) /(cmax-cmin) );
        C = min(curbase +m, rounded +curbase);
        set(h, 'CData', C)
    end
    
    curbase = curbase +m;
end

% freezing precludes vector graphics export afterwards
if freeze == 1
    freezeColors(ax)
end

function [minZ, maxZ] = min_max_zdata(h, data_source)
Z = get(h, data_source);
[minZ, maxZ] = coor_extremals(Z);
