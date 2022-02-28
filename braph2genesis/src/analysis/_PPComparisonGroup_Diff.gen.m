%% ¡header!
PPComparisonGroup_Diff < PlotPropMatrix (pr, plot property of comparison group difference) is a plot of comparison group difference.

%%% ¡description!
PPComparisonGroupDiff plots a Comparison Group Difference.

CALLBACKS - These are callback functions:

    pr.<strong>cb_bring_to_front</strong>() - brings to the front the measure figure and its settings figure
    pr.<strong>cb_hide</strong>() - hides the measure figure and its settings figure
    pr.<strong>cb_close</strong>() - closes the measure figure and its settings figure

%%% ¡seealso!
GUI, PlotElement, PlotProp, PlotPropMatrix, ComparisonGroup.

%% ¡properties!
p
comparison_tbl
slider
second_slider
slider_text
second_slider_text
f_br
br_type

%% ¡methods!
function h_panel = draw(pr, varargin)
    %DRAW draws the idict for group ensemble property graphical panel.
    %
    % DRAW(PR) draws the idict property graphical panel.
    %
    % H = DRAW(PR) returns a handle to the idict property graphical panel.
    %
    % DRAW(PR, 'Property', VALUE, ...) sets the properties of the graphical
    %  panel with custom property-value couples.
    %  All standard plot properties of uipanel can be used.
    %
    % It is possible to access the properties of the various graphical
    %  objects from the handle to the brain surface graphical panel H.
    %
    % see also update, redraw, refresh, settings, uipanel, isgraphics.

    pr.p = draw@PlotPropMatrix(pr, varargin{:});

    % retrieves the handle of the table
    children = get(pr.p, 'Children');
    for i = 1:1:length(children)
        if check_graphics(children(i), 'uitable')
            pr.comparison_tbl = children(i);
        end
    end

    % create panel with slider
    el = pr.get('EL');
    prop = pr.get('PROP');
    value = el.get(prop);
    L = size(value, 1);
    L2 = size(value, 2);

    % set on first layer
    pr.slider = uicontrol( ...
        'Parent', pr.p, ...
        'Style', 'slider', ...
        'Units', 'characters', ...
        'Visible', 'off', ...
        'Value', max(1, L), ...
        'Min', 1, ...
        'Max', L, ...
        'SliderStep', [1 1], ...
        'Callback', {@cb_slider} ...
        );
    pr.slider_text = uicontrol(...
        'Parent', pr.p, ...
        'Style', 'text', ...
        'Units', 'characters', ...
        'HorizontalAlignment', 'center', ...
        'Visible', 'off', ...
        'FontUnits', BRAPH2.FONTUNITS, ...
        'FontSize', BRAPH2.FONTSIZE, ...
        'FontWeight', 'bold', ...
        'String', '', ...
        'BackgroundColor', pr.get('BKGCOLOR') ...
        );

        function cb_slider(~, ~)
            pr.update()
        end

    if L2 > 1
        pr.second_slider = uicontrol( ...
            'Parent', pr.p, ...
            'Style', 'slider', ...
            'Units', 'characters', ...
            'Value', 1, ...
            'Min', 1, ...
            'Max', L2, ...
            'SliderStep', [1 1], ...
            'Callback', {@cb_slider_2} ...
            );
        pr.second_slider_text = uicontrol(...
            'Parent', pr.p, ...
            'Style', 'text', ...
            'Units', 'characters', ...
            'HorizontalAlignment', 'center', ...
            'FontUnits', BRAPH2.FONTUNITS, ...
            'FontSize', BRAPH2.FONTSIZE, ...
            'FontWeight', 'bold', ...
            'String', '', ...
            'BackgroundColor', pr.get('BKGCOLOR') ...
            );
    end

        function cb_slider_2(~, ~)
            pr.update()
        end

    if Measure.is_nodal(el.get('Measure'))
        brain_view = uicontrol('Parent', pr.p, ...
            'Style', 'pushbutton', ...
            'Units', 'normalized', ...
            'Visible', 'on', ...
            'TooltipString', 'Open the comparison in a Brain View plot.', ...
            'String', 'Plot Brain View', ...
            'Position', [.02 .88 .3 .06], ...
            'Callback', {@cb_brainview});
    end

        function cb_brainview (~, ~)
            pr.cb_brain_view_fig();
        end

    % output
    if nargout > 0
        h_panel = pr.p;
    end
