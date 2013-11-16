function [] = textmd2(ax, x, string, varargin)
%textmd wrapper compatible with 
%
%usage
%-----
%   textmd2(ax, x, string, varargin)
%
%input
%-----
%   ax = axes object handle
%   x = coordinates of string position, see text
%   string = text annotation
%   varargin = directly passed to text
%
%about
%-----
%   2013.02.27 (c) Ioannis Filippidis
%
% See also textmd, text.

textmd(x, string, 'Parent', ax, varargin{:} )
