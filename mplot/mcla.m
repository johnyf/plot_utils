function [] = mcla(ax, varargin)

for i=1:size(ax, 2)
    cla(ax(1, i), varargin{:} )
end
