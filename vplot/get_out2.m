function [g] = get_out2(x, func, varargin)
% useful for getting the gradient as first output
%
% File:      get_out2.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.07.13
% Language:  MATLAB R2012a
% Purpose:   get 2nd output argument, useful for gradient info
% Copyright: Ioannis Filippidis, 2012-

[~, g] = feval(func, x, varargin{:} );
