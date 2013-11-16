function [ax] = plot_signal_comparison(fig, y1, y2, style1, style2)
% input
%   fig = axes or figure object handle
%   y1 = experimental trajectories
%      = [#dim x #points]
%   y2 = generated trajectories
%      = [#dim x #points]
%   style1 = style of y1 lines, e.g. 'ro-'
%   style2 = style of y2 lines
%
% usage
%   plot_signal_comparison(fig, y1, y2)
%   plot_signal_comparison(fig, y1, y2, style1, style2)
%
% Caution: Both y1 and y2 must have the same number of points in
%          corresponding trajectories. Therefore, it is meaningful only
%          for simultaneous signals.

%% input
nsignals = size(y1, 1);
if size(y2, 1) ~= nsignals
    error('#signals in x ~= #signals in y')
end

if nargin < 4
    style1 = 'b-';
    style2 = 'r-';
end

%% plot
ntimesteps = size(y1, 2);

t = 1:ntimesteps;
ax = nan(1, nsignals);
for i=1:nsignals
    curax = subplot(nsignals, 1, i, 'Parent', fig);
    cury1 = y1(i, :);
    cury2 = y2(i, :);
    
    plot(curax, t, cury1, style1)
    held = takehold(curax);
    plot(curax, t, cury2, style2)
    givehold(curax, held)
    
    ax(1, i) = curax;
end
