function [graph_color, marker_style, line_style] = parse_plot_style(style)
% helper
%
% 2013.01.30 Copyright Ioannis Filippidis
%
% See also plot_fewer_markers, plotmd_fewer_markers.

graph_color = 'b';
marker_style = 'none';
line_style = 'none';

colors = {'b', 'g', 'r', 'c', 'm', 'y', 'k', 'w'};
markers = {'.','o','x','+','*','s','d','v', '^', '<', '>', 'p', 'h'};
linestyles = {'--', '-.', '-', ':'}; % order matters, to avoid strfinding
                                     % the '-' contained in '--', '-.'

for s=colors
    r = s{1};
    if strfind(style, r)
        graph_color = r;
        break
    end
end

for s=markers
    r = s{1};
    if strfind(style, r)
        marker_style = r;
        break
    end
end

for s=linestyles
    r = s{1};
    if strfind(style, r)
        line_style = r;
        break
    end
end

% default line style
if strcmp(marker_style, 'none') && strcmp(line_style, 'none')
    line_style = '-';
end
