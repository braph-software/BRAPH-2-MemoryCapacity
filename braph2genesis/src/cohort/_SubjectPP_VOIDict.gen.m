%% ¡header!
SubjectPP_VOIDict < PanelProp (pr, VOI plot) plots the panel for a VOI dictionary.

%%% ¡description!
SubjectPP_VOIDict plots a VOI (variables of interest) dictionary using 
numeric editfields and drop-down lists.
It is intended to be used with the property VOI_DICT of Subject.

%%% ¡seealso!
Subject, uieditfield, uidropdown

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the VOI plot.
%%%% ¡default!
'SubjectPP_VOIDict'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the VOI plot.
%%%% ¡default!
'SubjectPP_VOIDict plots a VOI (variables of interest) dictionary using numeric editfields and drop-down lists.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the VOI plot.
%%%% ¡settings!
'SubjectPP_VOIDict'

%%% ¡prop!
ID (data, string) is a few-letter code for the VOI plot.
%%%% ¡default!
'SubjectPP_VOIDict ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the VOI plot.
%%%% ¡default!
'SubjectPP_VOIDict label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the VOI plot.
%%%% ¡default!
'SubjectPP_VOIDict notes'

%%% ¡prop!
EL (data, item) is the element.
%%%% ¡settings!
'Subject'

%%% ¡prop!
PROP (data, scalar) is the property number.
%%%% ¡default!
Subject.VOI_DICT

%%% ¡prop!
X_DRAW (query, logical) draws the property panel.
%%%% ¡calculate!
value = calculateValue@PanelProp(pr, PanelProp.X_DRAW, varargin{:}); % also warning
if value
    pr.memorize('HANDLES')
end

%%% ¡prop!
UPDATE (query, logical) updates the content and permissions of the table.
%%%% ¡calculate!
value = calculateValue@PanelProp(pr, PanelProp.UPDATE, varargin{:}); % also warning
if value
    sub = pr.get('EL');

    height = pr.get('HEIGHT_MIN');

    voi_dict = sub.get('VOI_DICT');
    handles = pr.get('HANDLES');
    for i = 1:1:voi_dict.get('LENGTH')
        voi = voi_dict.get('IT', i);
        
        if isa(voi, 'VOICategoric')
            height = height + pr.get('HEIGHT_VOI_DROPDOWN');

            dropdown = handles{i};
            
% % %             set(pr.get('DROPDOWN'), 'Value', el.get(prop))
% % % 
% % %             prop_value = el.getr(prop);
% % %             if el.isLocked(prop) || isa(prop_value, 'Callback')
% % %                 set(pr.get('DROPDOWN'), 'Enable', 'off')
% % %             end
        else % isa(voi, 'VOINumeric')
            height = height + pr.get('HEIGHT_VOI_EDITFIELD');
            
            editfield = handles{i};
            
% % %             set(pr.get('EDITFIELD'), 'Value', el.get(prop))
% % % 
% % %             prop_value = el.getr(prop);
% % %             if el.isLocked(prop) || isa(prop_value, 'Callback')
% % %                 set(pr.get('EDITFIELD'), ...
% % %                     'Editable', 'off', ...
% % %                     'Enable', pr.get('ENABLE') ...
% % %                     )
% % %             end
        end
    end
    
    pr.set('HEIGHT', height)
end

%%% ¡prop!
REDRAW (query, logical) resizes the property panel and repositions its graphical objects.
%%%% ¡calculate!
value = calculateValue@PanelProp(pr, PanelProp.REDRAW, varargin{:}); % also warning
if value
	w_p = get_from_varargin(w(pr.get('H'), 'pixels'), 'Width', varargin);
    
    sub = pr.get('EL');

    h = 0;
    
    voi_dict = sub.get('VOI_DICT');
    handles = pr.get('HANDLES');
    for i = voi_dict.get('LENGTH'):-1:1
        voi = voi_dict.get('IT', i);
        
        if isa(voi, 'VOICategoric')
            dropdown = handles{i};
            
            set(dropdown, 'Position', [s(.3) h+s(.3) .70*w_p s(1.75)])

            h = h + pr.get('HEIGHT_VOI_DROPDOWN');
        else % isa(voi, 'VOINumeric')
            editfield = handles{i};
            
            set(editfield, 'Position', [s(.3) h+s(.3) .25*w_p s(1.75)])
            
            h = h + pr.get('HEIGHT_VOI_EDITFIELD');
        end
    end
end

%%% ¡prop!
DELETE (query, logical) resets the handles when the panel is deleted.
%%%% ¡calculate!
value = calculateValue@PanelProp(pr, PanelProp.DELETE, varargin{:}); % also warning
if value
    pr.set('HANDLES', Element.getNoValue())
end

%% ¡props!

%%% ¡prop!
HEIGHT_MIN (gui, scalar) is the default (minumum) height.
%%%% ¡default!
s(2)
 
%%% ¡prop!
HEIGHT_VOI_EDITFIELD (gui, scalar) is the height of each VOI editfield.
%%%% ¡default!
s(2)

%%% ¡prop!
HEIGHT_VOI_DROPDOWN (gui, scalar) is the height of each VOI drop-down list.
%%%% ¡default!
s(2)

%%% ¡prop!
ENABLE (gui, logical) switches the editfields between active and inactive appearance when not editable.
%%%% ¡default!
true

%%% ¡prop!
HANDLES (evanescent, handlelist) is the list of VOI numeric editfields and drop-down lists.
%%%% ¡calculate!
sub = pr.get('EL');

voi_dict = sub.get('VOI_DICT');
handles = cell(1, voi_dict.get('LENGTH'));
for i = 1:1:voi_dict.get('LENGTH')
    voi = voi_dict.get('IT', i);
    
    if isa(voi, 'VOICategoric')
            dropdown = uidropdown( ...
                'Parent', pr.memorize('H'), ... % H = p for Panel
                'Tag', ['DROPDOWN ' int2str(i)], ...
                'Items', el.getPropSettings(prop), ... % % %
                'FontSize', BRAPH2.FONTSIZE, ...
                'Tooltip', [num2str(el.getPropProp(prop)) ' ' el.getPropDescription(prop)], ... % % %
                'ValueChangedFcn', {@cb_voi} ...
                );

        handles{i} = dropdown;
    else % isa(voi, 'VOINumeric')
        editfield = uieditfield('numeric', ...
            'Parent', pr.memorize('H'), ... % H = p for Panel
            'Tag', ['EDITFIELD ' int2str(i)], ...
            'FontSize', BRAPH2.FONTSIZE, ...
            'Tooltip', [num2str(el.getPropProp(prop)) ' ' el.getPropDescription(prop)], ... % % %
            'ValueChangedFcn', {@cb_voi} ...
            );

        handles{i} = editfield;
    end
end

value = handles;
%%%% ¡calculate_callbacks!
function cb_voi(~, ~)
% % %     pr.get('EL').set(pr.get('PROP'), get(pr.get('DROPDOWN'), 'Value'))
end

%% ¡tests!

%%% ¡excluded_props!
[SubjectPP_VOIDict.PARENT SubjectPP_VOIDict.H SubjectPP_VOIDict.HANDLES]

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡parallel!
false
%%%% ¡code!
warning('off', [BRAPH2.STR ':SubjectPP_VOIDict'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':SubjectPP_VOIDict'])
