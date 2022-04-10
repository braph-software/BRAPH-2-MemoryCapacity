%% ¡header!
ExporterBrainAtlasXLS < Exporter (ex, exporter of brain atlas in XLS) exports a brain atlas to an XLS/XLSX file.

%%% ¡description!
ExporterBrainAtlasXLS exports a brain atlas to an XLS/XLSX file.

%%% ¡seealso!
Element, Exporter, ImporterBrainAtlasXLS.

%% ¡props!

%%% ¡prop!
BA (data, item) is a brain atlas.
%%%% ¡settings!
'BrainAtlas'

%%% ¡prop!
FILE (data, string) is the XLS/XLSX file where to save the brain atlas.
%%%% ¡default!
[fileparts(which('test_braph2')) filesep 'default_xls_file_to_save_brain_atlas_most_likely_to_be_erased.xlsx']

%%% ¡prop!
SAVE (result, empty) saves the brain atlas in the selected XLS/XLSX file.
%%%% ¡calculate!
file = ex.get('FILE');

if isfolder(fileparts(file))
    if ex.get('WAITBAR')
        wb = waitbar(0, 'Retrieving path ...', 'Name', BRAPH2.NAME);
        set_braph2icon(wb)
    end
    
    ba = ex.get('BA');
    ba_id = ba.get('ID');
    if ~isempty(ba.get('LABEL'))
        ba_label = ba.get('LABEL');
    else
        ba_label = ' ';
    end
    if ~isempty(ba.get('NOTES'))
        ba_notes = ba.get('NOTES');
    else
        ba_notes = ' ';
    end

    % gets brain region data
    if ex.get('WAITBAR')
        waitbar(.15, wb, 'Organizing info ...');
    end
    
    br_dict = ba.get('BR_DICT');
    br_ids = cell(br_dict.length(), 1);
    br_labels = cell(br_dict.length(), 1);
    br_notes = cell(br_dict.length(), 1);
    br_x = cell(br_dict.length(), 1);
    br_y = cell(br_dict.length(), 1);
    br_z = cell(br_dict.length(), 1);
    for i = 1:1:br_dict.length()
        if ex.get('WAITBAR')
            waitbar(.30 + .70 * i / br_dict.length(), wb, ['Saving brain region ' num2str(i) ' of ' num2str(br_dict.length())]);
        end
        
        br = br_dict.getItem(i);
        br_ids{i} = br.get('ID');
        if ~isempty(br.get('LABEL'))
            br_labels{i} = br.get('LABEL');
        else
            br_labels{i} = ' ';
        end
        if ~isempty(br.get('NOTES'))
            br_notes{i} = br.get('NOTES');
        else
            br_notes{i} = ' ';
        end
        br_x{i} = br.get('X');
        br_y{i} = br.get('Y');
        br_z{i} = br.get('Z');
    end

    % creates table
    tab = [
        {ba_id, {}, {}, {}, {}, {}};
        {ba_label, {}, {}, {}, {}, {}};
        {ba_notes, {}, {}, {}, {}, {}};
        {{}, {}, {}, {}, {}, {}};
        table(br_ids, br_labels, br_x, br_y, br_z, br_notes)
        ];

    % save
    if ex.get('WAITBAR')
        waitbar(1, wb, 'Finalizing ...');
    end

    writetable(tab, file, 'Sheet', 1, 'WriteVariableNames', 0);

    % sets value to empty    
    value = [];
    
    if ex.get('WAITBAR')
        close(wb)
    end
else
    value = ex.getr('SAVE');
end

%% ¡methods!
function uiputfile(ex)
    % UIPUTFILE (result, empty) opens a dialog box to set the XLS/XLSX file where to save the brain atlas.

    [filename, filepath, filterindex] = uiputfile({'*.xlsx';'*.xls'}, 'Select Excel file');
    if filterindex
        file = [filepath filename];
        ex.set('FILE', file);
    end
