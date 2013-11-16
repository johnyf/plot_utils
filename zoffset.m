function [x] = zoffset(x, zoff)
%ZOFFSET    change z component of column vectors x
%   ZOFFSET(X, ZOFF) sets the Z components of the column vectors in matrix
%   X equal to ZOFF. For scalar ZOFF all vectors will have the same Z
%   value. If ZOFF is a row array, then its content become the Z components
%   of the column vectors in matrix X.
%
% input
%   x = matrix of column vectors
%     = [3 x #points]
%   zoff = scalar or
%     = [1 x #points]
%
% output
%   x = [x(1:2, :), zoff];
%       (if isscalar(zoff) then zoff = zoff *ones(1, size(x, 2) ) above)
%
% File:      zoffset.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.01.22 - 
% Language:  MATLAB R2011b
% Purpose:   vectically offset a curve
% Copyright: Ioannis Filippidis, 2012-

[nx, mx] = size(x);
[nz, mz] = size(zoff);

% columns same ?
if (mz ~= 1) && (mx ~= mz)
    error(['The number of column vectors in matrix x is: ', num2str(mx),...
           ', different from the number of columns in row array z, ',...
           'which is:', num2str(mz), '.'] )
end

% z rows ok ?
if nz ~= 1
    error('z does not have one row.')
end

% x is 2D ?
if 2 < nx
    warning('Overwriting dimension 3 of column vectors in matrix x.')
end

x(3, :) = zoff;
