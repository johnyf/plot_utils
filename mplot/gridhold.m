function [] = gridhold(ax)
%GRIDHOLD   Grid and hold on for multiple axes handles.
%
% usage
%   GRIDHOLD(ax)
%
% input
%   ax = vector of axes object handles
%      = [1 x #axes]
%
% See also mgrid, mview.
%
% File:      gridhold.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.05.24
% Language:  MATLAB R2012a
% Copyright: Ioannis Filippidis, 2012-

if nargin < 1
    ax = gca;
end

for i=1:length(ax)
    grid(ax(i), 'on')
    hold(ax(i), 'on')
end