end

%% ¡tests!

%%% ¡test!
%%%% ¡name!
Delete file TBE
%%%% ¡code!
delete([fileparts(which('test_braph2')) filesep 'default_xls_file_to_save_brain_atlas_most_likely_to_be_erased.xlsx'])

%%% ¡test!
%%%% ¡name!
Export and import
%%%% ¡code!
br1 = BrainRegion( ...
    'ID', 'ISF', ...
    'LABEL', 'superiorfrontal', ...
    'NOTES', 'notes1', ...
    'X', -12.6, ...
    'Y', 22.9, ...
    'Z', 42.4 ...
    );
br2 = BrainRegion( ...
    'ID', 'lFP', ...
    'LABEL', 'frontalpole', ...
    'NOTES', 'notes2', ...
    'X', -8.6, ...
    'Y', 61.7, ...
    'Z', -8.7 ...
    );
br3 = BrainRegion( ...
    'ID', 'lRMF', ...
    'LABEL', 'rostralmiddlefrontal', ...
    'NOTES', 'notes3', ...
    'X', -31.3, ...
    'Y', 41.2, ...
    'Z', 16.5 ...
    );
br4 = BrainRegion( ...
    'ID', 'lCMF', ...
    'LABEL', 'caudalmiddlefrontal', ...
    'NOTES', 'notes4', ...
    'X', -34.6, ...
    'Y', 10.2, ...
    'Z', 42.8 ...
    );
br5 = BrainRegion( ...
    'ID', 'lPOB', ...
    'LABEL', 'parsorbitalis', ...
    'NOTES', 'notes5', ...
    'X', -41, ...
    'Y', 38.8, ...
    'Z', -11.1 ...
    );
ba = BrainAtlas( ...
    'ID', 'TestToSaveCoolID', ...
    'LABEL', 'Brain Atlas', ...
    'NOTES', 'Brain atlas notes', ...
    'BR_DICT', IndexedDictionary('IT_CLASS', 'BrainRegion', 'IT_KEY', 1, 'IT_LIST', {br1, br2, br3, br4, br5}) ...
    );

file = [fileparts(which('test_braph2')) filesep 'trial_atlas_to_be_erased.xlsx'];

ex = ExporterBrainAtlasXLS( ...
    'FILE', file, ...
    'BA', ba ...
    );
ex.get('SAVE');

im = ImporterBrainAtlasXLS( ...
    'FILE', file ...
    );
ba_loaded = im.get('BA');

assert(isequal(ba.get('ID'), ba_loaded.get('ID')), ...
	[BRAPH2.STR ':ImporterBrainAtlasXLS:' BRAPH2.BUG_IO], ...
    'Problems saving or loading a brain atlas.')
assert(ba.get('BR_DICT').length() == ba_loaded.get('BR_DICT').length(), ...
	[BRAPH2.STR ':ImporterBrainAtlasXLS:' BRAPH2.BUG_IO], ...
    'Problems saving or loading a brain atlas.')
for i = 1:1:max(ba.get('BR_DICT').length(), ba_loaded.get('BR_DICT').length())
    br = ba.get('BR_DICT').getItem(i);
    br_loaded = ba_loaded.get('BR_DICT').getItem(i);    
    assert( ...
        isequal(br.get('ID'), br_loaded.get('ID')) & ...
        isequal(br.get('LABEL'), br_loaded.get('LABEL')) & ...
        isequal(br.get('NOTES'), br_loaded.get('NOTES')) & ...
        isequal(br.get('X'), br_loaded.get('X')) & ...
        isequal(br.get('Y'), br_loaded.get('Y')) & ...
        isequal(br.get('Z'), br_loaded.get('Z')), ...
        [BRAPH2.STR ':ImporterBrainAtlasXLS:' BRAPH2.BUG_IO], ...
        'Problems saving or loading a brain atlas.')    
end

delete(file)
