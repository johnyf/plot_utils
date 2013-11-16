% example using plot_subsample, plotmd_subsample
%
% 2013.01.30 Copyright Ioannis Filippidis
%
% See also plot_subsample, plotmd_subsample, plot, plotmd.

npnt = 1000;
n_sample = 10;

t = linspace(0, 4*pi, npnt);

fig = figure;
ax = newax(fig, [1, 2] );
    mhold(ax, 'on')

%% 2d example
x = t;
y = sin(t);

plot(ax(1), x, y, 'b-')
plot_subsample(ax(1), x, y, n_sample, 'r--o')
    plotidy2(ax(1) )

%% 3d example
x = [t; cos(t); sin(t) ];

plotmd(ax(2), x, 'b-')
plotmd_subsample(ax(2), x, n_sample, 'r--o')
    plotidy(ax(2) )
    axis(ax(2), 'equal')
