function [] = tex_plot_annot(ca, str_title, str_x, str_y, str_z, str_legend, legend_location)
%TEX_PLOT_ANNOT     LaTeX annotation for axes, title, legend.
%
% usage
%   TEX_PLOT_ANNOT(ax, title, xlabel, ylabel, zlabel, legendstr, legend_loc)
%
% input
%   ax = axes handle, e.g. = gca
%   title = axes title string, as provided to title()
%   xlabel = x axis label string, as provided to xlabel()
%   ylabel = y axis label string, as provided to ylabel()
%   zlabel = z axis label string, as provided to zlabel()
%   legendstr = legend strings, e.g. {'data1', 'data2'}
%   legend_loc = 'Location' property provided to legend()
%              = 'South' | 'East' | 'West' | 'NorthEast' | 'NorthWest' |
%                'SouthEast' | 'SouthWest' | 'NorthOutside' | 
%                'SouthOutside' | 'EastOutside' | 'WestOutside'
%                'NorthEastOutside' | 'NorthWestOutside' |
%                'SouthEastOutside' | 'SouthWestOutside' |
%                'Best' | 'BestOutside'
%
% usage example:
%   x = linspace(1, 10, 20);
%   y = linspace(1, 10, 21);
%   [X, Y] = meshgrid(x, y);
%   Z = X.^2 +Y.^2;
%   ax = gca;
%   surf(ax, X, Y, Z)
%   tex_plot_annot(ax,...
%            'Paraboloid function $f(x, y) = x^2 +y^2$',...
%            '$x$ (m)',...
%            '$y$ (m)',...
%            '$z = f(x, y)$',...
%            {'$f$'}, 'Best')
%
% See also plotidy.
%
% File:      tex_plot_annot.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2010.09.19 - 2012.02.18
% Language:  MATLAB R2011b
% Purpose:   annotate plot with TeX strings (title, labels, legend)
% Copyright: Ioannis Filippidis, 2010-

%% args
if nargin < 1
    ca = gca;
end

if nargin < 2
    str_title = [];
end

if nargin < 3
    str_x = [];
end

if nargin < 4
    str_y = [];
end

if nargin < 5
    str_z = [];
end

if nargin < 6
    str_legend = [];
end

if nargin < 7
    legend_location = 'Best';
end

if 7 < nargin
    error('This function takes <=7 arguments. To be extended.')
end

%% annotate
fontsz = 15;

if ~isempty(str_title)
    title(ca, str_title, 'Interpreter', 'Latex', 'Fontsize', fontsz)
end

if ~isempty(str_x)
    corfnt = correct_fontsz(str_x, fontsz);
    xlabel(ca, str_x, 'Interpreter', 'Latex', 'Fontsize', corfnt)
end

if ~isempty(str_y)
    corfnt = correct_fontsz(str_y, fontsz);
    ylabel(ca, str_y, 'Interpreter', 'Latex', 'Fontsize', corfnt)
end

if ~isempty(str_z)
    corfnt = correct_fontsz(str_z, fontsz);
    zlabel(ca, str_z, 'Interpreter', 'Latex', 'Fontsize', corfnt)
end

if ~isempty(str_legend)
    legend(ca, str_legend, 'Location', legend_location,...
        'Interpreter', 'Latex', 'Fontsize', fontsz);
end

% double fontsize in case fractions are included in the string
function [new_fontsz] = correct_fontsz(str, fontsz)
if strfind(str, '\frac')
    new_fontsz = fontsz;
else
    new_fontsz = fontsz;
end
