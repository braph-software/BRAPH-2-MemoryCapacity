%% ¡header!
Clustering < Triangles (m, clustering) is the graph clustering.

%%% ¡description!
The clustering coefficient of a node is the fraction of triangles present 
around a node. The clustering coefficient is calculated as the ratio between 
the number of triangles present around a node and the maximum number of 
triangles that could possibly be formed around that node.

%% ¡props_update!

%%% ¡prop!
NAME (constant, string) is the name of the clustering.
%%%% ¡default!
'Clustering'

%%% ¡prop!
DESCRIPTION (constant, string) is the description of the clustering.
%%%% ¡default!
'The clustering coefficient of a node is the fraction of triangles present around a node. The clustering coefficient is calculated as the ratio between the number of triangles present around a node and the maximum number of triangles that could possibly be formed around that node.'

%%% ¡prop!
TEMPLATE (parameter, item) is the template of the clustering.

%%% ¡prop!
ID (data, string) is a few-letter code of the clustering.
%%%% ¡default!
'Clustering ID'

%%% ¡prop!
LABEL (metadata, string) is an extended label of the clustering.
%%%% ¡default!
'Clustering label'

%%% ¡prop!
NOTES (metadata, string) are some specific notes about the clustering.
%%%% ¡default!
'Clustering notes'

%%% ¡prop!
SHAPE (constant, scalar) is the measure shape __Measure.NODAL__.
%%%% ¡default!
Measure.NODAL

%%% ¡prop!
SCOPE (constant, scalar) is the measure scope __Measure.UNILAYER__.
%%%% ¡default!
Measure.UNILAYER

%%% ¡prop!
PARAMETRICITY (constant, scalar) is the parametricity of the measure __Measure.NONPARAMETRIC__.
%%%% ¡default!
Measure.NONPARAMETRIC

%%% ¡prop!
COMPATIBLE_GRAPHS (constant, classlist) is the list of compatible graphs.
%%%% ¡default!
{'GraphWU' 'GraphWD' 'GraphBU' 'GraphBD' 'MultigraphBUD' 'MultigraphBUT' 'MultiplexWU' 'MultiplexWD' 'MultiplexBU' 'MultiplexBUD' 'MultiplexBUT' 'MultiplexBD'}

%%% ¡prop!
M (result, cell) is the clustering.
%%%% ¡calculate!
g = m.get('G');  % graph from measure class
A = g.get('A');  % cell with adjacency matrix (for graph) or 2D-cell array (for multigraph, multiplex, etc.) 
L = g.get('LAYERNUMBER');

triangles = calculateValue@Triangles(m, prop);

clustering = cell(L, 1);
directionality_type =   g.get('DIRECTIONALITY_TYPE', L);
            
parfor li = 1:1:L
    Aii = A{li, li};
    if directionality_type == Graph.UNDIRECTED              
        degree = Degree('G', g).get('M');
        clustering_layer = 2 * triangles{li} ./ (degree{li} .* (degree{li} - 1));

    else %% directed graphs    
        in_degree = DegreeIn('G', g).get('M');
        out_degree = DegreeOut('G', g).get('M');
        directed_triangles_rule = m.get('RULE');
        switch lower(directed_triangles_rule)
            case {'all'}  % all rule
                clustering_layer = triangles{li} ./ ((out_degree{li} + in_degree{li}) .* (out_degree{li} + in_degree{li} - 1) - 2 * diag(Aii^2));
            case {'middleman'}  % middleman rule
                clustering_layer = triangles{li} ./ ((out_degree{li} .* in_degree{li}) - diag(Aii^2));
            case {'in'}  % in rule
                clustering_layer = triangles{li} ./ (in_degree{li} .* (in_degree{li} - 1));
            case {'out'}  % out rule
                clustering_layer = triangles{li} ./ (out_degree{li} .* (out_degree{li} - 1));
            otherwise  % {'cycle'}  % cycle rule
                clustering_layer = triangles{li} ./ ((out_degree{li} .* in_degree{li}) - diag(Aii^2));
        end
    end
    clustering_layer(isnan(clustering_layer)) = 0;  % Should return zeros, not NaN
    clustering(li) = {clustering_layer};
end

value = clustering;


%% ¡tests!

%%% ¡excluded_props!
[Clustering.PFM]

%%% ¡test!
%%%% ¡name!
GraphBU
%%%% ¡code!
B_BU = [
    0 1 1 1; 
    1 0 1 0; 
    1 1 0 1; 
    1 0 1 0
    ];
