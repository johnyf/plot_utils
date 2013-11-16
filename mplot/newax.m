function [ax, fig] = newax(fig, subplot_number, mode)
% create (possibly multiple) new axes handles
%
%usage
%-----
%   [ax, fig] = newax
%   ax = newax(fig, subplot_number)
%   
%input
%-----
%   fig = figure object handle
%   subplot_number = either number of subplots, or [1 x 2] matrix of
%                    subplot layout
%   mode = ['matrix'] | 'vec'
%
%output
%------
%   ax = handles of axes objects, either vector or matrix,
%        depending on 'mode' above
%   fig = parent figure handle
%
%about
%-----
% 2012.01.02 (c) Ioannis Filippidis, jfilippidis@gmail.com
% See also axes

% which figure ?
if nargin < 1
    fig = figure;
elseif isempty(fig)
    fig = figure;
end

% how many subplots ?
if nargin < 2
    subplot_number = 1;
end

if nargin < 3
    mode = 'matrix';
end

% single axes ?
if isscalar(subplot_number) && (subplot_number == 1)
    ax = axes('Parent', fig);
    return
end

% layout specified ?
if ~isscalar(subplot_number)
    subplot_layout = subplot_number;
    subplot_number = prod(subplot_number);
else
    subplot_layout = [1, subplot_number];
end

% layout reasonable ?
if size(subplot_layout, 1) ~= 1
    error('newax:layout', 'Subplot layout should be a [1 x 2] matrix.')
end

% create multiple subplots
nv = subplot_layout(1, 1);
nh = subplot_layout(1, 2);

ax = nan(1, subplot_number);
for i=1:subplot_number
    ax(1, i) = subplot(nv, nh, i, 'Parent', fig);
end

if strcmp(mode, 'matrix') == 1
    ax = reshape(ax, nv, nh);
elseif strcmp(mode, 'linear') ~= 1
    error('Unknown mode')
end
