function [] = mgrid(ax, varargin)
%MGRID  Set grid for multiple axes.
%
% usage
%   MGRID(ax, varargin)
%
% input
%   ax = row vector of axes object handles
%      = [1 x #axes]
%   varargin = args passed to grid (same for each axis)
%            = 'on' | 'off' | anything valid for function grid.
%
% See also mview, gridhold.
%
% File:      mgrid.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.09.10
% Language:  MATLAB R2012a
% Copyright: Ioannis Filippidis, 2012-

% note
%   mfunc = multi-function, i.e., operates on multiple similar objects,
%           e.g. axes objects
%   vfunc = vectorised func, i.e., function which traditionally works with
%           matrices or iteratively and has been vectorized, either like
%           surf to work on vectors, or in the sense of parallelization.

n = length(ax);

for i=1:n
    grid(ax(i), varargin{:} )
end
