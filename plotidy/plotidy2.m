function [] = plotidy2(ax, sx, sy, stitle, slegend, legend_location)
% tex_plot_annot Wrapper for 2D plots, plot_scalings, grid:on.
%
% If multiple axes handles provided, but any of sx, sy, stitle or slegend
% are only for a single axis, then they are copied the same over all the
% multiple axes.
%
% usage
%   PLOTIDY2
%   PLOTIDY2(ax, sx, sy, stitle, slegend, legend_location)
%
% input (optional)
%   ax = axes object handle(s)
%      = [1 x #axes]
%   sx = x axis string(s for multiple axes)
%      = 'string'
%     |= {1 x #axes} = {'string1', 'string2', ..., 'string#axes'}
%   sy = y axis string(s for multiple axes)
%      = similar to sx
%   stitle = title string(s)
%          = 'title string'
%         |= {'title1', 'title2, ..., 'title#axes'}
%   slegend = legend entries, as strings (each row for each axis)
%           = {#axes x #entries}
%           = {'axis1-entry1', 'axis1-entry2', ..., 'axis1-entryN';
%              'axis2-entry1', 'axis2-entry2', ..., 'axis2-entryM';
%              ;;;
%              'axis#axes-entry1', ..., 'axis#axes-entryK'}
%
% 2012.11.03 (c) Ioannis Filippidis, jfilippidis@gmail.com
%
% See also plotidy, tex_plot_annot.

%% input
if nargin < 1
    ax = gca;
end

if nargin < 2
    sx = [];
end

if nargin < 3
    sy = [];
end

if nargin < 4
    stitle = [];
end

if nargin < 5
    slegend = [];
end

% iterate over multiple axes
ax = ax(:).'; % vectorize
for i=1:size(ax, 2)
    curax = ax(1, i);
    
    if ~ischar(sx) && (size(sx, 2) > 1)
        cursx = sx{1, i};
    else
        cursx = sx;
    end
    
    if ~ischar(sy) && (size(sy, 2) > 1)
        cursy = sy{1, i};
    else
        cursy = sy;
    end
    
    if ~ischar(stitle) && (size(stitle, 2) > 1)
        curstitle = stitle{1, i};
    else
        curstitle = stitle;
    end
    
    % matrix sleg ? -> each row goes to one figure
    if size(slegend, 1) > 1
        cursleg = slegend(i, :);
    else
        cursleg = slegend;
    end
    
    % annotate
    if nargin < 6
        tex_plot_annot(curax, curstitle, cursx, cursy, [], cursleg);
    else
        tex_plot_annot(curax, curstitle, cursx, cursy, [], cursleg,...
                       legend_location);
    end
    
    % fix renderer
    fig = get(curax, 'Parent');
    if ~strcmp(get(fig, 'Renderer'), 'Painters')
        set(fig, 'Renderer', 'Painters')
    end
    
    plot_scalings(curax, 0)
    grid(curax, 'on')
    view(curax, 2)
end
