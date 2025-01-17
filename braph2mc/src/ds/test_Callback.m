%TEST_CALLBACK

%% Test 1: Inspection Methods
if rand() >= (1 - .01) * BRAPH2TEST.RANDOM
	categories = num2cell(Category.getCategories());
	cb = Callback();
	 
	% get('ELCLASS')
	if isa(Callback, 'ConcreteElement')
		assert(strcmp(Callback().get('ELCLASS'), 'Callback'), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Callback().get(''ELCLASS'') should return ''Callback''.')
	end
	 
	% getClass
	assert(strcmp(Callback.getClass(), 'Callback'), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Callback.getClass() should return ''Callback''.')
	assert(strcmp(cb.getClass(), 'Callback'), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'cb.getClass() should return ''Callback''.')
	assert(strcmp(Element.getClass(cb), 'Callback'), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Element.getClass(cb) should return ''Callback''.')
	assert(strcmp(Element.getClass('Callback'), 'Callback'), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Element.getClass(''Callback'') should return ''Callback''.')
	 
	% getSubclasses()
	assert(isequal(Callback.getSubclasses(), subclasses('Callback', [], [], true)), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Callback.getSubclasses() should return the same result as subclasses(''Callback'', [], [], true).')
	assert(isequal(cb.getSubclasses(), subclasses('Callback', [], [], true)), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'el.getSubclasses() should return the same result as subclasses(''Callback'', [], [], true).')
	assert(isequal(Element.getSubclasses(cb), subclasses('Callback', [], [], true)), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Element.getSubclasses(cb) should return the same result as subclasses(''Callback'', [], [], true).')
	assert(isequal(Element.getSubclasses('Callback'), subclasses('Callback', [], [], true)), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Element.getSubclasses(''Callback'') should return the same result as subclasses(''Callback'', [], [], true).')
	 
	% getProps()
	assert(isempty(Callback.getProps()) || isequal(Callback.getProps(), 1:1:length(Callback.getProps())), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Callback.getProps() should return a row vector [1:1:N].')
	assert(isempty(Callback.getProps()) || isequal(cb.getProps(), 1:1:length(Callback.getProps())), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'cb.getProps() should return a row vector [1:1:N].')
	assert(isempty(Callback.getProps()) || isequal(Element.getProps(cb), 1:1:length(Callback.getProps())), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Element.getProps(cb) should return a row vector [1:1:N].')
	assert(isempty(Callback.getProps()) || isequal(Element.getProps('Callback'), 1:1:length(Callback.getProps())), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Element.getProps(''Callback'') should return a row vector [1:1:N].')
	 
	% getProps(category)
	tmp = cellfun(@(category) Callback.getProps(category), categories, 'UniformOutput', false);
	assert(isempty(Callback.getProps()) || isequal(sort(horzcat(tmp{:})), 1:1:length(Callback.getProps())), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Callback.getProps(category) does not work.')
	tmp = cellfun(@(category) cb.getProps(category), categories, 'UniformOutput', false);
	assert(isempty(Callback.getProps()) || isequal(sort(horzcat(tmp{:})), 1:1:length(Callback.getProps())), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'cb.getProps(category) does not work.')
	tmp = cellfun(@(category) Element.getProps(cb, category), categories, 'UniformOutput', false);
	assert(isempty(Callback.getProps()) || isequal(sort(horzcat(tmp{:})), 1:1:length(Callback.getProps())), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Element.getProps(cb, category) does not work.')
	tmp = cellfun(@(category) Element.getProps('Callback', category), categories, 'UniformOutput', false);
	assert(isempty(Callback.getProps()) || isequal(sort(horzcat(tmp{:})), 1:1:length(Callback.getProps())), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Element.getProps(''Callback'', category) does not work.')
	 
	% getPropNumber()
	assert(Callback.getPropNumber() == length(Callback.getProps()), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Callback.getPropNumber() should return the number of properties.')
	assert(cb.getPropNumber() == length(Callback.getProps()), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'cb.getPropNumber() should return the number of properties.')
	assert(Element.getPropNumber(cb) == length(Callback.getProps()), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Element.getPropNumber(cb) should return the number of properties.')
	assert(Element.getPropNumber('Callback') == length(Callback.getProps()), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Element.getPropNumber(''Callback'') should return the number of properties.')
	 
	% getPropNumber(category)
	assert(sum(cellfun(@(category) Callback.getPropNumber(category), categories)) == Callback.getPropNumber(), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Callback.getPropNumber(category) does not work.')
	assert(sum(cellfun(@(category) cb.getPropNumber(category), categories)) == Callback.getPropNumber(), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'cb.getPropNumber(category) does not work.')
	assert(sum(cellfun(@(category) Element.getPropNumber(cb, category), categories)) == Callback.getPropNumber(), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Element.getPropNumber(cb, category) does not work.')
	assert(sum(cellfun(@(category) Element.getPropNumber('Callback', category), categories)) == Callback.getPropNumber(), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Element.getPropNumber(''Callback'', category) does not work.')
	 
	% existsProp(prop)
	assert(~Callback.existsProp(NaN), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Callback.existsProp(prop) does not work.')
	assert(~cb.existsProp(NaN), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'cb.existsProp(prop) does not work.')
	assert(~Element.existsProp(cb, NaN), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Element.existsProp(cb, prop) does not work.')
	assert(~Element.existsProp('Callback', NaN), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Element.existsProp(''Callback'', prop) does not work.')
	 
	assert_with_error('Callback.existsProp(NaN)', [BRAPH2.STR ':Callback:' BRAPH2.WRONG_INPUT])
	assert_with_error('varargin{1}.existsProp(NaN)', [BRAPH2.STR ':Callback:' BRAPH2.WRONG_INPUT], cb)
	assert_with_error('Element.existsProp(varargin{1}, NaN)', [BRAPH2.STR ':Callback:' BRAPH2.WRONG_INPUT], cb)
	assert_with_error('Element.existsProp(''Callback'', NaN)', [BRAPH2.STR ':Callback:' BRAPH2.WRONG_INPUT])
	 
	for prop = 1:1:Callback.getPropNumber()
		assert(Callback.existsProp(prop), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Callback.existsProp(prop) does not work.')
		assert(cb.existsProp(prop), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'cb.existsProp(prop) does not work.')
		assert(Element.existsProp(cb, prop), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.existsProp(cb, prop) does not work.')
		assert(Element.existsProp('Callback', prop), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.existsProp(''Callback'', prop) does not work.')
	end
	 
	% existsTag(tag)
	assert(~Callback.existsTag(''), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Callback.existsTag(tag) does not work.')
	assert(~cb.existsTag(''), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'cb.existsTag(tag) does not work.')
	assert(~Element.existsTag(cb, ''), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Element.existsTag(cb, tag) does not work.')
	assert(~Element.existsTag('Callback', ''), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		'Element.existsTag(''Callback'', tag) does not work.')
	 
	assert_with_error('Callback.existsTag('''')', [BRAPH2.STR ':Callback:' BRAPH2.WRONG_INPUT])
	assert_with_error('varargin{1}.existsTag('''')', [BRAPH2.STR ':Callback:' BRAPH2.WRONG_INPUT], cb)
	assert_with_error('Element.existsTag(varargin{1}, '''')', [BRAPH2.STR ':Callback:' BRAPH2.WRONG_INPUT], cb)
	assert_with_error('Element.existsTag(''Callback'', '''')', [BRAPH2.STR ':Callback:' BRAPH2.WRONG_INPUT])
	 
	for prop = 1:1:Callback.getPropNumber()
		tag = cb.getPropTag(prop);
		assert(Callback.existsTag(tag), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Callback.existsTag(tag) does not work.')
		assert(cb.existsTag(tag), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'cb.existsTag(tag) does not work.')
		assert(Element.existsTag(cb, tag), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.existsTag(cb, tga) does not work.')
		assert(Element.existsTag('Callback', tag), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.existsTag(''Callback'', tag) does not work.')
	end
	 
	% getPropProp(pointer)
	for prop = 1:1:Callback.getPropNumber()
		assert(Callback.getPropProp(prop) == prop, ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Callback.getPropProp(prop) does not work.')
		assert(cb.getPropProp(prop) == prop, ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'cb.getPropProp(prop) does not work.')
		assert(Element.getPropProp(cb, prop) == prop, ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropProp(cb, prop) does not work.')
		assert(Element.getPropProp('Callback', prop) == prop, ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropProp(''Callback'', prop) does not work.')
	 
		tag = cb.getPropTag(prop);
		assert(Callback.getPropProp(tag) == prop, ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Callback.getPropProp(tag) does not work.')
		assert(cb.getPropProp(tag) == prop, ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'cb.getPropProp(tag) does not work.')
		assert(Element.getPropProp(cb, tag) == prop, ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropProp(cb, tag) does not work.')
		assert(Element.getPropProp('Callback', prop) == prop, ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropProp(''Callback'', tag) does not work.')
	end
	 
	% getPropTag(pointer)
	for prop = 1:1:Callback.getPropNumber()
		tag = cb.getPropTag(prop);
	 
		assert(strcmp(Callback.getPropTag(prop), tag), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Callback.getPropTag(prop) does not work.')
		assert(strcmp(cb.getPropTag(prop), tag), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'cb.getPropTag(prop) does not work.')
		assert(strcmp(Element.getPropTag(cb, prop), tag), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropTag(cb, prop) does not work.')
		assert(strcmp(Element.getPropTag('Callback', prop), tag), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropTag(''Callback'', prop) does not work.')
	 
		assert(strcmp(Callback.getPropTag(tag), tag), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Callback.getPropTag(tag) does not work.')
		assert(strcmp(cb.getPropTag(tag), tag), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'cb.getPropTag(tag) does not work.')
		assert(strcmp(Element.getPropTag(cb, tag), tag), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropTag(cb, tag) does not work.')
		assert(strcmp(Element.getPropTag('Callback', prop), tag), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropTag(''Callback'', tag) does not work.')
	end
	 
	% getPropCategory(pointer)
	for prop = 1:1:Callback.getPropNumber()
		tag = cb.getPropTag(prop);
	 
		assert(Category.existsCategory(Callback.getPropCategory(prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Callback.getPropCategory(prop) does not work.')
		assert(Category.existsCategory(cb.getPropCategory(prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'cb.getPropCategory(prop) does not work.')
		assert(Category.existsCategory(Element.getPropCategory(cb, prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropCategory(cb, prop) does not work.')
		assert(Category.existsCategory(Element.getPropCategory(cb, prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropCategory(''Callback'', prop) does not work.')
	 
		assert(Category.existsCategory(Callback.getPropCategory(tag)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Callback.getPropCategory(tag) does not work.')
		assert(Category.existsCategory(cb.getPropCategory(tag)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'cb.getPropCategory(tag) does not work.')
		assert(Category.existsCategory(Element.getPropCategory(cb, tag)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropCategory(cb, tag) does not work.')
		assert(Category.existsCategory(Element.getPropCategory(cb, tag)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropCategory(''Callback'', tag) does not work.')
	end
	 
	% getPropFormat(pointer)
	for prop = 1:1:Callback.getPropNumber()
		tag = cb.getPropTag(prop);
	 
		assert(Format.existsFormat(Callback.getPropFormat(prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Callback.getPropFormat(prop) does not work.')
		assert(Format.existsFormat(cb.getPropFormat(prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'cb.getPropFormat(prop) does not work.')
		assert(Format.existsFormat(Element.getPropFormat(cb, prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropFormat(cb, prop) does not work.')
		assert(Format.existsFormat(Element.getPropFormat(cb, prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropFormat(''Callback'', prop) does not work.')
	 
		assert(Format.existsFormat(Callback.getPropFormat(tag)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Callback.getPropFormat(tag) does not work.')
		assert(Format.existsFormat(cb.getPropFormat(tag)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'cb.getPropFormat(tag) does not work.')
		assert(Format.existsFormat(Element.getPropFormat(cb, tag)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropFormat(cb, tag) does not work.')
		assert(Format.existsFormat(Element.getPropFormat(cb, tag)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropFormat(''Callback'', tag) does not work.')
	end
	 
	% getPropDescription(pointer)
	for prop = 1:1:Callback.getPropNumber()
		tag = cb.getPropTag(prop);
	 
		assert(ischar(Callback.getPropDescription(prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Callback.getPropDescription(prop) does not work.')
		assert(ischar(cb.getPropDescription(prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'cb.getPropDescription(prop) does not work.')
		assert(ischar(Element.getPropDescription(cb, prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropDescription(cb, prop) does not work.')
		assert(ischar(Element.getPropDescription(cb, prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropDescription(''Callback'', prop) does not work.')
	 
		assert(ischar(Callback.getPropDescription(tag)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Callback.getPropDescription(tag) does not work.')
		assert(ischar(cb.getPropDescription(tag)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'cb.getPropDescription(tag) does not work.')
		assert(ischar(Element.getPropDescription(cb, tag)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropDescription(cb, tag) does not work.')
		assert(ischar(Element.getPropDescription(cb, tag)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.getPropDescription(''Callback'', tag) does not work.')
	end
	 
	% getPropSettings(pointer)
	for prop = 1:1:Callback.getPropNumber()
		tag = cb.getPropTag(prop);
	 
		settings = Callback.getPropSettings(prop);
		settings = cb.getPropSettings(prop);
		settings = Element.getPropSettings(cb, prop);
		settings = Element.getPropSettings('Callback', prop);
	 
		settings = Callback.getPropSettings(tag);
		settings = cb.getPropSettings(tag);
		settings = Element.getPropSettings(cb, tag);
		settings = Element.getPropSettings('Callback', tag);
	end
	 
	% getPropDefault(pointer)
	for prop = 1:1:Callback.getPropNumber()
		tag = cb.getPropTag(prop);
	 
		default = Callback.getPropDefault(prop);
		default = cb.getPropDefault(prop);
		default = Element.getPropDefault(cb, prop);
		default = Element.getPropDefault('Callback', prop);
	 
		default = Callback.getPropDefault(tag);
		default = cb.getPropDefault(tag);
		default = Element.getPropDefault(cb, tag);
		default = Element.getPropDefault('Callback', tag);
	end
	 
	% getPropDefaultConditioned(pointer)
	for prop = 1:1:Callback.getPropNumber()
		tag = cb.getPropTag(prop);
	 
		conditioned_default = Callback.getPropDefaultConditioned(prop);
		conditioned_default = cb.getPropDefaultConditioned(prop);
		conditioned_default = Element.getPropDefaultConditioned(cb, prop);
		conditioned_default = Element.getPropDefaultConditioned('Callback', prop);
	 
		conditioned_default = Callback.getPropDefaultConditioned(tag);
		conditioned_default = cb.getPropDefaultConditioned(tag);
		conditioned_default = Element.getPropDefaultConditioned(cb, tag);
		conditioned_default = Element.getPropDefaultConditioned('Callback', tag);
	end
	 
	% checkProp(pointer, value)
	for prop = 1:1:Callback.getPropNumber()
		tag = cb.getPropTag(prop);
	 
		assert(~Callback.checkProp(prop, {'probably wrong value', 1}), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Callback.checkProp(prop, value) does not work.')
		assert(~cb.checkProp(prop, {'probably wrong value', 1}), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'cb.checkProp(prop, value) does not work.')
		assert(~Element.checkProp(cb, prop, {'probably wrong value', 1}), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.checkProp(cb, prop, value) does not work.')
		assert(~Element.checkProp('Callback', prop, {'probably wrong value', 1}), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.checkProp(''Callback'', prop, value) does not work.')
	 
		assert_with_error('Callback.checkProp(varargin{1}, {''probably wrong value'', 1})', [BRAPH2.STR ':Callback:' BRAPH2.WRONG_INPUT], prop)
		assert_with_error('varargin{2}.checkProp(varargin{1}, {''probably wrong value'', 1})', [BRAPH2.STR ':Callback:' BRAPH2.WRONG_INPUT], prop, cb)
		assert_with_error('Element.checkProp(varargin{2}, varargin{1}, {''probably wrong value'', 1})', [BRAPH2.STR ':Callback:' BRAPH2.WRONG_INPUT], prop, cb)
		assert_with_error('Element.checkProp(''Callback'', varargin{1}, {''probably wrong value'', 1})', [BRAPH2.STR ':Callback:' BRAPH2.WRONG_INPUT], prop)
	 
		assert(~Callback.checkProp(tag, {'probably wrong value', 1}), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Callback.checkProp(tag, value) does not work.')
		assert(~cb.checkProp(tag, {'probably wrong value', 1}), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'cb.checkProp(tag, value) does not work.')
		assert(~Element.checkProp(cb, tag, {'probably wrong value', 1}), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.checkProp(cb, tag, value) does not work.')
		assert(~Element.checkProp('Callback', tag, {'probably wrong value', 1}), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.checkProp(''Callback'', tag, value) does not work.')
	 
		assert_with_error('Callback.checkProp(varargin{1}, {''probably wrong value'', 1})', [BRAPH2.STR ':Callback:' BRAPH2.WRONG_INPUT], tag)
		assert_with_error('varargin{2}.checkProp(varargin{1}, {''probably wrong value'', 1})', [BRAPH2.STR ':Callback:' BRAPH2.WRONG_INPUT], tag, cb)
		assert_with_error('Element.checkProp(varargin{2}, varargin{1}, {''probably wrong value'', 1})', [BRAPH2.STR ':Callback:' BRAPH2.WRONG_INPUT], tag, cb)
		assert_with_error('Element.checkProp(''Callback'', varargin{1}, {''probably wrong value'', 1})', [BRAPH2.STR ':Callback:' BRAPH2.WRONG_INPUT], tag)
	 
		assert(Callback.checkProp(prop, Element.getPropDefaultConditioned(Callback, prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Callback.checkProp(prop, <conditioned default value>) does not work.')
		assert(cb.checkProp(prop, Element.getPropDefaultConditioned(Callback, prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'cb.checkProp(prop, <conditioned default value>) does not work.')
		assert(Element.checkProp(cb, prop, Element.getPropDefaultConditioned(Callback, prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.checkProp(cb, prop, <conditioned default value>) does not work.')
		assert(Element.checkProp('Callback', prop, Element.getPropDefaultConditioned(Callback, prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.checkProp(''Callback'', prop, <conditioned default value>) does not work.')
	 
		assert(Callback.checkProp(tag, Element.getPropDefaultConditioned(Callback, prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Callback.checkProp(tag, <conditioned default value>) does not work.')
		assert(cb.checkProp(tag, Element.getPropDefaultConditioned(Callback, prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'cb.checkProp(tag, <conditioned default value>) does not work.')
		assert(Element.checkProp(cb, tag, Element.getPropDefaultConditioned(Callback, prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.checkProp(cb, tag, <conditioned default value>) does not work.')
		assert(Element.checkProp('Callback', tag, Element.getPropDefaultConditioned(Callback, prop)), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			'Element.checkProp(''Callback'', tag, <conditioned default value>) does not work.')
	 
	end
	 
end

%% Test 2: Instantiation - defaults
if rand() >= (1 - .01) * BRAPH2TEST.RANDOM
	% this test is not implemented for Callback and NoValue
end

%% Test 3: Memorize
if rand() >= (1 - .01) * BRAPH2TEST.RANDOM
	% this test is not implemented for Callback and NoValue
end

%% Test 4: Lock 1
if rand() >= (1 - .01) * BRAPH2TEST.RANDOM
	cb = Callback();
	 
	for prop = 1:1:Callback.getPropNumber()
		TAG = upper(Callback.getPropTag(prop));
		assert( ...
			~cb.isLocked(prop), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			['Callback.isLocked(' int2str(prop) ') must NOT be locked when it is instantiated.'] ...
			)
		assert( ...
			~cb.isLocked(TAG), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			['Callback.isLocked(' TAG ') must NOT be locked when it is instantiated.'] ...
			)
	end
	 
	cb.lock()
	 
	for prop = 1:1:Callback.getPropNumber()
		switch Callback.getPropCategory(prop)
			case {Category.PARAMETER, Category.DATA}
				assert( ...
					cb.isLocked(prop), ...
					[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
					['Callback.isLocked(' int2str(prop) ') must be locked because the element is now locked.'] ...
					)
			case {Category.CONSTANT, Category.METADATA, Category.RESULT, Category.QUERY, Category.EVANESCENT, Category.FIGURE, Category.GUI}
				assert( ...
					~cb.isLocked(prop), ...
					[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
					['Callback.isLocked(' int2str(prop) ') must NOT be locked even though the element is now locked.'] ...
					)
		end
	end
end

%% Test 5: Lock 2
if rand() >= (1 - .01) * BRAPH2TEST.RANDOM
	cb = Callback();
	 
	warning_backup = warning('off', 'BRAPH2:Callback');
	for prop = 1:1:Callback.getPropNumber()
		cb.lock(prop)
		switch Callback.getPropCategory(prop)
			case {Category.PARAMETER, Category.DATA, Category.FIGURE, Category.GUI}
				assert( ...
					cb.isLocked(prop), ...
					[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
					['Callback.isLocked(' int2str(prop) ') must be locked.'] ...
					)
			case {Category.CONSTANT, Category.METADATA, Category.RESULT, Category.QUERY, Category.EVANESCENT}
				assert( ...
					~cb.isLocked(prop), ...
					[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
					['Callback.isLocked(' int2str(prop) ') must NOT be locked even though locking has been attempted.'] ...
					)
		end
	end
	warning(warning_backup)
end

%% Test 6: Check
if rand() >= (1 - .01) * BRAPH2TEST.RANDOM
	cb = Callback();
	 
	for prop = 1:1:Callback.getPropNumber()
		TAG = upper(Callback.getPropTag(prop));
		assert( ...
			cb.isChecked(prop), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			['Callback.isChecked(' int2str(prop) ') must be checked when it is instantiated.'] ...
			)
		assert( ...
			cb.isChecked(TAG), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			['Callback.isChecked(' TAG ') must be checked when it is instantiated.'] ...
			)
	end
	 
	cb.unchecked()
	 
	for prop = 1:1:Callback.getPropNumber()
		assert( ...
			~cb.isChecked(prop), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			['Callback.isChecked(' int2str(prop) ') must NOT be checked because it has been set to unchecked.'] ...
			)
	end
	 
	cb.checked()
	 
	for prop = 1:1:Callback.getPropNumber()
		assert( ...
			cb.isChecked(prop), ...
			[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
			['Callback.isChecked(' int2str(prop) ') must be checked because it has been set to checked.'] ...
			)
	end
end

%% Test 7: Callbacks
if rand() >= (1 - .01) * BRAPH2TEST.RANDOM
	% this test is not implemented for Callback and NoValue
end

%% Test 8: Copy
if rand() >= (1 - .01) * BRAPH2TEST.RANDOM
	% this test is not implemented for Callback and NoValue
end

%% Test 9: Template
if rand() >= (1 - .01) * BRAPH2TEST.RANDOM
	% this test is not implemented for Callback and NoValue
end

%% Test 10: Save Load
if rand() >= (1 - .01) * BRAPH2TEST.RANDOM
	% this test is not implemented for Callback and NoValue
end

%% Test 11: JSON
if rand() >= (1 - .01) * BRAPH2TEST.RANDOM
	% this test is not implemented for Callback and NoValue
end

%% Test 12: No Figures Left
if rand() >= (1 - 1) * BRAPH2TEST.RANDOM
	assert(isempty(findall(0, 'type', 'figure')), ...
		[BRAPH2.STR ':Callback:' BRAPH2.FAIL_TEST], ...
		[' When testing Callback no figures should be left over, either visible or not. ' ...
		int2str(length(findall(0, 'type', 'figure'))) ' figure(s) were left over.'] ...
		)
end

%% Test 13: Delete Figures
if rand() >= (1 - 1) * BRAPH2TEST.RANDOM
	delete(findall(0, 'type', 'figure'))
end