end
function update(pr)
    %UPDATE updates the content of the property graphical panel.
    %
    % UPDATE(PR) updates the content of the property graphical panel.
    %
    % See also draw, redraw, refresh.

    update@PlotProp(pr)

    el = pr.get('EL');
    prop = pr.get('PROP');
    value = el.getr(prop);
    if el.get('C').get('A1').getPropNumber() > 8
        label = el.get('C').get('A1').getPropTag(9);
    else
        label = 'Weighted';
        set(pr.slider, ...
            'Enable', 'off');
    end
    fdr_q_value = 0.05;
    fdr_style = [1 1 0];

    if el.isLocked(prop)
        set(pr.comparison_tbl, ...
            'Enable', pr.get('ENABLE'), ...
            'ColumnEditable', false ...
            )
    end

    if  size(value, 2) > 2
        set(pr.slider_text, ...
            'String', [label ' ' num2str(round(get(pr.slider, 'Value')))]);
        set(pr.second_slider_text, ...
            'String', [label ' ' num2str(round(get(pr.second_slider, 'Value')))]);

        % set p values mask
        tmp_value = value{round(get(pr.slider, 'Value')), round(get(pr.second_slider, 'Value'))};
        p1 = el.get('P1');
        p1 = p1{round(get(pr.slider, 'Value')), round(get(pr.second_slider, 'Value'))};

        if Measure.is_nodal(el.get('measure'))
            p1 = p1';
            [~, mask] = fdr(p1, fdr_q_value);
            mask = mask';
        else
            [~, mask] = fdr(p1, fdr_q_value);
        end
        
        tmp_value = num2cell(tmp_value);

        for i = 1:size(tmp_value, 1)
            for j = 1:size(tmp_value, 2)
                if mask(i, j)
                    clr = dec2hex(round(fdr_style * 255), 2)';
                    clr = ['#'; clr(:)]';

                    tmp_value(i, j) = {strcat(...
                        ['<html><body bgcolor="' clr '" text="#000000" width="100px">'], ...
                        num2str(tmp_value{i, j}))};
                end
            end
        end

        set(pr.comparison_tbl, ...
            'Data', tmp_value, ...
            'ColumnFormat', repmat({'long'}, 1, size(el.get(prop), 2)), ...
            'ColumnEditable', false)
    else
        set(pr.slider_text, ...
            'String', [label ' ' num2str(round(get(pr.slider, 'Value')))]);

        % set p values mask
        tmp_value = value{round(get(pr.slider, 'Value'))};
        p1 = el.get('P1');
        p1 = p1{round(get(pr.slider, 'Value'))};

        if Measure.is_nodal(el.get('measure'))
            p1 = p1';
            [~, mask] = fdr(p1, fdr_q_value);
            mask = mask';
        else
            [~, mask] = fdr(p1, fdr_q_value);
        end
        
        tmp_value = num2cell(tmp_value);

        for i = 1:size(tmp_value, 1)
            for j = 1:size(tmp_value, 2)
                if mask(i, j)
                    clr = dec2hex(round(fdr_style * 255), 2)';
                    clr = ['#'; clr(:)]';

                    tmp_value(i, j) = {strcat(...
                        ['<html><body bgcolor="' clr '" text="#000000" width="100px">'], ...
                        num2str(tmp_value{i, j}))};
                end
            end
        end

        set(pr.comparison_tbl, ...
            'Data', tmp_value, ...
            'ColumnFormat', repmat({'long'}, 1, size(el.get(prop), 2)), ...
            'ColumnEditable', false)
    end

    value = el.getr(prop);
    if isa(value, 'Callback')
        set(pr.comparison_tbl, ...
            'Enable', pr.get('ENABLE'), ...
            'ColumnEditable', false ...
            )
    end