clustering_BU = {[2/3 1 2/3 1]'};
g = GraphBU('B', B_BU);
m_outside_g = Clustering('G', g);
assert(isequal(m_outside_g.get('M'), clustering_BU), ...
    [BRAPH2.STR ':Clustering:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'Clustering');
assert(isequal(m_inside_g.get('M'), clustering_BU), ...
    [BRAPH2.STR ':Clustering:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])


%%% ¡test!
%%%% ¡name!
GraphBD
%%%% ¡code!
B_BD = [
    0 0 1; 
    1 0 0; 
    0 1 0 
    ];
clustering_BD_out = {[0 0 0]'};  % out rule

g = GraphBD('B', B_BD);
m_outside_g = Clustering('G', g, 'RULE', 'out');
assert(isequal(m_outside_g.get('M'), clustering_BD_out), ...
    [BRAPH2.STR ':Clustering:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'Clustering');
m_inside_g.set('RULE', 'out');
assert(isequal(m_inside_g.get('M'), clustering_BD_out), ...
    [BRAPH2.STR ':Clustering:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultigraphBUT
%%%% ¡code!
B = [
    0 1 1 1; 
    1 0 1 0; 
    1 1 0 1; 
    1 0 1 0
    ];

thresholds = [0 1];

known_clustering = {
    [2/3 1 2/3 1]'
    [0   0 0   0]'
    };

g = MultigraphBUT('B', B, 'THRESHOLDS', thresholds);

m_outside_g = Clustering('G', g);
assert(isequal(m_outside_g.get('M'), known_clustering), ...
    [BRAPH2.STR ':Clustering:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'Clustering');
assert(isequal(m_inside_g.get('M'), known_clustering), ...
    [BRAPH2.STR ':Clustering:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBU
%%%% ¡code!
B11 = [
      0 1 1 1;
      1 0 1 0;
      1 1 0 1;
      1 0 1 0
      ];
B22 = [
      0 1 1 1;
      1 0 1 0;
      1 1 0 1;
      1 0 1 0
      ];
B  = {B11 B22};

known_clustering = {
                 [2/3 1 2/3 1]'
                 [2/3 1 2/3 1]'
                 };      

g = MultiplexBU('B', B);
m_outside_g = Clustering('G', g);
assert(isequal(m_outside_g.get('M'), known_clustering), ...
    [BRAPH2.STR ':Clustering:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'Clustering');
assert(isequal(m_inside_g.get('M'), known_clustering), ...
    [BRAPH2.STR ':Clustering:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBUT
%%%% ¡code!
B11 = [
      0 1 1 1;
      1 0 1 0;
      1 1 0 1;
      1 0 1 0
      ];
B22 = [
      0 1 1 1;
      1 0 1 0;
      1 1 0 1;
      1 0 1 0
      ];
B  = {B11 B22};

thresholds = [0 1];
known_clustering = {
                 [2/3 1 2/3 1]'
                 [2/3 1 2/3 1]'
                 [0 0 0 0]'
                 [0 0 0 0]'
                 };      

g = MultiplexBUT('B', B, 'THRESHOLDS', thresholds);
m_outside_g = Clustering('G', g);
assert(isequal(m_outside_g.get('M'), known_clustering), ...
    [BRAPH2.STR ':Clustering:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'Clustering');
assert(isequal(m_inside_g.get('M'), known_clustering), ...
    [BRAPH2.STR ':Clustering:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])

%%% ¡test!
%%%% ¡name!
MultiplexBD
%%%% ¡code!
B11 = [
      0 0 1; 
      1 0 0; 
      0 1 0 
      ];
B22 = [
      0 0 1; 
      1 0 0; 
      0 1 0 
      ];
B = {B11 B22};

% cycle rule - default
known_clustering = {
                 [1 1 1]'
                 [1 1 1]'
                 }; 

g = MultiplexBD('B', B);
m_outside_g = Clustering('G', g, 'RULE', 'cycle');
assert(isequal(m_outside_g.get('M'), known_clustering), ...
    [BRAPH2.STR ':Clustering:' BRAPH2.FAIL_TEST], ...
    [class(m_outside_g) ' is not being calculated correctly for ' class(g) '.'])

m_inside_g = g.get('MEASURE', 'Clustering');
m_inside_g.set('RULE', 'cycle');
assert(isequal(m_inside_g.get('M'), known_clustering), ...
    [BRAPH2.STR ':Clustering:' BRAPH2.FAIL_TEST], ...
    [class(m_inside_g) ' is not being calculated correctly for ' class(g) '.'])