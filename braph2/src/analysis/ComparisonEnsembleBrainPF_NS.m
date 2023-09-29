classdef ComparisonEnsembleBrainPF_NS < ComparisonEnsembleBrainPF
	%ComparisonEnsembleBrainPF_NS is the base element to plot a nodal superglobal ensemble-based comparison figure on brain surface figure.
	% It is a subclass of <a href="matlab:help ComparisonEnsembleBrainPF">ComparisonEnsembleBrainPF</a>.
	%
	% ComparisonEnsembleBrainPF_NS manages the basic functionalities to plot of a nodal superglobal ensemble-based comparison figure on brain surface figure.
	%
	% ComparisonEnsembleBrainPF_NS methods (constructor):
	%  ComparisonEnsembleBrainPF_NS - constructor
	%
	% ComparisonEnsembleBrainPF_NS methods:
	%  set - sets values of a property
	%  check - checks the values of all properties
	%  getr - returns the raw value of a property
	%  get - returns the value of a property
	%  memorize - returns the value of a property and memorizes it
	%             (for RESULT, QUERY, and EVANESCENT properties)
	%  getPropSeed - returns the seed of a property
	%  isLocked - returns whether a property is locked
	%  lock - locks unreversibly a property
	%  isChecked - returns whether a property is checked
	%  checked - sets a property to checked
	%  unchecked - sets a property to NOT checked
	%
	% ComparisonEnsembleBrainPF_NS methods (display):
	%  tostring - string with information about the panel nodal superglobal ensemble-based comparison figure on brain surface figure
	%  disp - displays information about the panel nodal superglobal ensemble-based comparison figure on brain surface figure
	%  tree - displays the tree of the panel nodal superglobal ensemble-based comparison figure on brain surface figure
	%
	% ComparisonEnsembleBrainPF_NS methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two panel nodal superglobal ensemble-based comparison figure on brain surface figure are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the panel nodal superglobal ensemble-based comparison figure on brain surface figure
	%
	% ComparisonEnsembleBrainPF_NS methods (save/load, Static):
	%  save - saves BRAPH2 panel nodal superglobal ensemble-based comparison figure on brain surface figure as b2 file
	%  load - loads a BRAPH2 panel nodal superglobal ensemble-based comparison figure on brain surface figure from a b2 file
	%
	% ComparisonEnsembleBrainPF_NS method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the panel nodal superglobal ensemble-based comparison figure on brain surface figure
	%
	% ComparisonEnsembleBrainPF_NS method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the panel nodal superglobal ensemble-based comparison figure on brain surface figure
	%
	% ComparisonEnsembleBrainPF_NS methods (inspection, Static):
	%  getClass - returns the class of the panel nodal superglobal ensemble-based comparison figure on brain surface figure
	%  getSubclasses - returns all subclasses of ComparisonEnsembleBrainPF_NS
	%  getProps - returns the property list of the panel nodal superglobal ensemble-based comparison figure on brain surface figure
	%  getPropNumber - returns the property number of the panel nodal superglobal ensemble-based comparison figure on brain surface figure
	%  existsProp - checks whether property exists/error
	%  existsTag - checks whether tag exists/error
	%  getPropProp - returns the property number of a property
	%  getPropTag - returns the tag of a property
	%  getPropCategory - returns the category of a property
	%  getPropFormat - returns the format of a property
	%  getPropDescription - returns the description of a property
	%  getPropSettings - returns the settings of a property
	%  getPropDefault - returns the default value of a property
	%  getPropDefaultConditioned - returns the conditioned default value of a property
	%  checkProp - checks whether a value has the correct format/error
	%
	% ComparisonEnsembleBrainPF_NS methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% ComparisonEnsembleBrainPF_NS methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% ComparisonEnsembleBrainPF_NS methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% ComparisonEnsembleBrainPF_NS methods (format, Static):
	%  getFormats - returns the list of formats
	%  getFormatNumber - returns the number of formats
	%  existsFormat - returns whether a format exists/error
	%  getFormatTag - returns the tag of a format
	%  getFormatName - returns the name of a format
	%  getFormatDescription - returns the description of a format
	%  getFormatSettings - returns the settings for a format
	%  getFormatDefault - returns the default value for a format
	%  checkFormat - returns whether a value format is correct/error
	%
	% To print full list of constants, click here <a href="matlab:metaclass = ?ComparisonEnsembleBrainPF_NS; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">ComparisonEnsembleBrainPF_NS constants</a>.
	%
	%
	% See also ComparisonEnsemble.
	
	properties (Constant) % properties
		LAYER = ComparisonEnsembleBrainPF.getPropNumber() + 1;
		LAYER_TAG = 'LAYER';
		LAYER_CATEGORY = Category.FIGURE;
		LAYER_FORMAT = Format.SCALAR;
		
		SIZE_DIFF = ComparisonEnsembleBrainPF.getPropNumber() + 2;
		SIZE_DIFF_TAG = 'SIZE_DIFF';
		SIZE_DIFF_CATEGORY = Category.FIGURE;
		SIZE_DIFF_FORMAT = Format.OPTION;
		
		SIZE_SCALE = ComparisonEnsembleBrainPF.getPropNumber() + 3;
		SIZE_SCALE_TAG = 'SIZE_SCALE';
		SIZE_SCALE_CATEGORY = Category.FIGURE;
		SIZE_SCALE_FORMAT = Format.SCALAR;
		
		COLOR_DIFF = ComparisonEnsembleBrainPF.getPropNumber() + 4;
		COLOR_DIFF_TAG = 'COLOR_DIFF';
		COLOR_DIFF_CATEGORY = Category.FIGURE;
		COLOR_DIFF_FORMAT = Format.OPTION;
		
		FDR = ComparisonEnsembleBrainPF.getPropNumber() + 5;
		FDR_TAG = 'FDR';
		FDR_CATEGORY = Category.FIGURE;
		FDR_FORMAT = Format.OPTION;
		
		QVALUE = ComparisonEnsembleBrainPF.getPropNumber() + 6;
		QVALUE_TAG = 'QVALUE';
		QVALUE_CATEGORY = Category.FIGURE;
		QVALUE_FORMAT = Format.SCALAR;
	end
	methods % constructor
		function pf = ComparisonEnsembleBrainPF_NS(varargin)
			%ComparisonEnsembleBrainPF_NS() creates a panel nodal superglobal ensemble-based comparison figure on brain surface figure.
			%
			% ComparisonEnsembleBrainPF_NS(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% ComparisonEnsembleBrainPF_NS(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			%
			% See also Category, Format.
			
			pf = pf@ComparisonEnsembleBrainPF(varargin{:});
		end
	end
	methods (Static) % inspection
		function pf_class = getClass()
			%GETCLASS returns the class of the panel nodal superglobal ensemble-based comparison figure on brain surface figure.
			%
			% CLASS = ComparisonEnsembleBrainPF_NS.GETCLASS() returns the class 'ComparisonEnsembleBrainPF_NS'.
			%
			% Alternative forms to call this method are:
			%  CLASS = PF.GETCLASS() returns the class of the panel nodal superglobal ensemble-based comparison figure on brain surface figure PF.
			%  CLASS = Element.GETCLASS(PF) returns the class of 'PF'.
			%  CLASS = Element.GETCLASS('ComparisonEnsembleBrainPF_NS') returns 'ComparisonEnsembleBrainPF_NS'.
			%
			% Note that the Element.GETCLASS(PF) and Element.GETCLASS('ComparisonEnsembleBrainPF_NS')
			%  are less computationally efficient.
			
			pf_class = 'ComparisonEnsembleBrainPF_NS';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the panel nodal superglobal ensemble-based comparison figure on brain surface figure.
			%
			% LIST = ComparisonEnsembleBrainPF_NS.GETSUBCLASSES() returns all subclasses of 'ComparisonEnsembleBrainPF_NS'.
			%
			% Alternative forms to call this method are:
			%  LIST = PF.GETSUBCLASSES() returns all subclasses of the panel nodal superglobal ensemble-based comparison figure on brain surface figure PF.
			%  LIST = Element.GETSUBCLASSES(PF) returns all subclasses of 'PF'.
			%  LIST = Element.GETSUBCLASSES('ComparisonEnsembleBrainPF_NS') returns all subclasses of 'ComparisonEnsembleBrainPF_NS'.
			%
			% Note that the Element.GETSUBCLASSES(PF) and Element.GETSUBCLASSES('ComparisonEnsembleBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = subclasses('ComparisonEnsembleBrainPF_NS', [], [], true);
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of panel nodal superglobal ensemble-based comparison figure on brain surface figure.
			%
			% PROPS = ComparisonEnsembleBrainPF_NS.GETPROPS() returns the property list of panel nodal superglobal ensemble-based comparison figure on brain surface figure
			%  as a row vector.
			%
			% PROPS = ComparisonEnsembleBrainPF_NS.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = PF.GETPROPS([CATEGORY]) returns the property list of the panel nodal superglobal ensemble-based comparison figure on brain surface figure PF.
			%  PROPS = Element.GETPROPS(PF[, CATEGORY]) returns the property list of 'PF'.
			%  PROPS = Element.GETPROPS('ComparisonEnsembleBrainPF_NS'[, CATEGORY]) returns the property list of 'ComparisonEnsembleBrainPF_NS'.
			%
			% Note that the Element.GETPROPS(PF) and Element.GETPROPS('ComparisonEnsembleBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			if nargin == 0
				prop_list = [ ...
					ComparisonEnsembleBrainPF.getProps() ...
						ComparisonEnsembleBrainPF_NS.LAYER ...
						ComparisonEnsembleBrainPF_NS.SIZE_DIFF ...
						ComparisonEnsembleBrainPF_NS.SIZE_SCALE ...
						ComparisonEnsembleBrainPF_NS.COLOR_DIFF ...
						ComparisonEnsembleBrainPF_NS.FDR ...
						ComparisonEnsembleBrainPF_NS.QVALUE ...
						];
				return
			end
			
			switch category
				case Category.CONSTANT
					prop_list = [ ...
						ComparisonEnsembleBrainPF.getProps(Category.CONSTANT) ...
						];
				case Category.METADATA
					prop_list = [ ...
						ComparisonEnsembleBrainPF.getProps(Category.METADATA) ...
						];
				case Category.PARAMETER
					prop_list = [ ...
						ComparisonEnsembleBrainPF.getProps(Category.PARAMETER) ...
						];
				case Category.DATA
					prop_list = [ ...
						ComparisonEnsembleBrainPF.getProps(Category.DATA) ...
						];
				case Category.RESULT
					prop_list = [
						ComparisonEnsembleBrainPF.getProps(Category.RESULT) ...
						];
				case Category.QUERY
					prop_list = [ ...
						ComparisonEnsembleBrainPF.getProps(Category.QUERY) ...
						];
				case Category.EVANESCENT
					prop_list = [ ...
						ComparisonEnsembleBrainPF.getProps(Category.EVANESCENT) ...
						];
				case Category.FIGURE
					prop_list = [ ...
						ComparisonEnsembleBrainPF.getProps(Category.FIGURE) ...
						ComparisonEnsembleBrainPF_NS.LAYER ...
						ComparisonEnsembleBrainPF_NS.SIZE_DIFF ...
						ComparisonEnsembleBrainPF_NS.SIZE_SCALE ...
						ComparisonEnsembleBrainPF_NS.COLOR_DIFF ...
						ComparisonEnsembleBrainPF_NS.FDR ...
						ComparisonEnsembleBrainPF_NS.QVALUE ...
						];
				case Category.GUI
					prop_list = [ ...
						ComparisonEnsembleBrainPF.getProps(Category.GUI) ...
						];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of panel nodal superglobal ensemble-based comparison figure on brain surface figure.
			%
			% N = ComparisonEnsembleBrainPF_NS.GETPROPNUMBER() returns the property number of panel nodal superglobal ensemble-based comparison figure on brain surface figure.
			%
			% N = ComparisonEnsembleBrainPF_NS.GETPROPNUMBER(CATEGORY) returns the property number of panel nodal superglobal ensemble-based comparison figure on brain surface figure
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = PF.GETPROPNUMBER([CATEGORY]) returns the property number of the panel nodal superglobal ensemble-based comparison figure on brain surface figure PF.
			%  N = Element.GETPROPNUMBER(PF) returns the property number of 'PF'.
			%  N = Element.GETPROPNUMBER('ComparisonEnsembleBrainPF_NS') returns the property number of 'ComparisonEnsembleBrainPF_NS'.
			%
			% Note that the Element.GETPROPNUMBER(PF) and Element.GETPROPNUMBER('ComparisonEnsembleBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			prop_number = numel(ComparisonEnsembleBrainPF_NS.getProps(varargin{:}));
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in panel nodal superglobal ensemble-based comparison figure on brain surface figure/error.
			%
			% CHECK = ComparisonEnsembleBrainPF_NS.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PF.EXISTSPROP(PROP) checks whether PROP exists for PF.
			%  CHECK = Element.EXISTSPROP(PF, PROP) checks whether PROP exists for PF.
			%  CHECK = Element.EXISTSPROP(ComparisonEnsembleBrainPF_NS, PROP) checks whether PROP exists for ComparisonEnsembleBrainPF_NS.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:ComparisonEnsembleBrainPF_NS:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PF.EXISTSPROP(PROP) throws error if PROP does NOT exist for PF.
			%   Error id: [BRAPH2:ComparisonEnsembleBrainPF_NS:WrongInput]
			%  Element.EXISTSPROP(PF, PROP) throws error if PROP does NOT exist for PF.
			%   Error id: [BRAPH2:ComparisonEnsembleBrainPF_NS:WrongInput]
			%  Element.EXISTSPROP(ComparisonEnsembleBrainPF_NS, PROP) throws error if PROP does NOT exist for ComparisonEnsembleBrainPF_NS.
			%   Error id: [BRAPH2:ComparisonEnsembleBrainPF_NS:WrongInput]
			%
			% Note that the Element.EXISTSPROP(PF) and Element.EXISTSPROP('ComparisonEnsembleBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(prop == ComparisonEnsembleBrainPF_NS.getProps());
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':ComparisonEnsembleBrainPF_NS:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':ComparisonEnsembleBrainPF_NS:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for ComparisonEnsembleBrainPF_NS.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in panel nodal superglobal ensemble-based comparison figure on brain surface figure/error.
			%
			% CHECK = ComparisonEnsembleBrainPF_NS.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PF.EXISTSTAG(TAG) checks whether TAG exists for PF.
			%  CHECK = Element.EXISTSTAG(PF, TAG) checks whether TAG exists for PF.
			%  CHECK = Element.EXISTSTAG(ComparisonEnsembleBrainPF_NS, TAG) checks whether TAG exists for ComparisonEnsembleBrainPF_NS.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:ComparisonEnsembleBrainPF_NS:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PF.EXISTSTAG(TAG) throws error if TAG does NOT exist for PF.
			%   Error id: [BRAPH2:ComparisonEnsembleBrainPF_NS:WrongInput]
			%  Element.EXISTSTAG(PF, TAG) throws error if TAG does NOT exist for PF.
			%   Error id: [BRAPH2:ComparisonEnsembleBrainPF_NS:WrongInput]
			%  Element.EXISTSTAG(ComparisonEnsembleBrainPF_NS, TAG) throws error if TAG does NOT exist for ComparisonEnsembleBrainPF_NS.
			%   Error id: [BRAPH2:ComparisonEnsembleBrainPF_NS:WrongInput]
			%
			% Note that the Element.EXISTSTAG(PF) and Element.EXISTSTAG('ComparisonEnsembleBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			comparisonensemblebrainpf_ns_tag_list = cellfun(@(x) ComparisonEnsembleBrainPF_NS.getPropTag(x), num2cell(ComparisonEnsembleBrainPF_NS.getProps()), 'UniformOutput', false);
			check = any(strcmp(tag, comparisonensemblebrainpf_ns_tag_list));
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':ComparisonEnsembleBrainPF_NS:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':ComparisonEnsembleBrainPF_NS:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tag ' is not a valid tag for ComparisonEnsembleBrainPF_NS.'] ...
					)
			end
		end
		function prop = getPropProp(pointer)
			%GETPROPPROP returns the property number of a property.
			%
			% PROP = Element.GETPROPPROP(PROP) returns PROP, i.e., the 
			%  property number of the property PROP.
			%
			% PROP = Element.GETPROPPROP(TAG) returns the property number 
			%  of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  PROPERTY = PF.GETPROPPROP(POINTER) returns property number of POINTER of PF.
			%  PROPERTY = Element.GETPROPPROP(ComparisonEnsembleBrainPF_NS, POINTER) returns property number of POINTER of ComparisonEnsembleBrainPF_NS.
			%  PROPERTY = PF.GETPROPPROP(ComparisonEnsembleBrainPF_NS, POINTER) returns property number of POINTER of ComparisonEnsembleBrainPF_NS.
			%
			% Note that the Element.GETPROPPROP(PF) and Element.GETPROPPROP('ComparisonEnsembleBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				comparisonensemblebrainpf_ns_tag_list = cellfun(@(x) ComparisonEnsembleBrainPF_NS.getPropTag(x), num2cell(ComparisonEnsembleBrainPF_NS.getProps()), 'UniformOutput', false);
				prop = find(strcmp(pointer, comparisonensemblebrainpf_ns_tag_list)); % tag = pointer
			else % numeric
				prop = pointer;
			end
		end
		function tag = getPropTag(pointer)
			%GETPROPTAG returns the tag of a property.
			%
			% TAG = Element.GETPROPTAG(PROP) returns the tag TAG of the 
			%  property PROP.
			%
			% TAG = Element.GETPROPTAG(TAG) returns TAG, i.e. the tag of 
			%  the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  TAG = PF.GETPROPTAG(POINTER) returns tag of POINTER of PF.
			%  TAG = Element.GETPROPTAG(ComparisonEnsembleBrainPF_NS, POINTER) returns tag of POINTER of ComparisonEnsembleBrainPF_NS.
			%  TAG = PF.GETPROPTAG(ComparisonEnsembleBrainPF_NS, POINTER) returns tag of POINTER of ComparisonEnsembleBrainPF_NS.
			%
			% Note that the Element.GETPROPTAG(PF) and Element.GETPROPTAG('ComparisonEnsembleBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				prop = pointer;
				
				switch prop
					case ComparisonEnsembleBrainPF_NS.LAYER
						tag = ComparisonEnsembleBrainPF_NS.LAYER_TAG;
					case ComparisonEnsembleBrainPF_NS.SIZE_DIFF
						tag = ComparisonEnsembleBrainPF_NS.SIZE_DIFF_TAG;
					case ComparisonEnsembleBrainPF_NS.SIZE_SCALE
						tag = ComparisonEnsembleBrainPF_NS.SIZE_SCALE_TAG;
					case ComparisonEnsembleBrainPF_NS.COLOR_DIFF
						tag = ComparisonEnsembleBrainPF_NS.COLOR_DIFF_TAG;
					case ComparisonEnsembleBrainPF_NS.FDR
						tag = ComparisonEnsembleBrainPF_NS.FDR_TAG;
					case ComparisonEnsembleBrainPF_NS.QVALUE
						tag = ComparisonEnsembleBrainPF_NS.QVALUE_TAG;
					otherwise
						tag = getPropTag@ComparisonEnsembleBrainPF(prop);
				end
			end
		end
		function prop_category = getPropCategory(pointer)
			%GETPROPCATEGORY returns the category of a property.
			%
			% CATEGORY = Element.GETPROPCATEGORY(PROP) returns the category of the
			%  property PROP.
			%
			% CATEGORY = Element.GETPROPCATEGORY(TAG) returns the category of the
			%  property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CATEGORY = PF.GETPROPCATEGORY(POINTER) returns category of POINTER of PF.
			%  CATEGORY = Element.GETPROPCATEGORY(ComparisonEnsembleBrainPF_NS, POINTER) returns category of POINTER of ComparisonEnsembleBrainPF_NS.
			%  CATEGORY = PF.GETPROPCATEGORY(ComparisonEnsembleBrainPF_NS, POINTER) returns category of POINTER of ComparisonEnsembleBrainPF_NS.
			%
			% Note that the Element.GETPROPCATEGORY(PF) and Element.GETPROPCATEGORY('ComparisonEnsembleBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = ComparisonEnsembleBrainPF_NS.getPropProp(pointer);
			
			switch prop
				case ComparisonEnsembleBrainPF_NS.LAYER
					prop_category = ComparisonEnsembleBrainPF_NS.LAYER_CATEGORY;
				case ComparisonEnsembleBrainPF_NS.SIZE_DIFF
					prop_category = ComparisonEnsembleBrainPF_NS.SIZE_DIFF_CATEGORY;
				case ComparisonEnsembleBrainPF_NS.SIZE_SCALE
					prop_category = ComparisonEnsembleBrainPF_NS.SIZE_SCALE_CATEGORY;
				case ComparisonEnsembleBrainPF_NS.COLOR_DIFF
					prop_category = ComparisonEnsembleBrainPF_NS.COLOR_DIFF_CATEGORY;
				case ComparisonEnsembleBrainPF_NS.FDR
					prop_category = ComparisonEnsembleBrainPF_NS.FDR_CATEGORY;
				case ComparisonEnsembleBrainPF_NS.QVALUE
					prop_category = ComparisonEnsembleBrainPF_NS.QVALUE_CATEGORY;
				otherwise
					prop_category = getPropCategory@ComparisonEnsembleBrainPF(prop);
			end
		end
		function prop_format = getPropFormat(pointer)
			%GETPROPFORMAT returns the format of a property.
			%
			% FORMAT = Element.GETPROPFORMAT(PROP) returns the
			%  format of the property PROP.
			%
			% FORMAT = Element.GETPROPFORMAT(TAG) returns the
			%  format of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  FORMAT = PF.GETPROPFORMAT(POINTER) returns format of POINTER of PF.
			%  FORMAT = Element.GETPROPFORMAT(ComparisonEnsembleBrainPF_NS, POINTER) returns format of POINTER of ComparisonEnsembleBrainPF_NS.
			%  FORMAT = PF.GETPROPFORMAT(ComparisonEnsembleBrainPF_NS, POINTER) returns format of POINTER of ComparisonEnsembleBrainPF_NS.
			%
			% Note that the Element.GETPROPFORMAT(PF) and Element.GETPROPFORMAT('ComparisonEnsembleBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = ComparisonEnsembleBrainPF_NS.getPropProp(pointer);
			
			switch prop
				case ComparisonEnsembleBrainPF_NS.LAYER
					prop_format = ComparisonEnsembleBrainPF_NS.LAYER_FORMAT;
				case ComparisonEnsembleBrainPF_NS.SIZE_DIFF
					prop_format = ComparisonEnsembleBrainPF_NS.SIZE_DIFF_FORMAT;
				case ComparisonEnsembleBrainPF_NS.SIZE_SCALE
					prop_format = ComparisonEnsembleBrainPF_NS.SIZE_SCALE_FORMAT;
				case ComparisonEnsembleBrainPF_NS.COLOR_DIFF
					prop_format = ComparisonEnsembleBrainPF_NS.COLOR_DIFF_FORMAT;
				case ComparisonEnsembleBrainPF_NS.FDR
					prop_format = ComparisonEnsembleBrainPF_NS.FDR_FORMAT;
				case ComparisonEnsembleBrainPF_NS.QVALUE
					prop_format = ComparisonEnsembleBrainPF_NS.QVALUE_FORMAT;
				otherwise
					prop_format = getPropFormat@ComparisonEnsembleBrainPF(prop);
			end
		end
		function prop_description = getPropDescription(pointer)
			%GETPROPDESCRIPTION returns the description of a property.
			%
			% DESCRIPTION = Element.GETPROPDESCRIPTION(PROP) returns the
			%  description of the property PROP.
			%
			% DESCRIPTION = Element.GETPROPDESCRIPTION(TAG) returns the
			%  description of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DESCRIPTION = PF.GETPROPDESCRIPTION(POINTER) returns description of POINTER of PF.
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(ComparisonEnsembleBrainPF_NS, POINTER) returns description of POINTER of ComparisonEnsembleBrainPF_NS.
			%  DESCRIPTION = PF.GETPROPDESCRIPTION(ComparisonEnsembleBrainPF_NS, POINTER) returns description of POINTER of ComparisonEnsembleBrainPF_NS.
			%
			% Note that the Element.GETPROPDESCRIPTION(PF) and Element.GETPROPDESCRIPTION('ComparisonEnsembleBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = ComparisonEnsembleBrainPF_NS.getPropProp(pointer);
			
			switch prop
				case ComparisonEnsembleBrainPF_NS.LAYER
					prop_description = 'LAYER (figure, scalar) is the layer number of the nodal measure.';
				case ComparisonEnsembleBrainPF_NS.SIZE_DIFF
					prop_description = 'SIZE_DIFF (figure, option) determines whether the difference is shown with size effect.';
				case ComparisonEnsembleBrainPF_NS.SIZE_SCALE
					prop_description = 'SIZE_SCALE (figure, scalar) determines the scale of size effect.';
				case ComparisonEnsembleBrainPF_NS.COLOR_DIFF
					prop_description = 'COLOR_DIFF (figure, option) determines whether the difference is shown with color effect.';
				case ComparisonEnsembleBrainPF_NS.FDR
					prop_description = 'FDR (figure, option) determines whether the difference is shown with FDR correction.';
				case ComparisonEnsembleBrainPF_NS.QVALUE
					prop_description = 'QVALUE (figure, scalar) determines the QVALUE for FDR correction.';
				case ComparisonEnsembleBrainPF_NS.ELCLASS
					prop_description = 'ELCLASS (constant, string) is the class of % % % .';
				case ComparisonEnsembleBrainPF_NS.NAME
					prop_description = 'NAME (constant, string) is the name of the panel figure nodal superglobal ensemble-based comparison figure on brain surface.';
				case ComparisonEnsembleBrainPF_NS.DESCRIPTION
					prop_description = 'DESCRIPTION (constant, string) is the description of the panel figure nodal superglobal ensemble-based comparison figure on brain surface.';
				case ComparisonEnsembleBrainPF_NS.TEMPLATE
					prop_description = 'TEMPLATE (parameter, item) is the template of the panel figure nodal superglobal ensemble-based comparison figure on brain surface.';
				case ComparisonEnsembleBrainPF_NS.ID
					prop_description = 'ID (data, string) is a few-letter code for the panel figure nodal superglobal ensemble-based comparison figure on brain surface.';
				case ComparisonEnsembleBrainPF_NS.LABEL
					prop_description = 'LABEL (metadata, string) is an extended label of the panel figure nodal superglobal ensemble-based comparison figure on brain surface.';
				case ComparisonEnsembleBrainPF_NS.NOTES
					prop_description = 'NOTES (metadata, string) are some specific notes about the panel figure nodal superglobal ensemble-based comparison figure on brain surface.';
				case ComparisonEnsembleBrainPF_NS.SETUP
					prop_description = 'SETUP (query, empty) calculates the diff value and stores it to be implemented in the subelements.';
				otherwise
					prop_description = getPropDescription@ComparisonEnsembleBrainPF(prop);
			end
		end
		function prop_settings = getPropSettings(pointer)
			%GETPROPSETTINGS returns the settings of a property.
			%
			% SETTINGS = Element.GETPROPSETTINGS(PROP) returns the
			%  settings of the property PROP.
			%
			% SETTINGS = Element.GETPROPSETTINGS(TAG) returns the
			%  settings of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  SETTINGS = PF.GETPROPSETTINGS(POINTER) returns settings of POINTER of PF.
			%  SETTINGS = Element.GETPROPSETTINGS(ComparisonEnsembleBrainPF_NS, POINTER) returns settings of POINTER of ComparisonEnsembleBrainPF_NS.
			%  SETTINGS = PF.GETPROPSETTINGS(ComparisonEnsembleBrainPF_NS, POINTER) returns settings of POINTER of ComparisonEnsembleBrainPF_NS.
			%
			% Note that the Element.GETPROPSETTINGS(PF) and Element.GETPROPSETTINGS('ComparisonEnsembleBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = ComparisonEnsembleBrainPF_NS.getPropProp(pointer);
			
			switch prop
				case ComparisonEnsembleBrainPF_NS.LAYER
					prop_settings = Format.getFormatSettings(Format.SCALAR);
				case ComparisonEnsembleBrainPF_NS.SIZE_DIFF
					prop_settings = {'on' 'off' 'disable'};
				case ComparisonEnsembleBrainPF_NS.SIZE_SCALE
					prop_settings = Format.getFormatSettings(Format.SCALAR);
				case ComparisonEnsembleBrainPF_NS.COLOR_DIFF
					prop_settings = {'on' 'off' 'disable'};
				case ComparisonEnsembleBrainPF_NS.FDR
					prop_settings = {'on' 'off' 'disable'};
				case ComparisonEnsembleBrainPF_NS.QVALUE
					prop_settings = Format.getFormatSettings(Format.SCALAR);
				case ComparisonEnsembleBrainPF_NS.TEMPLATE
					prop_settings = 'ComparisonEnsembleBrainPF_NS';
				otherwise
					prop_settings = getPropSettings@ComparisonEnsembleBrainPF(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = ComparisonEnsembleBrainPF_NS.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = ComparisonEnsembleBrainPF_NS.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PF.GETPROPDEFAULT(POINTER) returns the default value of POINTER of PF.
			%  DEFAULT = Element.GETPROPDEFAULT(ComparisonEnsembleBrainPF_NS, POINTER) returns the default value of POINTER of ComparisonEnsembleBrainPF_NS.
			%  DEFAULT = PF.GETPROPDEFAULT(ComparisonEnsembleBrainPF_NS, POINTER) returns the default value of POINTER of ComparisonEnsembleBrainPF_NS.
			%
			% Note that the Element.GETPROPDEFAULT(PF) and Element.GETPROPDEFAULT('ComparisonEnsembleBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = ComparisonEnsembleBrainPF_NS.getPropProp(pointer);
			
			switch prop
				case ComparisonEnsembleBrainPF_NS.LAYER
					prop_default = 1;
				case ComparisonEnsembleBrainPF_NS.SIZE_DIFF
					prop_default = 'on';
				case ComparisonEnsembleBrainPF_NS.SIZE_SCALE
					prop_default = 10;
				case ComparisonEnsembleBrainPF_NS.COLOR_DIFF
					prop_default = 'on';
				case ComparisonEnsembleBrainPF_NS.FDR
					prop_default = 'off';
				case ComparisonEnsembleBrainPF_NS.QVALUE
					prop_default = 0.05;
				case ComparisonEnsembleBrainPF_NS.ELCLASS
					prop_default = 'ComparisonEnsembleBrainPF_NS';
				case ComparisonEnsembleBrainPF_NS.NAME
					prop_default = 'ComparisonEnsembleBrainPF_NS';
				case ComparisonEnsembleBrainPF_NS.DESCRIPTION
					prop_default = 'ComparisonEnsembleBrainPF_NS manages the basic functionalities to plot of a nodal superglobal ensemble-based comparison figure on brain surface.';
				case ComparisonEnsembleBrainPF_NS.TEMPLATE
					prop_default = Format.getFormatDefault(Format.ITEM, ComparisonEnsembleBrainPF_NS.getPropSettings(prop));
				case ComparisonEnsembleBrainPF_NS.ID
					prop_default = 'ComparisonEnsembleBrainPF_NS ID';
				case ComparisonEnsembleBrainPF_NS.LABEL
					prop_default = 'ComparisonEnsembleBrainPF_NS label';
				case ComparisonEnsembleBrainPF_NS.NOTES
					prop_default = 'ComparisonEnsembleBrainPF_NS notes';
				otherwise
					prop_default = getPropDefault@ComparisonEnsembleBrainPF(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = ComparisonEnsembleBrainPF_NS.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = ComparisonEnsembleBrainPF_NS.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PF.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of PF.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(ComparisonEnsembleBrainPF_NS, POINTER) returns the conditioned default value of POINTER of ComparisonEnsembleBrainPF_NS.
			%  DEFAULT = PF.GETPROPDEFAULTCONDITIONED(ComparisonEnsembleBrainPF_NS, POINTER) returns the conditioned default value of POINTER of ComparisonEnsembleBrainPF_NS.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(PF) and Element.GETPROPDEFAULTCONDITIONED('ComparisonEnsembleBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = ComparisonEnsembleBrainPF_NS.getPropProp(pointer);
			
			prop_default = ComparisonEnsembleBrainPF_NS.conditioning(prop, ComparisonEnsembleBrainPF_NS.getPropDefault(prop));
		end
	end
	methods (Static) % checkProp
		function prop_check = checkProp(pointer, value)
			%CHECKPROP checks whether a value has the correct format/error.
			%
			% CHECK = PF.CHECKPROP(POINTER, VALUE) checks whether
			%  VALUE is an acceptable value for the format of the property
			%  POINTER (POINTER = PROP or TAG).
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CHECK = PF.CHECKPROP(POINTER, VALUE) checks VALUE format for PROP of PF.
			%  CHECK = Element.CHECKPROP(ComparisonEnsembleBrainPF_NS, PROP, VALUE) checks VALUE format for PROP of ComparisonEnsembleBrainPF_NS.
			%  CHECK = PF.CHECKPROP(ComparisonEnsembleBrainPF_NS, PROP, VALUE) checks VALUE format for PROP of ComparisonEnsembleBrainPF_NS.
			% 
			% PF.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: €BRAPH2.STR€:ComparisonEnsembleBrainPF_NS:€BRAPH2.WRONG_INPUT€
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  PF.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of PF.
			%   Error id: €BRAPH2.STR€:ComparisonEnsembleBrainPF_NS:€BRAPH2.WRONG_INPUT€
			%  Element.CHECKPROP(ComparisonEnsembleBrainPF_NS, PROP, VALUE) throws error if VALUE has not a valid format for PROP of ComparisonEnsembleBrainPF_NS.
			%   Error id: €BRAPH2.STR€:ComparisonEnsembleBrainPF_NS:€BRAPH2.WRONG_INPUT€
			%  PF.CHECKPROP(ComparisonEnsembleBrainPF_NS, PROP, VALUE) throws error if VALUE has not a valid format for PROP of ComparisonEnsembleBrainPF_NS.
			%   Error id: €BRAPH2.STR€:ComparisonEnsembleBrainPF_NS:€BRAPH2.WRONG_INPUT€]
			% 
			% Note that the Element.CHECKPROP(PF) and Element.CHECKPROP('ComparisonEnsembleBrainPF_NS')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = ComparisonEnsembleBrainPF_NS.getPropProp(pointer);
			
			switch prop
				case ComparisonEnsembleBrainPF_NS.LAYER % __ComparisonEnsembleBrainPF_NS.LAYER__
					check = Format.checkFormat(Format.SCALAR, value, ComparisonEnsembleBrainPF_NS.getPropSettings(prop));
				case ComparisonEnsembleBrainPF_NS.SIZE_DIFF % __ComparisonEnsembleBrainPF_NS.SIZE_DIFF__
					check = Format.checkFormat(Format.OPTION, value, ComparisonEnsembleBrainPF_NS.getPropSettings(prop));
				case ComparisonEnsembleBrainPF_NS.SIZE_SCALE % __ComparisonEnsembleBrainPF_NS.SIZE_SCALE__
					check = Format.checkFormat(Format.SCALAR, value, ComparisonEnsembleBrainPF_NS.getPropSettings(prop));
				case ComparisonEnsembleBrainPF_NS.COLOR_DIFF % __ComparisonEnsembleBrainPF_NS.COLOR_DIFF__
					check = Format.checkFormat(Format.OPTION, value, ComparisonEnsembleBrainPF_NS.getPropSettings(prop));
				case ComparisonEnsembleBrainPF_NS.FDR % __ComparisonEnsembleBrainPF_NS.FDR__
					check = Format.checkFormat(Format.OPTION, value, ComparisonEnsembleBrainPF_NS.getPropSettings(prop));
				case ComparisonEnsembleBrainPF_NS.QVALUE % __ComparisonEnsembleBrainPF_NS.QVALUE__
					check = Format.checkFormat(Format.SCALAR, value, ComparisonEnsembleBrainPF_NS.getPropSettings(prop));
				case ComparisonEnsembleBrainPF_NS.TEMPLATE % __ComparisonEnsembleBrainPF_NS.TEMPLATE__
					check = Format.checkFormat(Format.ITEM, value, ComparisonEnsembleBrainPF_NS.getPropSettings(prop));
				otherwise
					if prop <= ComparisonEnsembleBrainPF.getPropNumber()
						check = checkProp@ComparisonEnsembleBrainPF(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					[BRAPH2.STR ':ComparisonEnsembleBrainPF_NS:' BRAPH2.WRONG_INPUT], ...
					[BRAPH2.STR ':ComparisonEnsembleBrainPF_NS:' BRAPH2.WRONG_INPUT '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' ComparisonEnsembleBrainPF_NS.getPropTag(prop) ' (' ComparisonEnsembleBrainPF_NS.getFormatTag(ComparisonEnsembleBrainPF_NS.getPropFormat(prop)) ').'] ...
					)
			end
		end
	end
	methods (Access=protected) % postset
		function postset(pf, prop)
			%POSTSET postprocessing after a prop has been set.
			%
			% POSTPROCESSING(EL, PROP) postprocessesing after PROP has been set. By
			%  default, this function does not do anything, so it should be implemented
			%  in the subclasses of Element when needed.
			%
			% This postprocessing occurs only when PROP is set.
			%
			% See also conditioning, preset, checkProp, postprocessing, calculateValue,
			%  checkValue.
			
			switch prop
				case ComparisonEnsembleBrainPF_NS.LAYER % __ComparisonEnsembleBrainPF_NS.LAYER__
					pf.get('SETUP');
					
				case ComparisonEnsembleBrainPF_NS.SIZE_DIFF % __ComparisonEnsembleBrainPF_NS.SIZE_DIFF__
					pf.get('SETUP');
					
				case ComparisonEnsembleBrainPF_NS.SIZE_SCALE % __ComparisonEnsembleBrainPF_NS.SIZE_SCALE__
					pf.get('SETUP');
					
				case ComparisonEnsembleBrainPF_NS.COLOR_DIFF % __ComparisonEnsembleBrainPF_NS.COLOR_DIFF__
					pf.get('SETUP');
					
				case ComparisonEnsembleBrainPF_NS.FDR % __ComparisonEnsembleBrainPF_NS.FDR__
					pf.get('SETUP');
					
				case ComparisonEnsembleBrainPF_NS.QVALUE % __ComparisonEnsembleBrainPF_NS.QVALUE__
					pf.get('CP').set('QVALUE', pf.get('QVALUE'));
					pf.get('SETUP');
					
				otherwise
					if prop <= ComparisonEnsembleBrainPF.getPropNumber()
						postset@ComparisonEnsembleBrainPF(pf, prop);
					end
			end
		end
	end
	methods (Access=protected) % postprocessing
		function postprocessing(pf, prop)
			%POSTPROCESSING postprocessesing after setting.
			%
			% POSTPROCESSING(EL, PROP) postprocessesing of PROP after setting. By
			%  default, this function does not do anything, so it should be implemented
			%  in the subclasses of Element when needed.
			%
			% The postprocessing of all properties occurs each time set is called.
			%
			% See also conditioning, preset, checkProp, postset, calculateValue,
			%  checkValue.
			
			switch prop
				case ComparisonEnsembleBrainPF_NS.QVALUE % __ComparisonEnsembleBrainPF_NS.QVALUE__
					if isempty(pf.get('QVALUE'))
					    pf.set('QVALUE', pf.get('CP').get('QVALUE'));
					end
					
				otherwise
					if prop <= ComparisonEnsembleBrainPF.getPropNumber()
						postprocessing@ComparisonEnsembleBrainPF(pf, prop);
					end
			end
		end
	end
	methods (Access=protected) % calculate value
		function value = calculateValue(pf, prop, varargin)
			%CALCULATEVALUE calculates the value of a property.
			%
			% VALUE = CALCULATEVALUE(EL, PROP) calculates the value of the property
			%  PROP. It works only with properties with Category.RESULT,
			%  Category.QUERY, and Category.EVANESCENT. By default this function
			%  returns the default value for the prop and should be implemented in the
			%  subclasses of Element when needed.
			%
			% VALUE = CALCULATEVALUE(EL, PROP, VARARGIN) works with properties with
			%  Category.QUERY.
			%
			% See also getPropDefaultConditioned, conditioning, preset, checkProp,
			%  postset, postprocessing, checkValue.
			
			switch prop
				case ComparisonEnsembleBrainPF_NS.SETUP % __ComparisonEnsembleBrainPF_NS.SETUP__
					cp = pf.get('CP');
					g = cp.get('C').get('A1').get('GRAPH_TEMPLATE');
					
					% get brain region related list
					sph_list = pf.get('SPH_DICT').get('IT_LIST');
					sym_list = pf.get('SYM_DICT').get('IT_LIST');
					id_list = pf.get('ID_DICT').get('IT_LIST');
					lab_list = pf.get('LAB_DICT').get('IT_LIST');
					
					% get the value to show on the surface
					layer = pf.get('LAYER');
					diffs = cp.get('DIFF');
					if isempty(diffs)
					    value = {};
					    return
					end
					diff = diffs{layer};
					p2s = cp.get('P2');
					p2 = p2s{layer};
					
					% apply FDR to spheres, symbols, ids, and labels
					fdr_diff = pf.get('FDR');
					switch fdr_diff
					    case 'on'
					        [~, mask] = fdr(p2', pf.get('QVALUE'));
					        for i = 1:1:length(sph_list)
					            set(sph_list{i}, 'VISIBLE', mask(i));
					        end
					        for i = 1:1:length(sym_list)
					            set(sym_list{i}, 'VISIBLE', mask(i));
					        end
					        for i = 1:1:length(id_list)
					            set(id_list{i}, 'VISIBLE', mask(i));
					        end
					        for i = 1:1:length(lab_list)
					            set(lab_list{i}, 'VISIBLE', mask(i));
					        end
					    case 'off'
					        if pf.get('SPHS')
					            for i = 1:1:length(sph_list)
					                set(sph_list{i}, 'VISIBLE', true);
					            end
					        end
					        if pf.get('SYMS')
					            for i = 1:1:length(sym_list)
					                set(sym_list{i}, 'VISIBLE', true);
					            end
					        end
					        if pf.get('IDS')
					            for i = 1:1:length(id_list)
					                set(id_list{i}, 'VISIBLE', true);
					            end
					        end
					        if pf.get('LABS')
					            for i = 1:1:length(lab_list)
					                set(lab_list{i}, 'VISIBLE', true);
					            end
					        end
					    case 'disable'
					end
					
					size_diff = pf.get('SIZE_DIFF');
					switch size_diff
					    case 'on'
					        % transfrom diff value to appropriate size
					        % value ranching from 0.01 to 1
					        diff(isnan(diff)) = 0.1;
					        size_value = abs(diff);
					        min_bound = 0.01;
					        max_bound = 1.0;
					        min_size_value = min(size_value);
					        max_size_value = max(size_value);
					        if max_size_value == min_size_value
					            normalized_size_value = ones(size(size_value)) * max_bound;
					        else
					            normalized_size_value = min_bound + (max_bound - min_bound) * (size_value - min_size_value) / (max_size_value - min_size_value);
					        end
					        size_scale = pf.get('SIZE_SCALE');
					        scaled_size_value = normalized_size_value * size_scale;
					
					        % set size to sphs
					        for i = 1:1:length(sph_list)
					            set(sph_list{i}, 'SPHERESIZE', scaled_size_value(i));
					        end
					    case 'off'
					        if pf.get('SPHS')
					            for i = 1:1:length(sph_list)
					                set(sph_list{i}, 'SPHERESIZE', SettingsSphere.getPropDefault('SPHERESIZE'));
					            end
					        end
					    case 'disable'
					end
					
					color_diff = pf.get('COLOR_DIFF');
					switch color_diff
					    case 'on'
					        % transfrom diff value to appropriate color
					        % code
					        color_code_list = cell(size(diff));
					
					        for i = 1:numel(color_code_list)
					            if diff(i) > 0
					                color_code_list{i} = [1 0 0]; % Red
					            elseif diff(i) < 0
					                color_code_list{i} = [0 0 1]; % Blue
					            else
					                color_code_list{i} = [0 0 0]; % Black (or any other color for zero)
					            end
					        end
					
					        % set color to sphs
					        cellfun(@(sph, color_code) set(sph, 'FACECOLOR', color_code), sph_list, color_code_list', 'UniformOutput', false);
					    case 'off'
					        if pf.get('SPHS')
					            for i = 1:1:length(sph_list)
					                set(sph_list{i}, 'FACECOLOR', SettingsSphere.getPropDefault('FACECOLOR'));
					            end
					        end
					    case 'disable'
					end
					
					value = {};
					
				otherwise
					if prop <= ComparisonEnsembleBrainPF.getPropNumber()
						value = calculateValue@ComparisonEnsembleBrainPF(pf, prop, varargin{:});
					else
						value = calculateValue@Element(pf, prop, varargin{:});
					end
			end
			
		end
	end
end
