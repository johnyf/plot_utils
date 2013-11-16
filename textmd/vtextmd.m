function [] = vtextmd(ax, q, num, varargin)
%VTEXTMD    Add numbers as text to multiple 2/3D points.
%   VTEXTMD(ax, q, num) adds the numbers in the numeric array num as text
%   labels to the points with position vectors the columns of q.
%
% usage
%   vtextmd(ax, q)
%   vtextmd(ax, q, num, varargin)
%
% input
%   ax = axes object handle | []
%   q = point coordinates
%     = [#dim x #points]
%
% optional input
%   num = array of numbers to use for annotation
%       = [1 x #points]
%   varargin = additional arguments passed to text
%
% 2012.05.21 (c) Ioannis Filippidis, jfilippidis@gmail.com
%
% See also textmd, text, plotmd.

% axes ?
if isempty(ax)
    ax = gca;
end

% numbers ?
if nargin < 3
    num = 1:size(q, 2);
end

% plot
str = num2str(num.');
textmd(q, str, 'Parent', ax, varargin{:} )
