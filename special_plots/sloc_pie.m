function [] = sloc_pie(sloc)
% Purpose: source lines of code pie chart
%
% sloc = [#code, #comments, #blanks]
%
% 2010.02.24 - 2011.01.09 (c) Ioannis Filippidis

all = sum(sloc, 2);
percent = 100 *sloc ./all;

code = sloc(1,1);
comment = sloc(1,2);
blank = sloc(1,3);

code_percent = percent(1,1);
comment_percent = percent(1,2);
blank_percent = percent(1,3);

names = {...
    {num2str(code), 'Source Code', [num2str(code_percent, 2), '%'] },...
    {num2str(comment), 'Comments', [num2str(comment_percent, 2), '%'] },...
    {num2str(blank), 'Blank', [num2str(blank_percent, 2), '%'] } };

pie3([code, comment, blank], [1 0 0], names);

colormap([ 194,214,155; 238,236,225; 253,233,217 ] /255)
36,225; 253,233,217 ] /255)
