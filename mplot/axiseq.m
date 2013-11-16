function [] = axiseq(ax)
% Wrapper for axis(ax, 'equal') to avoid rewriting it.
%
% usage
%   AXISEQ(ax)
%
% input
%   ax = axes object handle
%
% 2013.02.04 (c) Ioannis Filippidis, jfilippidis@gmail.com

if nargin < 1
    ax = gca;
end

for i=1:size(ax, 2)
    axis(ax(1, i), 'equal')
end
