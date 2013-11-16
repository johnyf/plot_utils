function [varargout] = textmd(x, str, varargin)
%TEXTMD     Text annotation in 2D or 3D.
%
% usage
%   TEXTMD(x, str, varargin)
%
% input
%   x = point where text is placed
%     = [#dim x 1]
%   str = annotation text string
%
% See also PLOTMD, QUIVERMD.
%
% File:      textmd.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.01.22 - 
% Language:  MATLAB R2011b
% Purpose:   multi-dimensional text annotation
% Copyright: Ioannis Filippidis, 2012-

if any(strcmp('Parent', varargin) )
    idx = find(strcmp('Parent', varargin) );
    ax = varargin{idx +1};
    nax = size(ax, 2);
else
    nax = 1;
end

if nax > 1
    for i=1:nax
        curax = ax(1, i);

        v = varargin;
        v{idx+1} = curax;

        textmd(x, str, v{:} )
    end
    return
end

ndim = size(x, 1);

if ndim == 2
    y = x(2, :);
    x = x(1, :);
    h = text(x, y, str, varargin{:} );
elseif ndim == 3
    z = x(3, :);
    y = x(2, :);
    x = x(1, :);
    h = text(x, y, z, str, varargin{:} );
end

if nargout == 1
    varargout{1, 1} = h;
end
