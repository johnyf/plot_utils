function [] = plot_signals_comparison(fig, y1, y2, style1, style2)
% input
%   fig = axes or figure object handle
%   y1 = experimental trajectories
%      = {1 x #experiments}
%      = {[#dim x #points], ... }
%   y2 = generated trajectories
%      = {1 x #experiments}
%      = {[#dim x #points], ... }
%   style1 = style of y1 lines, e.g. 'ro-'
%   style2 = style of y2 lines
%
% usage
%   plot_signals_comparison(fig, y1, y2)
%   plot_signals_comparison(fig, y1, y2, style1, style2)
%
% Caution: Both y1 and y2 must have the same number of points in
%          corresponding trajectories. Therefore, it is meaningful only
%          for simultaneous signals.

%% input
if ~iscell(y1)
    error('Not a cell array.')
end

n = size(y1, 2);
if size(y2, 2) ~= n
    error('Different number of experiments provided in y1 and y2.')
end

if nargin < 4
    style1 = 'b-';
    style2 = 'r-';
end

%% plot
for i=1:n
    cury1 = y1{1, i};
    cury2 = y2{1, i};
    
    ax = plot_signal_comparison(fig, cury1, cury2, style1, style2);
    vhold(ax, 'on')
end
