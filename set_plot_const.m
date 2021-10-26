function set_plot_const(lengths)
        % Changing values back for clarity
        a = lengths(1);
        b = lengths(2);
        cx = lengths(3);
        cy = lengths(4);
        h = lengths(5);

        % reset figure
        cla reset;

        % set size of figure
        x_lim = (cx/2) + a;
        y_lim = (cx/2) + a;
        set(gca, 'XLim', [-x_lim, x_lim], 'YLim', [-y_lim, y_lim]);
end