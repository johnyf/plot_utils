function [] = history_tube(data)
% data = [#configurations x #times]
%
% File:      history_tube.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2011.09.10
% Language:  MATLAB R2011a
% Purpose:   3D multi-dimensional data history visualization
% Copyright: Ioannis Filippidis, 2011-

[nc, nt] = size(data);

theta = linspace(0, pi, nc);
t = linspace(0, 10, nt);

fig = figure;
ax = axes('Parent', fig);
hold(ax, 'on')
grid(ax, 'on')

idx = 1:10:nt;
nidx = size(idx, 2);
X = nan(nc, nidx);
Y = nan(nc, nidx);
Z = nan(nc, nidx);
for i=1:size(theta, 2)
    curtheta = theta(1, i);
    
    curvar = data(i, :);
    
    x = t(1, idx);
    y = sin(curtheta) .*curvar(1, idx);
    z = cos(curtheta) .*curvar(1, idx);
    
    %plot3(ax, x, y, z)
    
    X(i, :) = x;
    Y(i, :) = y;
    Z(i, :) = z;
end

surf(X, Y, Z)
daspect(ax, [0.1, 1, 1] )
