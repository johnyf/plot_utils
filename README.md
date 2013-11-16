# Plotting Utilities for MATLAB

## Summary
Vectorized and other convenience plotting functions.
Licensed under the 2-clause BSD.

## Description
These functions were developed over time to support my research.
The vectorized ones aim to make vector field codes brief, coordinate-free, clear and readable.
The more interesting are:

- `plotmd`, `quivermd`, `textmd` for common 2D and 3D calls, no name headaches with MATLAB calls, clean multi-dim lib, some previously published [here](http://www.mathworks.com/matlabcentral/fileexchange/34731-plot-23d-points) and [here](http://www.mathworks.com/matlabcentral/fileexchange/35224-plot-23d-vectors)
- `vsurf`, `vcontour`, `vcontourf` and `vezsurf`, `vezcontour`, `ezquiver` for vectorized surf, contour plots using a matrix of column vectors (points) and its mesh size
- `plot_scalings` for auto scaling fig based on contents, good for publication-ready results
- `plot_subsample` functions to reduce the number of curve markers, w/o reducing curve fidelity, this aims to avoid huge image files that lead to `PDF` file sizes rejected when uploading to conference servers
- `tex_plot_annot` for `LaTeX` axis labels, title and legend, previously published [here](http://www.mathworks.com/matlabcentral/fileexchange/35141-latex-plot-annotation)
- `plotidy` shorthand to auto-scale, `LaTeX`-annotate and grid at once
- `assign_cmaps` to set different colormaps for two sets of surfaces
- `colorbar_annotated` to add units to the colorbar
- take and restore hold to add graphics objects w/o affecting current fig hold status, previously published [here](http://www.mathworks.com/matlabcentral/fileexchange/36641-take-restore-hold)
- vectorized `grid`, `hold`, `cla`, `view` for managing multiple axes at once, some previously published [here](www.mathworks.com/matlabcentral/fileexchange/36643-vectorized-hold)
- `newax` to create multiple new axes
- `sloc_pie` for [SLOC](http://en.wikipedia.org/wiki/Source_lines_of_code) pie plots of results returned by [`CLOC`](http://cloc.sourceforge.net/)

## Installation
Add the directory tree of this package to your MATLAB path.
Some functions have [fex](http://www.mathworks.com/matlabcentral/) dependencies.
No dependency is OS-specific.
