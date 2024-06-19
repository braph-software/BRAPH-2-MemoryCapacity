%BRAPH 2 for MemoryCapacity.

delete(findall(0, 'type', 'figure'))
close all
clear all %#ok<CLALL>
clc

%% Add paths

rollcall = { ...
    '+_NodalMemoryCapacity.gen.m', '+_GlobalMemoryCapacity.gen.m'...    
    };

braph2_dir = [fileparts(fileparts(which('braph2mc'))) filesep 'braph2'];
target_gen_dir = [fileparts(fileparts(which('braph2mc'))) filesep 'MemoryCapacityGen'];
target_dir = [fileparts(fileparts(which('braph2mc'))) filesep 'MemoryCapacity'];
genesis_dir = [fileparts(fileparts(which('braph2mc'))) filesep 'braph2genesis'];

addpath(braph2_dir)
addpath(target_gen_dir)
addpath(target_dir)
addpath(genesis_dir)
addpath([fileparts(which('braph2genesis')) filesep 'genesis'])


%% print
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

%% 
if exist(target_dir, 'dir') 
    if input([ ...
        'The target directory already exists:\n' ...
        target_dir '\n'...
        'It will be erased with all its content.\n' ...
        'Proceed anyways? (y/n)\n'
        ], 's') == 'y'
    
        backup_warning_state = warning('off', 'MATLAB:RMDIR:RemovedFromPath');
        rmdir(target_dir, 's')
        warning(backup_warning_state)
    else
        disp('Compilation interrupted.')
    end
end
if ~exist(target_dir, 'dir') 
    time_start = tic;

    [target_dir, source_dir] = genesis(target_dir, [], 2, rollcall);

    addpath(target_dir)

    time_end = toc(time_start);

    disp( 'BRAPH 2 is now fully compiled and ready to be used.')
    disp(['Its compilation has taken ' int2str(time_end) '.' int2str(mod(time_end, 1) * 10) 's'])
    disp('')
    
    braph2(false)

    test_braph2
end

% 
% fprintf([ ...
%     '\n' ...
%     ' <a href="matlab:create_data_Memory_Capacity(); pip = ImporterPipelineBRAPH2(''FILE'', [fileparts(which(''SubjectCON_MP'')) filesep ''pipeline_connectivity_multiplex_analysis_wu.braph2''], ''WAITBAR'', true).get(''PIP''); gui = GUIElement(''PE'', pip, ''WAITBAR'', true); gui.get(''DRAW''); gui.get(''SHOW'');">Open Memory Capacity Analysis</a>\n' ...
%     '\n' ...
%     ])