end
function redraw(pr, varargin)
    %REDRAW redraws the element graphical panel.
    %
    % REDRAW(PR) redraws the plot PR.
    %
    % REDRAW(PR, 'Height', HEIGHT) sets the height of PR (by default HEIGHT=3.3).
    %
    % See also draw, update, refresh.
    
    [h, varargin] = get_and_remove_from_varargin(1.8, 'Height', varargin);
    [Sh, varargin] = get_and_remove_from_varargin(2.0, 'SHeight', varargin);
    [Th, varargin] = get_and_remove_from_varargin(2.0, 'THeight', varargin);
    [Dh, varargin] = get_and_remove_from_varargin(20, 'DHeight', varargin);
    
    
    el = pr.get('EL');
    prop = pr.get('PROP');
    value = el.get(prop);
    L = size(value, 1);
    L2 = size(value, 2);
    
    if L2 > 1
        pr.redraw@PlotProp('Height', h + Sh + Sh + Th + Th + Dh, varargin{:})
        set(pr.slider, ...
            'Units', 'normalized', ...
            'Visible', 'on', ...
            'Position', [.01 (Sh+Th+Dh)/(h+Sh+Sh+Th+Th+Dh) .97 (Th/(h+Sh+Sh+Th+Th+Dh)-.02)] ...
            );
        
        set(pr.slider_text, ...
            'Units', 'normalized', ...
            'Visible', 'on', ...
            'Position', [.01 (Sh+Th+Th+Dh)/(h+Sh+Sh+Th+Th+Dh) .97 (Th/(h+Sh+Sh+Th+Th+Dh)-.02)] ...
            );
        
        set(pr.second_slider, ...
            'Units', 'normalized', ...
            'Position', [.01 (Dh)/(h+Sh+Sh+Th+Th+Dh) .97 (Th/(h+Sh+Sh+Th+Th+Dh)-.02)] ...
            );
        
        set(pr.second_slider_text, ...
            'Units', 'normalized', ...
            'Position', [.01 (Dh+Th)/(h+Sh+Sh+Th+Th+Dh) .97 (Th/(h+Sh+Sh+Th+Th+Dh)-.02)] ...
            );
        
        set(pr.comparison_tbl, ...
            'Visible', 'on', ...
            'Units', 'normalized', ...
            'Position', [.01 .02 .97 (Dh/(h+Sh+Sh+Th+Th+Dh)-.02)] ...
            )
    elseif L
        pr.redraw@PlotProp('Height', h + Sh + Th + Dh, varargin{:})
        set(pr.slider, ...
            'Units', 'normalized', ...
            'Visible', 'on', ...
            'Position', [.01 Dh/(h+Sh+Th+Dh) .97 (Th/(h+Sh+Th+Dh)-.02)] ...
            );
        
        set(pr.slider_text, ...
            'Units', 'normalized', ...
            'Visible', 'on', ...
            'Position', [.01 (Th+Dh)/(h+Sh+Th+Dh) .97 (Th/(h+Sh+Th+Dh)-.02)] ...
            );
        
        set(pr.comparison_tbl, ...
            'Visible', 'on', ...
            'Units', 'normalized', ...
            'Position', [.01 .02 .97 (Dh/(h+Sh+Th+Dh)-.02)] ...
            )
    else
        pr.redraw@PlotProp(varargin{:})
    end
     if ~pr.get_button_condition
         set(pr.slider, ...
            'Visible', 'off' ...
            );

        set(pr.slider_text, ...
            'Visible', 'off' ...
            );

        set(pr.table_value, ...
            'Visible', 'off' ...
            )
    end
