%BRAPH 2 for MemoryCapacity.

addpath([fileparts(which('braph2mc')) filesep '..' filesep 'braph2'])
braph2(false)

if ispc
    fprintf([ ...
        '\n' ...
        '<strong>Ø   Ø   ØØØØØ  \n</strong>' ... 
        '<strong>ØØ ØØ   Ø      \n</strong>' ...
        '<strong>Ø Ø Ø   Ø      \n</strong>' ...
        '<strong>Ø   Ø   Ø      \n</strong>' ...
        '<strong>Ø   Ø @ ØØØØØ @\n</strong>' ...
        '\n' ...
        ]);
else
    fprintf([ ...
        '\n' ...
        ' █   █   █████  \n' ...
        ' ██ ██   █      \n' ...
        ' █ █ █   █      \n' ...
        ' █   █   █      \n' ...
        ' █   █ █ █████ █\n' ...
        '\n' ...
        ]);
end

fprintf([ ...
    '\n' ...
    ' <a href="matlab:create_data_Memory_Capacity(); pip = ImporterPipelineBRAPH2(''FILE'', [fileparts(which(''SubjectCON_MP'')) filesep ''pipeline_connectivity_multiplex_analysis_wu.braph2''], ''WAITBAR'', true).get(''PIP''); gui = GUIElement(''PE'', pip, ''WAITBAR'', true); gui.get(''DRAW''); gui.get(''SHOW'');">Open Memory Capacity Analysis</a>\n' ...
    '\n' ...
    ])