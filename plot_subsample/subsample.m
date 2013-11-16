function [x] = subsample(x, ntotal, dim, metric)
% Keep ntotal elements of x along dimension dim.
%
% Default method is to keep every Nth element, such that the result has
% ntotal elements.
%
% Better results for curves achieved using arclength metric.
% This keeps ntotal points which are equidistantly distributed wrt the
% curve's arclength between them.
%
% If another metric is desired (e.g. x = [n x n x k] is a stack of matrices
% and their distances are measured by the Frobenius norm), then provide it
% in argument 4 (in the example: metric = [1 x 1 x (k-1)] are the distances
% between successive elements along the 3rd dimension of x).
%
% usage
%   x = SUBSAMPLE(x)
%   x = SUBSAMPLE(x, ntotal, dim, metric)
%
% input
%   x = matrix to subsample
%     = [n1 x n2 x ... x nK]
%
% optional input
%   ntotal = [100] total number of elements to sample from x
%   dim = [2] dimension of x along which to subsample
%         (i.e., within that slice)
%   metric = ['index'] choose method of subsampling,
%            or provide inter-element distances
%          = 'index' | 'arclength' | [1 x 1 x ... x n_dim x ... 1]
%
% note
%   if metric == 'arclength', then x = [#dim x #pnts]
%
% output
%   x = subsample x
%     = [num1(x), num2(x), ..., num(k-1)(x), ntotal, num(k+1)(x), ... ]
%       where numj(x) is size(x, j) and k=dim, the 3rd argument
%
% 2013.02.03 (c) Ioannis Filippidis, jfilippidis@gmail.com
%
% See also 
%   plot_subsample
%   plotmd_subsample
%   plot_fewer_markers
%   plotmd_fewer_markers
%   plot_trajectory
%   test_inversion_diffeo

%% input
if nargin < 3
    dim = 2;
end

if nargin < 4
    metric = 'index';
end

n = size(x, dim);

default_n = 100;
if nargin < 2
    ntotal = min(n, default_n); % avoid strange things
end

%% calc indices
if ischar(metric)
    if strcmp(metric, 'index')
        idx = round(linspace(1, n, ntotal) );
    elseif strcmp(metric, 'arclength')
        % too large ?
        if n > 10000
            warning('subsample:n', 'Too large # of vectors, using for loop.')
            usefor = 1;
        else
            usefor = 0;
        end
        
        dim = 2;
        [L, dLi] = arclength(x);
        Li = cumsum(dLi);
        Li_desired = linspace(0, L, ntotal);
        
        % forloop or not ?
        if usefor == 0
            d = vdistance(Li, Li_desired);
            [~, idx] = min(d, [], 1);
        elseif usefor == 1
            idx = arclength_using_for(Li, Li_desired);
        end
    else
        error(['Unknown metric: ', metric] )
    end
else
    %Li = cumsum(metric, dim);
    %L = max_cell({Li} );
    error('code to be completed.')
end

%% unique and missing ratio
n_non_unique = size(idx, 2);
idx = unique(idx);
n_unique = size(idx, 2);

if strcmp(metric, 'arclength')
    disp(['Unique/Non-Unique ratio: r = ',...
                num2str(100*n_unique/n_non_unique), '%'] )
    disp(['Approximating with: n = ', num2str(n_unique), ' points'] )
end

%% check #dims
max_ndim = 15;
ndim = ndims(x);
if ndim > max_ndim
    error(['larger than 15 dimensions not supported',...
           ' (just edit the code and add :)'] )
end

%% subsample
order = [dim, omit(dim, 1:ndim) ];
x = permute(x, order);
x = x(idx, :, :, :, :, :, :, :, :, :, :, :, :, :, :); % max ndim:edit here
x = ipermute(x, order);

function [idx] = arclength_using_for(Li, Li_desired)
ntotal = size(Li_desired, 2);
idx = nan(1, ntotal);
for i=1:ntotal
    curLi_desired = Li_desired(1, i);
    d = vdistance(curLi_desired, Li);
    [~, idx(1, i) ] = min(d);
end
