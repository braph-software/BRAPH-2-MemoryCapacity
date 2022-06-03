%% ¡header!
PFBrainAtlas < PFBrainSurface (pf, panel figure brain atlas) is a plot of a brain atlas.

%%% ¡description!
PFBrainAtlas manages the plot of the brain regions symbols,
spheres, ids and labels. PFBrainAtlas utilizes the surface created
from PFBrainSurface to integrate the regions to a brain surface.

%%% ¡seealso!
Plot, BrainSurface, PlotBrainSurface

%% ¡properties!
p  % handle for panel
h_axes

h_syms % handle for the symbols 
h_sphs % handle for the spheres 
h_ids % handle for the id 
h_labs % handle for the labs 

%% ¡props!

%%% ¡prop!
BA (metadata, item) is the brain atlas with the brain regions.
%%%% ¡settings!
'BrainAtlas'

%%% ¡prop!
SYM_DICT (figure, idict) contains the symbols of the brain regions.
%%%% ¡settings!
'SettingsSymbol'
%%%% ¡postprocessing!
if ~isa(pf.getr('BA'), 'NoValue') && ~isa(pf.getr('SYM_DICT'), 'NoValue')
    sym_dict = pf.get('SYM_DICT');
    
    ba = pf.get('BA');
    br_dict = ba.get('BR_DICT');
    
    for bri = 1:1:br_dict.length()
        key = br_dict.getKey(bri);
        br = br_dict.getItem(bri);
        
        if ~sym_dict.containsKey(key)
            pf.h_syms{bri} = plot3(0, 0, 0, ...
                'Parent', pf.h_axes, ...
                'Tag', ['h_syms{' int2str(bri) '}'] ...
                );

            item = SettingsSymbol( ...
                'ID', Callback('EL', br, 'TAG', 'ID'), ...
                'PANEL', pf, ...
                'UITAG', get(pf.h_syms{bri}, 'Tag'), ...
                'VISIBLE', true, ...
                'X', Callback('EL', br, 'TAG', 'X'), ...
                'Y', Callback('EL', br, 'TAG', 'Y'), ...
                'Z', Callback('EL', br, 'TAG', 'Z') ...
                );
            sym_dict.add(item, bri)
        else
            % % % add check of alignment of dictionaries
            % % % 1. check ordering
            % % % 2. eliminate missing regions
        end
    end
end
%%%% ¡gui!
pr = PanelPropIDictTable('EL', pf, 'PROP', PFBrainAtlas.SYM_DICT, ...
    'COLS', [SettingsSymbol.VISIBLE SettingsSymbol.X SettingsSymbol.Y SettingsSymbol.Z SettingsSymbol.SYMBOL SettingsSymbol.SYMBOLSIZE], ...
    varargin{:});

%%% ¡prop!
SPH_DICT (figure, idict) contains the spheres of the brain regions.
%%%% ¡settings!
'SettingsSphere'
%%%% ¡postprocessing!
if ~isa(pf.getr('BA'), 'NoValue') && ~isa(pf.getr('SPH_DICT'), 'NoValue')
    sph_dict = pf.get('SPH_DICT');
    
    ba = pf.get('BA');
    br_dict = ba.get('BR_DICT');
    
    for bri = 1:1:br_dict.length()
        key = br_dict.getKey(bri);
        br = br_dict.getItem(bri);
        
        if ~sph_dict.containsKey(key)
            pf.h_sphs{bri} = surf([], [], [], ...
                'Parent', pf.h_axes, ...
                'Tag', ['h_sphs{' int2str(bri) '}'], ...
                'Visible', false ...
                );

            item = SettingsSphere( ...
                'ID', Callback('EL', br, 'TAG', 'ID'), ...
                'PANEL', pf, ...
                'UITAG', get(pf.h_sphs{bri}, 'Tag'), ...
                'X', Callback('EL', br, 'TAG', 'X'), ...
                'Y', Callback('EL', br, 'TAG', 'Y'), ...
                'Z', Callback('EL', br, 'TAG', 'Z') ...
                );
            sph_dict.add(item, bri)
        else
            % % % add check of alignment of dictionaries
            % % % 1. check ordering
            % % % 2. eliminate missing regions
        end
    end
end
%%%% ¡gui!
pr = PanelPropIDictTable('EL', pf, 'PROP', PFBrainAtlas.SPH_DICT, ...
    'COLS', [SettingsSphere.VISIBLE SettingsSphere.X SettingsSphere.Y SettingsSphere.Z SettingsSphere.SPHERESIZE SettingsSphere.FACEALPHA SettingsSphere.EDGEALPHA], ...
    varargin{:});

