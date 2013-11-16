% 12.07.2009 - 05.10.2009 (c) Ioannis Filippidis
% Purpose: Calculate & Apply Scalings to Graph

% axes' scalings
axs = get(gcf, 'Children');
pos = get(axs(1), 'Children');
X = get(pos, 'XData');
X_max = max([X{:}]);
X_min = min([X{:}]);
Y = get(pos, 'YData');
Y_max = max([Y{:}]);
Y_min = min([Y{:}]);
padding = 0.0; % empty space around plotted data for styling
total = padding * abs([X_max-X_min, Y_max-Y_min]);
scalings = [0 X_max+total(1) 0 Y_max+total(2)];
%axis equal % equal axis scales, CAUTION: if it is done, it must be done before applying scalings
%axis(scalings); % scaling set to the preferable as described above as described aboveas described above
described above
