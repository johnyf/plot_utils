function [] = plot_scalings(ax, border_padding_factor)
%PLOT_SCALINGS  Automatic plot scalings.
%   PLOT_SCALINGS gets the Children of the current figure plot's axes,
%   retrieves coordinate data and calculates their extremals to set the
%   appropriate scalings for the plot's axes.
%
%   When no BORDER_PADDING_FACTOR argument is provided, the default for 2D
%   plots is 0.1 and for 3D plots 0.
%   
%usage
%-----
%   plot_scalings
%   plot_scalings(ax)
%   plot_scalings(ax, border_padding_factor)
%
%input
%-----
%   ax = axes object handle
%   border_padding_factor = ratio of extra white space around axis contents
%
%about
%-----
% 2009.02.12 - 2012.06.11 (c) Ioannis Filippidis, jfilippidis@gmail.com
%
% See also COOR_EXTREMALS.

%% args
if (nargin < 0) || (2 < nargin)
    error('This function takes 0 or 2 arguments.')
end

if nargin < 1
    ax = gca;
end

if nargin < 2
    border_padding_factor = 0.1;
end

%% apply to multiple axes handles
for i=1:length(ax)
    plot_scalings_single_axis(ax(i), border_padding_factor)
end

function [] = plot_scalings_single_axis(ax, border_padding_factor)
%% empty plot ?
h = get(ax, 'children');
if isempty(h)
    warning('plot:empty', 'Empty axis contents (no children).')
    return
end

%% plot contents exist
[xyz_minmax, SDIM] = axes_extremal_xyz(ax);

coor_min = xyz_minmax(1:2:end);
coor_max = xyz_minmax(2:2:end);

%% calculate axis limits
% padding around extremal objects
total = border_padding_factor *norm(coor_max(1, 1:2) -coor_min(1, 1:2), 2);

% the array passed to axis(...) function, of the form: [xmin xmax ymin ymax]
scalings(1:2:2*SDIM) = coor_min -total;
scalings(2:2:2*SDIM) = coor_max +total;

%% apply axis limits & aspect ratio
switch SDIM
    case 2
        %disp('2D plot')
        view(ax, 2)
        %axis(ax, 'equal')
        axis(ax, 'auto')
        
        xlims = scalings(1, 1:2);
        if (norm(xlims) > 0) && ~any(isnan(xlims) )
            xlim(ax, scalings(1, 1:2) );
        end
        
        ylims = scalings(1, 3:4);
        if (norm(ylims) > 0) && ~any(isnan(ylims) )
            ylim(ax, scalings(1, 3:4) );
        end
        
        box(ax, 'on')
    case 3
        %disp('3D plot')
        xlim(ax, scalings(1, 1:2) );
        ylim(ax, scalings(1, 3:4) );
        zlim(ax, scalings(1, 5:6) );
        
        x_min = coor_min(1,1);
        x_max = coor_max(1,1);

        y_min = coor_min(1,2);
        y_max = coor_max(1,2);

        z_min = coor_min(1,3);
        z_max = coor_max(1,3);
        
        Dx = x_max -x_min;
        Dy = y_max -y_min;
        Dz = z_max -z_min;
        
        % no border_padding_factor?
        view(ax, 3)
        
        rx = Dz /Dx;
        ry = Dz /Dy;

        rmin = min([rx, ry] );
        aspect = [1, 1, rmin];
        daspect(ax, aspect)
        
        if nargin < 2
            axis(ax, 'tight')
        end
    otherwise
        msg = 'Cannot plot more than 3 dimensions in this universe.';
        warning('plot:dim', msg)
end
