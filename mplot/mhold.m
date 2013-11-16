function [] = mhold(multiax, onoff)
%MHOLD(multiax, onoff)  set hold state of multiple axes.
%   VHOLD(multiax, onoff) is a vectorized version of function hold.
%   It sets the states of multiple axes objects with handles in matrix 
%   multiax, to the states provided in onoff. Argument onoff can be a
%   single string, 'on' or 'off', setting all the axes to that hold state,
%   or a cell matrix of strings 'on', 'off', setting individual axes to
%   (possibly) different states. Note that in the second case, matrix
%   multiax and cell matrix onoff should have the same size, i.e.,
%   size(multiax) should equal size(onoff), if onoff is a cell matrix.
%
% usage
%   MHOLD(multiax, onoff)
%
% input
%   multiax = matrix of handles to axes objects
%           = [ax11, ax12, ..., ax1m;
%              ax21, ax22, ..., ax2m;
%              :     :     :    :
%              axn1, axn2, ..., axnm];
%   onoff = hold states for axes objects with handles in array multiax
%         = 'on' (to set all axes objects hold states to 'on') |
%         = 'off' (to set all axes objects hold states to 'off') |
%         = {'on', 'off', 'off', ..., } (to set individual hold states)
%
% See also HOLD.
%
% File:      vhold.m
% Author:    Ioannis Filippidis, jfilippidis@gmail.com
% Date:      2012.02.19 - 2012.05.10
% Language:  MATLAB R2012a
% Purpose:   vectorized hold = set the hold states of multiple axes objects
% Copyright: Ioannis Filippidis, 2012-

% axes handle provided ?
if nargin < 1
    multiax = gca;
end

% desired hold state provided ?
if nargin < 2
    onoff = 'on';
end

n = size(multiax, 1);
m = size(multiax, 2);

if ischar(onoff)
    state = repmat({onoff}, n, m);
elseif iscell(onoff)
    s = size(onoff);
    if ~isequal(s, [n, m] )
        error(['Matrix of axes handles "multiax" and of axes hold ',...
               'states "onoff" have unequal sizes.'] )
    end
    state = onoff;
end

for i=1:n
    for j=1:m
        curax = multiax(i, j);
        curstate = state{i, j};
        hold(curax, curstate)
    end
end
