%EXAMPLE_FUN_WU
% Script example pipeline FUN WU

clear variables %#ok<*NASGU>

%% Load BrainAtlas
im_ba = ImporterBrainAtlasXLS( ...
    'FILE', [fileparts(which('SubjectFUN')) filesep 'Example data FUN XLS' filesep 'atlas.xlsx'], ...
    'WAITBAR', true ...
    );

ba = im_ba.get('BA');

%% Load Groups of SubjectFUN
im_gr1 = ImporterGroupSubjectFUN_XLS( ...
    'DIRECTORY', [fileparts(which('SubjectFUN')) filesep 'Example data FUN XLS' filesep 'FUN_Group_1_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr1 = im_gr1.get('GR');

im_gr2 = ImporterGroupSubjectFUN_XLS( ...
    'DIRECTORY', [fileparts(which('SubjectFUN')) filesep 'Example data FUN XLS' filesep 'FUN_Group_2_XLS'], ...
    'BA', ba, ...
    'WAITBAR', true ...
    );

gr2 = im_gr2.get('GR');

%% Analysis FUN WU
a_WU1 = AnalyzeEnsemble_FUN_WU( ...
    'GR', gr1 ...
    );

a_WU2 = AnalyzeEnsemble_FUN_WU( ...
    'TEMPLATE', a_WU1, ...
    'GR', gr2 ...
    );

% measure calculation
strength_WU1 = a_WU1.get('MEASUREENSEMBLE', 'Strength').get('M');
strength_av_WU1 = a_WU1.get('MEASUREENSEMBLE', 'StrengthAv').get('M');
distance_WU1 = a_WU1.get('MEASUREENSEMBLE', 'Distance').get('M');

strength_WU2 = a_WU2.get('MEASUREENSEMBLE', 'Strength').get('M');
strength_av_WU2 = a_WU2.get('MEASUREENSEMBLE', 'StrengthAv').get('M');
distance_WU2 = a_WU2.get('MEASUREENSEMBLE', 'Distance').get('M');

% comparison
c_WU = CompareEnsemble( ...
    'P', 10, ...
    'A1', a_WU1, ...
    'A2', a_WU2, ...
    'WAITBAR', true, ...
    'VERBOSE', false, ...
    'MEMORIZE', true ...
    );

strength_WU_diff = c_WU.get('COMPARISON', 'Strength').get('DIFF');
strength_WU_p1 = c_WU.get('COMPARISON', 'Strength').get('P1');
strength_WU_p2 = c_WU.get('COMPARISON', 'Strength').get('P2');
strength_WU_cil = c_WU.get('COMPARISON', 'Strength').get('CIL');
strength_WU_ciu = c_WU.get('COMPARISON', 'Strength').get('CIU');

modularity_WU_diff = c_WU.get('COMPARISON', 'Modularity').get('DIFF');
modularity_WU_p1 = c_WU.get('COMPARISON', 'Modularity').get('P1');
modularity_WU_p2 = c_WU.get('COMPARISON', 'Modularity').get('P2');
modularity_WU_cil = c_WU.get('COMPARISON', 'Modularity').get('CIL');
modularity_WU_ciu = c_WU.get('COMPARISON', 'Modularity').get('CIU');

distance_WU_diff = c_WU.get('COMPARISON', 'Distance').get('DIFF');
distance_WU_p1 = c_WU.get('COMPARISON', 'Distance').get('P1');
distance_WU_p2 = c_WU.get('COMPARISON', 'Distance').get('P2');
distance_WU_cil = c_WU.get('COMPARISON', 'Distance').get('CIL');
distance_WU_ciu = c_WU.get('COMPARISON', 'Distance').get('CIU');