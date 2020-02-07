np  = 20;

figure
set(gcf, 'Units', 'centimeters', 'PaperUnits', 'centimeters', 'Position', [5, 5, 10, 8], 'PaperPositionMode', 'auto');

imWidth = 0.83;
xOffset = 0.15;
yOffset = 0.15;
imHeight = 0.8;
subplot('Position', [xOffset yOffset imWidth imHeight]);
fs = 8;
hold on

X = 1:np;
[E S T] = getEfficiency('pec', np);
T = T./T(1);
bar(X, T); %, 'Marker', '+', 'LineWidth',1, 'Color',[0 0 0], 'Markersize', 4);
% [E S] = getEfficiency('diel', np);
% plot(X, S, 'Marker', 'o', 'LineWidth',1, 'Color',[1 0 0], 'Markersize', 4);
% [E S] = getEfficiency('diel4', np);
% plot(X, S, 'LineStyle', '--', 'LineWidth',1, 'Color',[0 1 0], 'Markersize', 4);
% [E S] = getEfficiency('diel9', np);
% plot(X, S, 'LineStyle', '-.', 'LineWidth',1, 'Color',[0 0 1]);
% [E S] = getEfficiency('diel16', np);
% plot(X, S, 'LineStyle', ':', 'LineWidth',1, 'Color',[1 0 1]);

xlabel('Number of processors','FontSize', fs)
xlim([1 1]);
ylabel('Parallel Efficiency','FontSize', fs)
ylim([0.5 np]);
set(gca, 'Units', 'centimeters','box', 'on', 'FontSize', fs);

legend('Ideal case', 'Single PEC', 'Single dielectric', '2x2 dielectric', '3x3 dielectric', '4x4 dielectric', 2);
