function limit = set_plot_const(lengths, varargin)
        % Changing values back for clarity
        a = lengths(1);
        b = lengths(2);
        cx = lengths(3);
        cy = lengths(4);
        h = lengths(5);
        
        % set size of figure
        x_lim = (cx/2) + a;
        y_lim = (cx/2) + a;
        
        if nargin == 2
            app = varargin{1};
            cla(app);
            ylim(app, [-y_lim, y_lim]);
            xlim(app, [-x_lim, x_lim]);
        else
            cla reset;
            set(gca, 'XLim', [-x_lim, x_lim], 'YLim', [-y_lim, y_lim]);
        end
        
        limit = [x_lim, y_lim];
end