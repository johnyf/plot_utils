function [] = plot_fewer_markers(ax, x, y, style, marker_npnt, line_npnt)
%PLOT_FEWER_MARKERS     Same line, different number of markers.
%
% usage
%   PLOT_FEWER_MARKERS(ax, x, y, style, marker_npnt, line_npnt)
%
% input
%   ax = axes object handle
%   x = abscissa vector
%   y = ordinate vector
%   marker_npnt = # markers
%   line_npnt = # points used for line
%   style = line and marker style
%         = plot style string, e.g., 'ro--'
%         | cell array {graph_color, line_style, marker_style}, e.g.,
%           {'b', '--', 'o'}, or {[0,0,1], '--', 'o'}
%           note: the 2nd option allows for RGB color specification.
%
% 2013.01.30 Copyright Ioannis Filippidis
%
% See also plotmd_fewer_markers, plot_subsample, plotmd_subsample.

%% input
if nargin < 4
    style = ''; % defaults by parse_plot_style
end

if nargin < 5
    marker_npnt = 10;
end

if nargin < 6
    line_npnt = 100;
end

% cell with RGB color specs ?
if iscell(style)
    graph_color = style{1};
    line_style = style{2};
    marker_style = style{3};
else
    % or string style ?
    [graph_color, marker_style, line_style] = parse_plot_style(style)
end

%% plot
c = takehold(ax, 'on');

% marker of 1st pnt
plot(ax, x(1), y(1), 'Color', graph_color, 'LineStyle', line_style,...
     'Marker', marker_style)

% line
plot_subsample(ax, x, y, line_npnt, 'Color', graph_color,...
         'LineStyle', line_style, 'Marker', 'none',...
         'HandleVisibility', 'off')

% markers
plot_subsample(ax, x, y, marker_npnt, 'Color', graph_color,...
         'LineStyle', 'none', 'Marker', marker_style,...
         'HandleVisibility', 'off')

restorehold(ax, c)
