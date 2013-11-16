function [] = mview(ax, m)
%MVIEW  Set view settings for multiple axes.
%
% usage
%   MVIEW(ax, m)
%
% input
%   ax = multiple axes object handles
%      = [1 x #axes]
%   m = string
%
% See also mgrid, gridhold.
%
% File:      mview.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.09.17
% Language:  MATLAB R2012a
% Copyright: Ioannis Filippidis, 2012-

nax = size(ax, 2);
for i=1:nax
    curax = ax(1, i);
    view(curax, m)
end
