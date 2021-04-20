%% ¡header!
AnalyzeGroup_ST_MP_BUT < AnalyzeGroup (a, graph analysis with structural multiplex data of fixed threshold) is a graph analysis using structural multiplex data of fixed threshold.

%% ¡description!
This graph analysis uses structural multiplex data of fixed threshold and 
analyzes them using binary undirected graphs.

%%% ¡seealso!
AnalyzeGroup_ST_MP_WU, AnalyzeGroup_ST_MP_BUD, Subject_ST_MP, MultiplexBUT.

%% ¡props!

%%% ¡prop!
CORRELATION_RULE (parameter, option) is the correlation type.
%%%% ¡settings!
Correlation.CORRELATION_RULE_LIST
%%%% ¡default!
Correlation.CORRELATION_RULE_LIST{1}

%%% ¡prop!
NEGATIVE_WEIGHT_RULE (parameter, option) determines how to deal with negative weights.
%%%% ¡settings!
Correlation.NEGATIVE_WEIGHT_RULE_LIST
%%%% ¡default!
Correlation.NEGATIVE_WEIGHT_RULE_LIST{1}

%%% ¡prop!
THRESHOLDS (parameter, rvector) is the vector of thresholds.
%%%% ¡default!
0

%% ¡props_update!

%%% ¡prop!
GR (data, item) is the subject group, which also defines the subject class SubjectST_MP.
%%%% ¡default!
Group('SUB_CLASS', 'SubjectST_MP')

%%% ¡prop!
G (result, item) is the graph obtained from this analysis.
%%%% ¡settings!
'MultiplexBUT'
%%%% ¡default!
MultiplexBUT()
%%%% ¡calculate!
gr = a.get('GR');
data_list = cellfun(@(x) x.get('ST_MP'), gr.get('SUB_DICT').getItems, 'UniformOutput', false);
N = gr.get('SUB_DICT').getItem(1).get('N');  % number of layers
br_number = gr.get('SUB_DICT').getItem(1).get('ba').get('BR_DICT').length();  % number of regions
data = cell(N, 1);
for i=1:N
    data_layer = zeros(length(data_list), br_number);
    for j=1:length(data_list)
        sub_cell = data_list{j};
        data_layer(j, :) = sub_cell{i}';
    end
    data(i) = {data_layer};
end

A = cell(1, N);
for i = 1:N
    A(i) = {Correlation.getAdjacencyMatrix(data{i}, a.get('CORRELATION_RULE'), a.get('NEGATIVE_WEIGHT_RULE'))};
end

thresholds = a.get('THRESHOLDS'); % this is a vector

g = MultiplexBUT( ...
    'ID', ['g ' gr.get('ID')], ...
    'B', A, ...
    'THRESHOLDS', thresholds ...
    );

value = g;

%% ¡tests!

%%% ¡test!
%%%% ¡name!
Example
%%%% ¡code!
example_ST_MP_BUT