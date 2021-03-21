%% ¡header!
ImporterGroupSubjectSTTXT < Importer (im, importer of ST subject group from TXT) imports a group of subjects with structural data from an TXT file.

%%% ¡description!
ImporterGroupSubjectSTTXT imports a group of subjects with structural data from an TXT file.
The TXT file consists of the following columns: 
Group ID (column 1), Group LABEL (column 2), Group NOTES (column 3) and
BrainRegions (column 4-end; one brainregion value per column).
The first row contains the headers and each subsequent row the values for each subject.

%%% ¡seealso!
Element, Importer, ExporterGroupSubjectSTTXT

%% ¡props!

%%% ¡prop!
FILE (data, string) is the TXT file from where to load the ST subject group.
%%%% ¡default!
''

%%% ¡prop!
BA (data, item) is a brain atlas.
%%%% ¡settings!
'BrainAtlas'

%%% ¡prop!
GR (result, item) is a group of subjects with structural data.
%%%% ¡settings!
'Group'
%%%% ¡check_value!
check = any(strcmp(value.get(Group.SUB_CLASS_TAG), subclasses('SubjectST', [], [], true))); % Format.checkFormat(Format.ITEM, value, 'Group') already checked
%%%% ¡default!
Group('SUB_CLASS', 'SubjectST', 'SUB_DICT', IndexedDictionary('IT_CLASS', 'SubjectST'))
%%%% ¡calculate!
% creates empty Group
gr = Group( ...
    'SUB_CLASS', 'SubjectST', ...
    'SUB_DICT', IndexedDictionary('IT_CLASS', 'SubjectST') ...
    );

% analyzes file
file = im.get('FILE');
if isfile(file)
    raw = textread(file, '%s', 'delimiter', '\t', 'whitespace', '');
    raw = raw(~cellfun('isempty', raw));  % remove empty cells
    raw2 = readtable(file, 'Delimiter', '\t');

    % sets group props
    [~, name, ext] = fileparts(file);
    gr.set( ...
        'ID', name, ...
        'LABEL', [name ext], ...
        'NOTES', ['Group loaded from ' file] ...
    );

    % brain atlas
    ba = im.get('BA');
    br_number = size(raw2, 2) - 3;
    if ba.get('BR_DICT').length ~= br_number
        ba = BrainAtlas();
        idict = ba.get('BR_DICT');
        for j = 4:1:size(raw2, 2)
            br_id = raw{j, 1};
            br = BrainRegion('ID', br_id);
            idict.add(br)
        end
        ba.set('br_dict', idict);
    end

    subdict = gr.get('SUB_DICT');
    
    % adds subjects
    for i = 1:1:size(raw2, 1)
        ST = zeros(br_number, 1);
        for j = 1:1:length(ST)
            ST(j) = raw2{i, 3 + j};
        end
        sub = SubjectST( ...
            'ID', char(raw2{i, 1}), ...
            'LABEL', char(raw2{i, 2}), ...
            'NOTES', char(raw2{i, 3}), ...
            'BA', ba, ...
            'ST', ST ...
        );
        subdict.add(sub);
    end
    gr.set('sub_dict', subdict);
end

value = gr;

%% ¡methods!
function uigetfile(im)
    % UIGETFILE opens a dialog box to set the TXT file from where to load the ST subject group.
    
    [filename, filepath, filterindex] = uigetfile('*.txt', 'Select TXT file');
    if filterindex
        file = [filepath filename];
        im.set('FILE', file);
    end
end