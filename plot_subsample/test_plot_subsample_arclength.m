% Visually compare plotmd, plotmd_subsample, plotmd_subsample_arclength.
%
% 2013.02.15 (c) Ioannis Filippidis, jfilippidis@gmail.com
%
% See also
%   subsample
%   plot_subsample_arclength
%   plotmd_subsample_arclength.

cls

t = 2*pi ./exp(0:0.1:100);
x = [cos(t); sin(t) ];

fig = figure;
ax = newax(fig, [1, 3] );
    mhold(ax, 'on')
plotmd(ax, x, 'ro-')
plotmd_subsample(ax(2), x, 100, 'm--*')
plotmd_subsample_arclength(ax(3), x, 100, 'bs')
    supertitle(fig, 'Comparison: plotmd subsampling methods');
    stitle = {'plotmd', 'plotmd\_subsample', 'plotmd\_subsample\_arclength'};
    plotidy2(ax, '$x$', '$y$', stitle)
    axis(ax, 'image')