end
function cb_brain_view_fig(pr)
    f_pg = ancestor(pr.p, 'Figure');
    f_ba_x = Plot.x0(f_pg, 'pixels');
    f_ba_y = Plot.y0(f_pg, 'pixels');
    f_ba_w = Plot.w(f_pg, 'pixels');
    f_ba_h = Plot.h(f_pg, 'pixels');

    screen_x = Plot.x0(0, 'pixels');
    screen_y = Plot.y0(0, 'pixels');
    screen_w = Plot.w(0, 'pixels');
    screen_h = Plot.h(0, 'pixels');

    x = f_ba_x + f_ba_w;
    h = f_ba_h / 1.5;
    y = f_ba_y + f_ba_h - h;
    w = screen_w - x;
    
    if isempty(pr.f_br) || ~check_graphics(pr.f_br, 'figure')
        pr.f_br = figure( ...
            'NumberTitle', 'off', ...
            'Units', 'normalized', ...
            'MenuBar', 'none', ...
            'Toolbar', 'figure', ...
            'DockControls', 'off', ...
            'Position', [x/screen_w y/screen_h w/screen_w h/screen_h], ...
            'CloseRequestFcn', {@cb_f_br_close} ...
            );
        set_braph2_icon(pr.f_br)
        menu_about = BRAPH2.add_menu_about(pr.f_br);
        
        ui_toolbar = findall(pr.f_br, 'Tag', 'FigureToolBar');
        delete(findall(ui_toolbar, 'Tag', 'Standard.NewFigure'))
        delete(findall(ui_toolbar, 'Tag', 'Standard.FileOpen'))
        
        el = pr.get('EL');
        prop = pr.get('PROP');
        
        g = el.get('c').get('a1').get('g');
        
        if isequal(g.getClass(), 'MultigraphBUD') || isequal(g.getClass(), 'MultiplexBUD')
            type = 'Densities';
        elseif isequal(g.getClass(), 'MultigraphBUT') || isequal(g.getClass(), 'MultiplexBUT')
            type = 'Thresholds';
        else
            type = 'Weighted';
        end
        
        prop_tag = el.getPropTag(prop);
        
        pbv = PlotBrainView('COMP', el, ...
            'Atlas', g.get('brainatlas'), ...
            'PROPTAG', prop_tag, ...
            'Type', type);

        
        pbv.draw('Parent', pr.f_br );
        f_settings = pbv.settings();
        set(pr.f_br, 'UserData', pbv);
        set(f_settings, 'Position', [x/screen_w f_ba_y/screen_h w/screen_w (f_ba_h-h)/screen_h])
        f_settings.OuterPosition(4) = (f_ba_h-h)/screen_h;
        f_settings.OuterPosition(2) = f_ba_y/screen_h;
    else
        gui = get(pr.f_br, 'UserData');
        gui.cb_bring_to_front()
    end
    
    function cb_f_br_close(~, ~)
        delete(pr.f_br);
        pr.update()
    end

    pr.update()
end
function cb_bring_to_front(pr)
    %CB_BRING_TO_FRONT brings to front the figure and its settings figure.
    %
    % CB_BRING_TO_FRONT(PR) brings to front the figure and its
    %  settings figure.
    %
    % See also cb_hide, cb_close.

    % brings to front settings panel
    pr.cb_bring_to_front@PlotProp();
    
    % bring to front plot graph
    if check_graphics(pr.f_br, 'figure')
        gui = get(pr.f_br, 'UserData');
        gui.cb_bring_to_front()
    end      
end
function cb_hide(pr)
    %CB_HIDE hides the figure and its settings figure.
    %
    % CB_HIDE(PR) hides the figure and its settings figure.
    %
    % See also cb_bring_to_front, cb_close.

    % hides settings panel
    pr.cb_hide@PlotProp();
    
    % bring to front plot graph
    if check_graphics(pr.f_br, 'figure')
        gui = get(pr.f_br, 'UserData');
        gui.cb_hide();
    end 

end
function cb_close(pr)
    %CB_CLOSE closes the figure.
    %
    % CB_CLOSE(PR) closes the figure and its children figures.
    %
    % See also cb_bring_to_front, cd_hide.

    % close adj graph figure
    if ~isempty(pr.f_br) && check_graphics(pr.f_br, 'figure')
        delete(pr.f_br);
    end     
end
function state = get_button_condition(pr)
    % GET_BUTTON_CONDITION returns the calculate button state.
    %
    % STATE = GET_BUTTON_CONDITION(PR) returns the calculate button state.
    %
    % see also is_measure_calculated.

    plot_prop_children = get(pr.p, 'Children');
    state = 0; % calculated
    for i = 1:length(plot_prop_children)
        pp_c = plot_prop_children(i);
        if check_graphics(pp_c, 'pushbutton') && isequal(pp_c.Tag, 'button_calc')
            if isequal(pp_c.Enable, 'off')
                state = 1;  % not calculated
            end
        end
    end
end