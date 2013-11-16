function [] = offset_contour(ax, X, Y, Z, v, zoffset)
%
% See also SURFC3.
%
% offset level sets
% (calling countour(), the 'Zdata' property stores the source data,
% instead of the z coordinates of the created level sets,
% also note that using surfc does not provide a way to control the
% number of level sets)

[~, h] = contour3(ax, X, Y, Z, v);

for i = 1:length(h);
    Zdata = get(h(i), 'Zdata');
    newz = zoffset *ones(size(Zdata) );
    set(h(i), 'Zdata', newz);
end
