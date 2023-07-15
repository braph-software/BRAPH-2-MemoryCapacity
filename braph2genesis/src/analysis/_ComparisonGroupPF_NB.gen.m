%% ¡header!
ComparisonGroupPF_NB < ComparisonGroupPF (pf, panel nodal bilayer group comparison figure) is the base element to plot a nodal bilayer group comparison figure.

%%% ¡description!
ComparisonGroupPF_NB manages the basic functionalities to plot of a nodal bilayer group comparison figure.

%%% ¡seealso!
ComparisonGroup

%% ¡_layout!

% % % %%% ¡prop!
% % % %%%% ¡id!
% % % ComparisonGroupPF_NB.ID
% % % %%%% ¡title!
% % % Brain Atlas Figure ID
% % % 
% % % %%% ¡prop!
% % % %%%% ¡id!
% % % ComparisonGroupPF_NB.LABEL
% % % %%%% ¡title!
% % % Brain Atlas Figure NAME
% % % 
% % % %%% ¡prop!
% % % %%%% ¡id!
% % % ComparisonGroupPF_NB.WAITBAR
% % % %%%% ¡title!
% % % WAITBAR ON/OFF
% % % 
% % % %%% ¡prop!
% % % %%%% ¡id!
% % % ComparisonGroupPF_NB.NOTES
% % % %%%% ¡title!
% % % Brain Atlas NOTES
% % % 
% % % %%% ¡prop!
% % % %%%% ¡id!
% % % ComparisonGroupPF_NB.BKGCOLOR
% % % %%%% ¡title!
% % % BACKGROUND COLOR
% % % 
% % % %%% ¡prop!
% % % %%%% ¡id!
% % % ComparisonGroupPF_NB.ST_POSITION
% % % %%%% ¡title!
% % % PANEL POSITION
% % % 
% % % %%% ¡prop!
% % % %%%% ¡id!
% % % ComparisonGroupPF_NB.ST_AXIS
% % % %%%% ¡title!
% % % AXIS
% % % 
% % % %%% ¡prop!
% % % %%%% ¡id!
% % % ComparisonGroupPF_NB.ST_AREA
% % % %%%% ¡title!
% % % FILLED AREA
% % % 
% % % %%% ¡prop!
% % % %%%% ¡id!
% % % ComparisonGroupPF_NB.ST_LINE
% % % %%%% ¡title!
% % % MEASURE LINE
% % % 
% % % %%% ¡prop!
% % % %%%% ¡id!
% % % ComparisonGroupPF_NB.ST_TITLE
% % % %%%% ¡title!
% % % TITLE
% % % 
% % % %%% ¡prop!
% % % %%%% ¡id!
% % % ComparisonGroupPF_NB.ST_XLABEL
% % % %%%% ¡title!
% % % X-LABEL
% % % 
% % % %%% ¡prop!
% % % %%%% ¡id!
% % % ComparisonGroupPF_NB.ST_YLABEL
% % % %%%% ¡title!
% % % Y-LABEL
% % % 
% % % %%% ¡prop!
% % % %%%% ¡id!
% % % ComparisonGroupPF_NB.NODE
% % % %%%% ¡title!
% % % NODE SELECTION

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the panel figure nodal bilayer group comparison figure.
%%%% ¡default!
'ComparisonGroupPF_NB'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the panel figure nodal bilayer group comparison figure.
%%%% ¡default!
'ComparisonGroupPF_NB manages the basic functionalities to plot of a nodal bilayer group comparison figure.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the panel figure nodal bilayer group comparison figure.
%%%% ¡settings!
'ComparisonGroupPF_NB'

%%% ¡prop!
ID (data, string) is a few-letter code for the panel figure nodal bilayer group comparison figure.
%%%% ¡default!
'ComparisonGroupPF_NB ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the panel figure nodal bilayer group comparison figure.
%%%% ¡default!
'ComparisonGroupPF_NB label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the panel figure nodal bilayer group comparison figure.
%%%% ¡default!
'ComparisonGroupPF_NB notes'

%%% ¡prop!
SETUP (query, empty) calculates the group comparison figure value and stores it.
%%%% ¡calculate!
%%%__WARN_TBI__
value = [];

%% ¡props!

%%% ¡prop!
NODE (figure, scalar) is the node number of the nodal group comparison figure.
%%%% ¡_gui!
% % % bas = pf.get('M').get('G').get('BAS');
% % % ba = bas{1};
% % % 
% % % pr = PP_BrainRegion('EL', pf, 'PROP', PFMeasureNU.BR1_ID, ...
% % %     'BA', ba, ...
% % %     varargin{:});

%% ¡tests!

%%% ¡excluded_props!
[ComparisonGroupPF_NB.PARENT ComparisonGroupPF_NB.H ComparisonGroupPF_NB.ST_POSITION ComparisonGroupPF_NB.ST_AXIS ComparisonGroupPF_NB.ST_AREA ComparisonGroupPF_NB.ST_LINE ComparisonGroupPF_NB.ST_LINE_CIL ComparisonGroupPF_NB.ST_LINE_CIU ComparisonGroupPF_NB.ST_TITLE ComparisonGroupPF_NB.ST_XLABEL ComparisonGroupPF_NB.ST_YLABEL] 

%%% ¡warning_off!
true

%%% ¡test!
%%%% ¡name!
Remove Figures
%%%% ¡parallel!
false
%%%% ¡code!
warning('off', [BRAPH2.STR ':ComparisonGroupPF_NB'])
assert(length(findall(0, 'type', 'figure')) == 1)
delete(findall(0, 'type', 'figure'))
warning('on', [BRAPH2.STR ':ComparisonGroupPF_NB'])