%%% ¡prop!
ID_DICT (figure, idict) contains the ids of the brain regions.
%%%% ¡settings!
'SettingsText'
%%%% ¡postprocessing!
if ~isa(pf.getr('BA'), 'NoValue') && ~isa(pf.getr('ID_DICT'), 'NoValue')
    id_dict = pf.get('ID_DICT');
    
    ba = pf.get('BA');
    br_dict = ba.get('BR_DICT');
    
    for bri = 1:1:br_dict.length()
        key = br_dict.getKey(bri);
        br = br_dict.getItem(bri);
        
        if ~id_dict.containsKey(key)
            pf.h_ids{bri} = text(0, 0, 0, '', ...
                'Parent', pf.h_axes, ...
                'Tag', ['h_ids{' int2str(bri) '}'], ...
                'Visible', false ...
                );

            item = SettingsText( ...
                'ID', Callback('EL', br, 'TAG', 'ID'), ...
                'PANEL', pf, ...
                'UITAG', get(pf.h_ids{bri}, 'Tag'), ...
                'X', Callback('EL', br, 'TAG', 'X'), ...
                'Y', Callback('EL', br, 'TAG', 'Y'), ...
                'Z', Callback('EL', br, 'TAG', 'Z'), ...
                'TXT', Callback('EL', br, 'TAG', 'ID') ...
                );
            id_dict.add(item, bri)
        else
            % % % add check of alignment of dictionaries
            % % % 1. check ordering
            % % % 2. eliminate missing regions
        end
    end
end
%%%% ¡gui!
pr = PanelPropIDictTable('EL', pf, 'PROP', PFBrainAtlas.ID_DICT, ...
    'COLS', [SettingsText.VISIBLE SettingsText.X SettingsText.Y SettingsText.Z SettingsText.TXT SettingsText.FONTNAME SettingsText.FONTSIZE SettingsText.INTERPRETER], ...
    varargin{:});

%%% ¡prop!
LAB_DICT (figure, idict) contains the labels of the brain regions.
%%%% ¡settings!
'SettingsText'
%%%% ¡postprocessing!
if ~isa(pf.getr('BA'), 'NoValue') && ~isa(pf.getr('LAB_DICT'), 'NoValue')
    lab_dict = pf.get('LAB_DICT');
    
    ba = pf.get('BA');
    br_dict = ba.get('BR_DICT');
    
    for bri = 1:1:br_dict.length()
        key = br_dict.getKey(bri);
        br = br_dict.getItem(bri);
        
        if ~lab_dict.containsKey(key)
            pf.h_labs{bri} = text(0, 0, 0, '', ...
                'Parent', pf.h_axes, ...
                'Tag', ['h_labs{' int2str(bri) '}'], ...
                'Visible', false ...
                );

            item = SettingsText( ...
                'ID', Callback('EL', br, 'TAG', 'ID'), ...
                'PANEL', pf, ...
                'UITAG', get(pf.h_labs{bri}, 'Tag'), ...
                'X', Callback('EL', br, 'TAG', 'X'), ...
                'Y', Callback('EL', br, 'TAG', 'Y'), ...
                'Z', Callback('EL', br, 'TAG', 'Z'), ...
                'TXT', Callback('EL', br, 'TAG', 'ID') ...
                );
            lab_dict.add(item, bri)
        else
            % % % add check of alignment of dictionaries
            % % % 1. check ordering
            % % % 2. eliminate missing regions
        end
    end
end
%%%% ¡gui!
pr = PanelPropIDictTable('EL', pf, 'PROP', PFBrainAtlas.ID_DICT, ...
    'COLS', [SettingsText.VISIBLE SettingsText.X SettingsText.Y SettingsText.Z SettingsText.TXT SettingsText.FONTNAME SettingsText.FONTSIZE SettingsText.INTERPRETER], ...
    varargin{:});

