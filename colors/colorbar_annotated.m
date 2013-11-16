function colorbar_annotated(unit)
%COLORBAR_ANNOTATED  creates a colorbar with string UNIT.
%
%   See also POSTPROCESSOR.
%
% File:         Colorbar_Annotated.m
% Programmer:   Ioannis Filippidis, jfilippidis@gmail.com
% Date:         2009.02.20
% Purpose:      Colorbar annotated with units string
% Copyright:    Ioannis Filippidis, 2010-

colorbar_object = colorbar('peer', gca, 'Location', 'EastOutside'); % create colorbar
set(get(colorbar_object, 'xlabel'), 'String', ['(' unit ')']); % annotate colorbar
ate colorbar
