function [] = plotidy(ax, sx, sy, sz, stitle, slegend, legend_location)
%PLOTIDY    3D wrapper for tex_plot_annot.
%
% 2012.11.03 (c) Ioannis Filippidis, jfilippidis@gmail.com
%
% See also plotidy2, tex_plot_annot.

% todo
%   fix mac latex label issue when increasing the surf # pnts
%   temp fix: plot_fewer_markers and export without maximizing window
%   this is a good approach, because no more than 100 pnts are needed,
%   reduces graphics memory usage and paper file size
%
%   support multiple axis handles, see plotidy2

%% input
if nargin < 1
    ax = gca;
end

if nargin < 2
    sx = '$x$';
end

if nargin < 3
    sy = '$y$';
end

if nargin < 4
    sz = '$z$';
end

if nargin < 5
    stitle = [];
end

if nargin < 6
    slegend = [];
end

if nargin < 7
    tex_plot_annot(ax, stitle, sx, sy, sz, slegend);
else
    tex_plot_annot(ax, stitle, sx, sy, sz, slegend, legend_location);
end

% fix renderer if needed
fig = get(ax, 'Parent');
if ~strcmp(get(fig, 'Renderer'), 'Painters')
    set(fig, 'Renderer', 'Painters')
end

grid(ax, 'on')
plot_scalings(ax, 0)