%% ¡methods!
function p_out = draw(pf, varargin)
    %DRAW draws the brain atlas graphical panel.
    %
    % DRAW(PL) draws the brain atlas graphical panel.
    %
    % P = DRAW(PF) returns a handle to the brain atlas graphical panel.
    %
    % DRAW(PF, 'Property', VALUE, ...) sets the properties of the graphical
    %  panel with custom property-value couples.
    %  All standard plot properties of uipanel can be used.
    %
    % It is possible to access the properties of the various graphical
    %  objects from the handle to the brain atlas graphical panel P.
    %
    % see also settings, uipanel.

    pf.p = draw@PFBrainSurface(pf, varargin{:});
    
    if ~check_graphics(pf.h_axes, 'axes')
        pf.h_axes = findall(pf.p, 'Tag', 'h_axes');
    end
    
    if isa(pf.getr('SYM_DICT'), 'NoValue')
        pf.memorize('SYM_DICT').set( ...
            'ID', 'Symbols', ...
            'IT_CLASS', 'SettingsSymbol', ...
            'IT_KEY', SettingsSymbol.ID ...
            )
    end

    if isa(pf.getr('SPH_DICT'), 'NoValue')
        pf.memorize('SPH_DICT').set( ...
            'ID', 'Spheres', ...
            'IT_CLASS', 'SettingsSphere', ...
            'IT_KEY', SettingsSphere.ID ...
            )
    end

    if isa(pf.getr('ID_DICT'), 'NoValue')
        pf.memorize('ID_DICT').set( ...
            'ID', 'IDs', ...
            'IT_CLASS', 'SettingsText', ...
            'IT_KEY', SettingsText.ID ...
            )
    end

    if isa(pf.getr('LAB_DICT'), 'NoValue')
        pf.memorize('LAB_DICT').set( ...
            'ID', 'Labels', ...
            'IT_CLASS', 'SettingsText', ...
            'IT_KEY', SettingsText.ID ...
            )
    end
    
    % output
    if nargout > 0
        p_out = pf.p;
    end
end

%% ¡tests!

%%% ¡test!
%%%% ¡name!
Basics
%%%% ¡code!
% % % fig = figure();
% % % br1 = BrainRegion('ID', 'BR ID1', 'Label', 'brain region label 1', 'Notes', 'brain region notes 1', 'x', 1, 'y', 10, 'z', 11);
% % % br2 = BrainRegion('ID', 'BR ID2', 'Label', 'brain region label 2', 'Notes', 'brain region notes 2', 'x', 2, 'y', 20, 'z', 22);
% % % br3 = BrainRegion('ID', 'BR ID3', 'Label', 'brain region label 3', 'Notes', 'brain region notes 3', 'x', 3, 'y', 30, 'z', 33);
% % % br4 = BrainRegion('ID', 'BR ID4', 'Label', 'brain region label 4', 'Notes', 'brain region notes 4', 'x', 4, 'y', 40, 'z', 44);
% % % br5 = BrainRegion('ID', 'BR ID5', 'Label', 'brain region label 5', 'Notes', 'brain region notes 5', 'x', 5, 'y', 50, 'z', 55);
% % % 
% % % bs = BrainSurface('ID', 'Human_Cerebellum.nv');
% % % br_dict =  IndexedDictionary( ...
% % %     'id', 'idict', ...
% % %     'it_class', 'BrainRegion', ...
% % %     'it_key', IndexedDictionary.getPropDefault(IndexedDictionary.IT_KEY), ...
% % %     'it_list', {br1, br2, br3, br4, br5});
% % % atlas = BrainAtlas('ID', 'BA ID', 'Label', 'Brain Atlas Label', 'Notes', 'Brain atlas notes', 'SURF', bs, 'BR_DICT', br_dict);
% % % pl = PlotBrainAtlas('atlas', atlas, ...
% % %     'syms', 1, 'SYMS_SIZE', [1:5:25]', ...
% % %     'SYMS_FACE_COLOR', [0 0 0], 'SYMS_EDGE_COLOR', [0 0 0], ...
% % %     'SPHS', 1, 'SPHS_SIZE', [1:1:5]', ...
% % %     'SPHS_FACE_ALPHA', .7, 'SPHS_FACE_COLOR', [0 1 0], ...
% % %     'SPHS_EDGE_ALPHA', .4, 'SPHS_EDGE_COLOR', [1 1 1], ...
% % %     'IDS', 1, 'IDS_SIZE', [11:1:15]', 'IDS_FONT_COLOR', [0 0 0], ...
% % %     'LABS', 1, 'LABS_SIZE', [12:1:16]', 'LABS_FONT_COLOR', [0 0 0], ...
% % %     'SURF', ImporterBrainSurfaceNV('FILE', 'human_ICBM152.nv').get('SURF'));
% % % pl.draw();
% % % pl.settings();
% % % 
% % % close(fig)