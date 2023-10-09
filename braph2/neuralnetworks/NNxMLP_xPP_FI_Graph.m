classdef NNxMLP_xPP_FI_Graph < PanelProp
	%NNxMLP_xPP_FI_Graph plots the panel of a prop cell.
	% It is a subclass of <a href="matlab:help PanelProp">PanelProp</a>.
	%
	% A Cell Prop Panel (NNxMLP_xPP_FI_Graph) plots the panel for a CELL prop with a table and two sliders.
	% It works for all categories.
	% 
	% It can be personalized with the following props:
	%  TABLE_HEIGHT - Panel height in pixels when the table is shown.
	%  XSLIDERSHOW - Whether to show the x-slider.
	%  XSLIDERLABELS - Labels for the x-slider.
	%  XSLIDERHEIGHT - Height of x-slider in pixels.
	%  YSLIDERSHOW - Whether to show the y-slider.
	%  YSLIDERLABELS - Labels for the y-slider.
	%  YSLIDERWIDTH - Width of y-slider in pixels.
	%  XYSLIDERLOCK - Whether the sliders are locked so that only the diagonal is shown.
	%  ROWNAME - String list with row names (no names if empty; numbered if {'numbered'}). Dynamically updatable.
	%  COLUMNAME - String list with column names (no names if empty; numbered if {'numbered'}). Dynamically updatable.
	%  MENU_EXPORT - Whether to show the export menu. To be defined before drawing.
	%
	% The list of NNxMLP_xPP_FI_Graph properties is:
	%  <strong>1</strong> <strong>ELCLASS</strong> 	ELCLASS (constant, string) is the  % % % .
	%  <strong>2</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the cell prop panel.
	%  <strong>3</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the cell prop panel.
	%  <strong>4</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the cell prop panel.
	%  <strong>5</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the cell prop panel.
	%  <strong>6</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the cell prop panel.
	%  <strong>7</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the cell prop panel.
	%  <strong>8</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the object.
	%  <strong>9</strong> <strong>WAITBAR</strong> 	WAITBAR (gui, logical) detemines whether to show the waitbar.
	%  <strong>10</strong> <strong>H_WAITBAR</strong> 	H_WAITBAR (evanescent, handle) is the waitbar handle.
	%  <strong>11</strong> <strong>DRAW</strong> 	DRAW (query, logical) draws the prop panel.
	%  <strong>12</strong> <strong>DRAWN</strong> 	DRAWN (query, logical) returns whether the panel has been drawn.
	%  <strong>13</strong> <strong>PARENT</strong> 	PARENT (gui, item) is the panel parent.
	%  <strong>14</strong> <strong>BKGCOLOR</strong> 	BKGCOLOR (figure, color) is the panel background color.
	%  <strong>15</strong> <strong>H</strong> 	H (evanescent, handle) is the panel handle.
	%  <strong>16</strong> <strong>SHOW</strong> 	SHOW (query, logical) shows the figure containing the panel and, possibly, the callback figure.
	%  <strong>17</strong> <strong>HIDE</strong> 	HIDE (query, logical) hides the figure containing the panel and, possibly, the callback figure.
	%  <strong>18</strong> <strong>DELETE</strong> 	DELETE (query, logical) resets the handles when the panel is deleted.
	%  <strong>19</strong> <strong>CLOSE</strong> 	CLOSE (query, logical) closes the figure containing the panel and, possibly, the callback figure.
	%  <strong>20</strong> <strong>X_DRAW</strong> 	X_DRAW (query, logical) draws the prop panel.
	%  <strong>21</strong> <strong>UPDATE</strong> 	UPDATE (query, logical) updates the content and permissions of the table.
	%  <strong>22</strong> <strong>REDRAW</strong> 	REDRAW (query, logical) resizes the prop panel and repositions its graphical objects.
	%  <strong>23</strong> <strong>EL</strong> 	EL (data, item) is the element.
	%  <strong>24</strong> <strong>PROP</strong> 	PROP (data, scalar) is the prop number.
	%  <strong>25</strong> <strong>HEIGHT</strong> 	HEIGHT (gui, size) is the pixel height of the prop panel.
	%  <strong>26</strong> <strong>TITLE</strong> 	TITLE (gui, string) is the property title.
	%  <strong>27</strong> <strong>LABEL_TITLE</strong> 	LABEL_TITLE (evanescent, handle) is the handle for the title uilabel.
	%  <strong>28</strong> <strong>BUTTON_CB</strong> 	BUTTON_CB (evanescent, handle) is the handle for the callback button [only for PARAMETER, DATA, FIGURE and GUI].
	%  <strong>29</strong> <strong>GUI_CB</strong> 	GUI_CB (data, item) is the handle to the item figure.
	%  <strong>30</strong> <strong>LISTENER_CB</strong> 	LISTENER_CB (evanescent, handle) contains the listener to the updates in the property callback.
	%  <strong>31</strong> <strong>BUTTON_CALC</strong> 	BUTTON_CALC (evanescent, handle) is the handle for the calculate button [only for RESULT, QUERY and EVANESCENT].
	%  <strong>32</strong> <strong>BUTTON_DEL</strong> 	BUTTON_DEL (evanescent, handle) is the handle for the delete button [only for RESULT, QUERY and EVANESCENT].
	%  <strong>33</strong> <strong>LISTENER_SET</strong> 	LISTENER_SET (evanescent, handlelist) contains the listeners to the PropSet events.
	%  <strong>34</strong> <strong>LISTENER_MEMORIZED</strong> 	LISTENER_MEMORIZED (evanescent, handlelist) contains the listeners to the PropMemorized events.
	%  <strong>35</strong> <strong>LISTENER_LOCKED</strong> 	LISTENER_LOCKED (evanescent, handlelist) contains the listeners to the PropLocked events.
	%  <strong>36</strong> <strong>D</strong> 	D (metadata, item) is the input dataset.
	%  <strong>37</strong> <strong>XSLIDERSHOW</strong> 	XSLIDERSHOW (gui, logical) determines whether to show the xslider.
	%  <strong>38</strong> <strong>XSLIDERLABELS</strong> 	XSLIDERLABELS (gui, stringlist) determines the xslider labels.
	%  <strong>39</strong> <strong>XSLIDERHEIGHT</strong> 	XSLIDERHEIGHT (gui, size) is the height below the xslider in font size units.
	%  <strong>40</strong> <strong>XSLIDER</strong> 	XSLIDER (evanescent, handle) is the x-slider.
	%  <strong>41</strong> <strong>YSLIDERSHOW</strong> 	YSLIDERSHOW (gui, logical) determines whether to show the yslider.
	%  <strong>42</strong> <strong>YSLIDERLABELS</strong> 	YSLIDERLABELS (gui, stringlist) determines the yslider labels.
	%  <strong>43</strong> <strong>YSLIDERWIDTH</strong> 	YSLIDERWIDTH (gui, size) is the width to the right of the yslider in font size units.
	%  <strong>44</strong> <strong>YSLIDER</strong> 	YSLIDER (evanescent, handle) is the y-slider.
	%  <strong>45</strong> <strong>XYSLIDERLOCK</strong> 	XYSLIDERLOCK (gui, logical) determines whether the sliders are locked so that only the diagonal is shown.
	%  <strong>46</strong> <strong>ENABLE</strong> 	ENABLE (gui, option) switches table between on and off.
	%  <strong>47</strong> <strong>ROWNAME</strong> 	ROWNAME (gui, stringlist) determines the table row names.
	%  <strong>48</strong> <strong>COLUMNNAME</strong> 	COLUMNNAME (gui, stringlist) determines the table column names.
	%  <strong>49</strong> <strong>MENU_EXPORT</strong> 	MENU_EXPORT (gui, logical) determines whether to show the context menu to export data.
	%  <strong>50</strong> <strong>TABLE_HEIGHT</strong> 	TABLE_HEIGHT (gui, size) is the pixel height of the prop panel when the table is shown.
	%  <strong>51</strong> <strong>TABLE</strong> 	TABLE (evanescent, handle) is the alpha value edit field.
	%  <strong>52</strong> <strong>CONTEXTMENU</strong> 	CONTEXTMENU (evanescent, handle) is the context menu.
	%  <strong>53</strong> <strong>MAP_TO_CELL</strong> 	MAP_TO_CELL (query, empty) maps a single vector back to the original cell array structure.
	%
	% NNxMLP_xPP_FI_Graph methods (constructor):
	%  NNxMLP_xPP_FI_Graph - constructor
	%
	% NNxMLP_xPP_FI_Graph methods:
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
	% NNxMLP_xPP_FI_Graph methods (display):
	%  tostring - string with information about the cell prop panel
	%  disp - displays information about the cell prop panel
	%  tree - displays the tree of the cell prop panel
	%
	% NNxMLP_xPP_FI_Graph methods (miscellanea):
	%  getNoValue - returns a pointer to a persistent instance of NoValue
	%               Use it as Element.getNoValue()
	%  getCallback - returns the callback to a property
	%  isequal - determines whether two cell prop panel are equal (values, locked)
	%  getElementList - returns a list with all subelements
	%  copy - copies the cell prop panel
	%
	% NNxMLP_xPP_FI_Graph methods (save/load, Static):
	%  save - saves BRAPH2 cell prop panel as b2 file
	%  load - loads a BRAPH2 cell prop panel from a b2 file
	%
	% NNxMLP_xPP_FI_Graph method (JSON encode):
	%  encodeJSON - returns a JSON string encoding the cell prop panel
	%
	% NNxMLP_xPP_FI_Graph method (JSON decode, Static):
	%   decodeJSON - returns a JSON string encoding the cell prop panel
	%
	% NNxMLP_xPP_FI_Graph methods (inspection, Static):
	%  getClass - returns the class of the cell prop panel
	%  getSubclasses - returns all subclasses of NNxMLP_xPP_FI_Graph
	%  getProps - returns the property list of the cell prop panel
	%  getPropNumber - returns the property number of the cell prop panel
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
	% NNxMLP_xPP_FI_Graph methods (GUI):
	%  getPanelProp - returns a prop panel
	%
	% NNxMLP_xPP_FI_Graph methods (GUI, Static):
	%  getGUIMenuImport - returns the importer menu
	%  getGUIMenuExport - returns the exporter menu
	%
	% NNxMLP_xPP_FI_Graph methods (category, Static):
	%  getCategories - returns the list of categories
	%  getCategoryNumber - returns the number of categories
	%  existsCategory - returns whether a category exists/error
	%  getCategoryTag - returns the tag of a category
	%  getCategoryName - returns the name of a category
	%  getCategoryDescription - returns the description of a category
	%
	% NNxMLP_xPP_FI_Graph methods (format, Static):
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
	% To print full list of constants, click here <a href="matlab:metaclass = ?NNxMLP_xPP_FI_Graph; properties = metaclass.PropertyList;for i = 1:1:length(properties), if properties(i).Constant, disp([properties(i).Name newline() tostring(properties(i).DefaultValue) newline()]), end, end">NNxMLP_xPP_FI_Graph constants</a>.
	%
	%
	% See also uitable, uislider, GUI, PanelElement.
	
	properties (Constant) % properties
		D = 36; %CET: Computational Efficiency Trick
		D_TAG = 'D';
		D_CATEGORY = 2;
		D_FORMAT = 8;
		
		XSLIDERSHOW = 37; %CET: Computational Efficiency Trick
		XSLIDERSHOW_TAG = 'XSLIDERSHOW';
		XSLIDERSHOW_CATEGORY = 9;
		XSLIDERSHOW_FORMAT = 4;
		
		XSLIDERLABELS = 38; %CET: Computational Efficiency Trick
		XSLIDERLABELS_TAG = 'XSLIDERLABELS';
		XSLIDERLABELS_CATEGORY = 9;
		XSLIDERLABELS_FORMAT = 3;
		
		XSLIDERHEIGHT = 39; %CET: Computational Efficiency Trick
		XSLIDERHEIGHT_TAG = 'XSLIDERHEIGHT';
		XSLIDERHEIGHT_CATEGORY = 9;
		XSLIDERHEIGHT_FORMAT = 22;
		
		XSLIDER = 40; %CET: Computational Efficiency Trick
		XSLIDER_TAG = 'XSLIDER';
		XSLIDER_CATEGORY = 7;
		XSLIDER_FORMAT = 18;
		
		YSLIDERSHOW = 41; %CET: Computational Efficiency Trick
		YSLIDERSHOW_TAG = 'YSLIDERSHOW';
		YSLIDERSHOW_CATEGORY = 9;
		YSLIDERSHOW_FORMAT = 4;
		
		YSLIDERLABELS = 42; %CET: Computational Efficiency Trick
		YSLIDERLABELS_TAG = 'YSLIDERLABELS';
		YSLIDERLABELS_CATEGORY = 9;
		YSLIDERLABELS_FORMAT = 3;
		
		YSLIDERWIDTH = 43; %CET: Computational Efficiency Trick
		YSLIDERWIDTH_TAG = 'YSLIDERWIDTH';
		YSLIDERWIDTH_CATEGORY = 9;
		YSLIDERWIDTH_FORMAT = 22;
		
		YSLIDER = 44; %CET: Computational Efficiency Trick
		YSLIDER_TAG = 'YSLIDER';
		YSLIDER_CATEGORY = 7;
		YSLIDER_FORMAT = 18;
		
		XYSLIDERLOCK = 45; %CET: Computational Efficiency Trick
		XYSLIDERLOCK_TAG = 'XYSLIDERLOCK';
		XYSLIDERLOCK_CATEGORY = 9;
		XYSLIDERLOCK_FORMAT = 4;
		
		ENABLE = 46; %CET: Computational Efficiency Trick
		ENABLE_TAG = 'ENABLE';
		ENABLE_CATEGORY = 9;
		ENABLE_FORMAT = 5;
		
		ROWNAME = 47; %CET: Computational Efficiency Trick
		ROWNAME_TAG = 'ROWNAME';
		ROWNAME_CATEGORY = 9;
		ROWNAME_FORMAT = 3;
		
		COLUMNNAME = 48; %CET: Computational Efficiency Trick
		COLUMNNAME_TAG = 'COLUMNNAME';
		COLUMNNAME_CATEGORY = 9;
		COLUMNNAME_FORMAT = 3;
		
		MENU_EXPORT = 49; %CET: Computational Efficiency Trick
		MENU_EXPORT_TAG = 'MENU_EXPORT';
		MENU_EXPORT_CATEGORY = 9;
		MENU_EXPORT_FORMAT = 4;
		
		TABLE_HEIGHT = 50; %CET: Computational Efficiency Trick
		TABLE_HEIGHT_TAG = 'TABLE_HEIGHT';
		TABLE_HEIGHT_CATEGORY = 9;
		TABLE_HEIGHT_FORMAT = 22;
		
		TABLE = 51; %CET: Computational Efficiency Trick
		TABLE_TAG = 'TABLE';
		TABLE_CATEGORY = 7;
		TABLE_FORMAT = 18;
		
		CONTEXTMENU = 52; %CET: Computational Efficiency Trick
		CONTEXTMENU_TAG = 'CONTEXTMENU';
		CONTEXTMENU_CATEGORY = 7;
		CONTEXTMENU_FORMAT = 18;
		
		MAP_TO_CELL = 53; %CET: Computational Efficiency Trick
		MAP_TO_CELL_TAG = 'MAP_TO_CELL';
		MAP_TO_CELL_CATEGORY = 6;
		MAP_TO_CELL_FORMAT = 1;
	end
	methods % constructor
		function pr = NNxMLP_xPP_FI_Graph(varargin)
			%NNxMLP_xPP_FI_Graph() creates a cell prop panel.
			%
			% NNxMLP_xPP_FI_Graph(PROP, VALUE, ...) with property PROP initialized to VALUE.
			%
			% NNxMLP_xPP_FI_Graph(TAG, VALUE, ...) with property TAG set to VALUE.
			%
			% Multiple properties can be initialized at once identifying
			%  them with either property numbers (PROP) or tags (TAG).
			%
			% The list of NNxMLP_xPP_FI_Graph properties is:
			%  <strong>1</strong> <strong>ELCLASS</strong> 	ELCLASS (constant, string) is the  % % % .
			%  <strong>2</strong> <strong>NAME</strong> 	NAME (constant, string) is the name of the cell prop panel.
			%  <strong>3</strong> <strong>DESCRIPTION</strong> 	DESCRIPTION (constant, string) is the description of the cell prop panel.
			%  <strong>4</strong> <strong>TEMPLATE</strong> 	TEMPLATE (parameter, item) is the template of the cell prop panel.
			%  <strong>5</strong> <strong>ID</strong> 	ID (data, string) is a few-letter code for the cell prop panel.
			%  <strong>6</strong> <strong>LABEL</strong> 	LABEL (metadata, string) is an extended label of the cell prop panel.
			%  <strong>7</strong> <strong>NOTES</strong> 	NOTES (metadata, string) are some specific notes about the cell prop panel.
			%  <strong>8</strong> <strong>TOSTRING</strong> 	TOSTRING (query, string) returns a string that represents the object.
			%  <strong>9</strong> <strong>WAITBAR</strong> 	WAITBAR (gui, logical) detemines whether to show the waitbar.
			%  <strong>10</strong> <strong>H_WAITBAR</strong> 	H_WAITBAR (evanescent, handle) is the waitbar handle.
			%  <strong>11</strong> <strong>DRAW</strong> 	DRAW (query, logical) draws the prop panel.
			%  <strong>12</strong> <strong>DRAWN</strong> 	DRAWN (query, logical) returns whether the panel has been drawn.
			%  <strong>13</strong> <strong>PARENT</strong> 	PARENT (gui, item) is the panel parent.
			%  <strong>14</strong> <strong>BKGCOLOR</strong> 	BKGCOLOR (figure, color) is the panel background color.
			%  <strong>15</strong> <strong>H</strong> 	H (evanescent, handle) is the panel handle.
			%  <strong>16</strong> <strong>SHOW</strong> 	SHOW (query, logical) shows the figure containing the panel and, possibly, the callback figure.
			%  <strong>17</strong> <strong>HIDE</strong> 	HIDE (query, logical) hides the figure containing the panel and, possibly, the callback figure.
			%  <strong>18</strong> <strong>DELETE</strong> 	DELETE (query, logical) resets the handles when the panel is deleted.
			%  <strong>19</strong> <strong>CLOSE</strong> 	CLOSE (query, logical) closes the figure containing the panel and, possibly, the callback figure.
			%  <strong>20</strong> <strong>X_DRAW</strong> 	X_DRAW (query, logical) draws the prop panel.
			%  <strong>21</strong> <strong>UPDATE</strong> 	UPDATE (query, logical) updates the content and permissions of the table.
			%  <strong>22</strong> <strong>REDRAW</strong> 	REDRAW (query, logical) resizes the prop panel and repositions its graphical objects.
			%  <strong>23</strong> <strong>EL</strong> 	EL (data, item) is the element.
			%  <strong>24</strong> <strong>PROP</strong> 	PROP (data, scalar) is the prop number.
			%  <strong>25</strong> <strong>HEIGHT</strong> 	HEIGHT (gui, size) is the pixel height of the prop panel.
			%  <strong>26</strong> <strong>TITLE</strong> 	TITLE (gui, string) is the property title.
			%  <strong>27</strong> <strong>LABEL_TITLE</strong> 	LABEL_TITLE (evanescent, handle) is the handle for the title uilabel.
			%  <strong>28</strong> <strong>BUTTON_CB</strong> 	BUTTON_CB (evanescent, handle) is the handle for the callback button [only for PARAMETER, DATA, FIGURE and GUI].
			%  <strong>29</strong> <strong>GUI_CB</strong> 	GUI_CB (data, item) is the handle to the item figure.
			%  <strong>30</strong> <strong>LISTENER_CB</strong> 	LISTENER_CB (evanescent, handle) contains the listener to the updates in the property callback.
			%  <strong>31</strong> <strong>BUTTON_CALC</strong> 	BUTTON_CALC (evanescent, handle) is the handle for the calculate button [only for RESULT, QUERY and EVANESCENT].
			%  <strong>32</strong> <strong>BUTTON_DEL</strong> 	BUTTON_DEL (evanescent, handle) is the handle for the delete button [only for RESULT, QUERY and EVANESCENT].
			%  <strong>33</strong> <strong>LISTENER_SET</strong> 	LISTENER_SET (evanescent, handlelist) contains the listeners to the PropSet events.
			%  <strong>34</strong> <strong>LISTENER_MEMORIZED</strong> 	LISTENER_MEMORIZED (evanescent, handlelist) contains the listeners to the PropMemorized events.
			%  <strong>35</strong> <strong>LISTENER_LOCKED</strong> 	LISTENER_LOCKED (evanescent, handlelist) contains the listeners to the PropLocked events.
			%  <strong>36</strong> <strong>D</strong> 	D (metadata, item) is the input dataset.
			%  <strong>37</strong> <strong>XSLIDERSHOW</strong> 	XSLIDERSHOW (gui, logical) determines whether to show the xslider.
			%  <strong>38</strong> <strong>XSLIDERLABELS</strong> 	XSLIDERLABELS (gui, stringlist) determines the xslider labels.
			%  <strong>39</strong> <strong>XSLIDERHEIGHT</strong> 	XSLIDERHEIGHT (gui, size) is the height below the xslider in font size units.
			%  <strong>40</strong> <strong>XSLIDER</strong> 	XSLIDER (evanescent, handle) is the x-slider.
			%  <strong>41</strong> <strong>YSLIDERSHOW</strong> 	YSLIDERSHOW (gui, logical) determines whether to show the yslider.
			%  <strong>42</strong> <strong>YSLIDERLABELS</strong> 	YSLIDERLABELS (gui, stringlist) determines the yslider labels.
			%  <strong>43</strong> <strong>YSLIDERWIDTH</strong> 	YSLIDERWIDTH (gui, size) is the width to the right of the yslider in font size units.
			%  <strong>44</strong> <strong>YSLIDER</strong> 	YSLIDER (evanescent, handle) is the y-slider.
			%  <strong>45</strong> <strong>XYSLIDERLOCK</strong> 	XYSLIDERLOCK (gui, logical) determines whether the sliders are locked so that only the diagonal is shown.
			%  <strong>46</strong> <strong>ENABLE</strong> 	ENABLE (gui, option) switches table between on and off.
			%  <strong>47</strong> <strong>ROWNAME</strong> 	ROWNAME (gui, stringlist) determines the table row names.
			%  <strong>48</strong> <strong>COLUMNNAME</strong> 	COLUMNNAME (gui, stringlist) determines the table column names.
			%  <strong>49</strong> <strong>MENU_EXPORT</strong> 	MENU_EXPORT (gui, logical) determines whether to show the context menu to export data.
			%  <strong>50</strong> <strong>TABLE_HEIGHT</strong> 	TABLE_HEIGHT (gui, size) is the pixel height of the prop panel when the table is shown.
			%  <strong>51</strong> <strong>TABLE</strong> 	TABLE (evanescent, handle) is the alpha value edit field.
			%  <strong>52</strong> <strong>CONTEXTMENU</strong> 	CONTEXTMENU (evanescent, handle) is the context menu.
			%  <strong>53</strong> <strong>MAP_TO_CELL</strong> 	MAP_TO_CELL (query, empty) maps a single vector back to the original cell array structure.
			%
			% See also Category, Format.
			
			pr = pr@PanelProp(varargin{:});
		end
	end
	methods (Static) % inspection
		function pr_class = getClass()
			%GETCLASS returns the class of the cell prop panel.
			%
			% CLASS = NNxMLP_xPP_FI_Graph.GETCLASS() returns the class 'NNxMLP_xPP_FI_Graph'.
			%
			% Alternative forms to call this method are:
			%  CLASS = PR.GETCLASS() returns the class of the cell prop panel PR.
			%  CLASS = Element.GETCLASS(PR) returns the class of 'PR'.
			%  CLASS = Element.GETCLASS('NNxMLP_xPP_FI_Graph') returns 'NNxMLP_xPP_FI_Graph'.
			%
			% Note that the Element.GETCLASS(PR) and Element.GETCLASS('NNxMLP_xPP_FI_Graph')
			%  are less computationally efficient.
			
			pr_class = 'NNxMLP_xPP_FI_Graph';
		end
		function subclass_list = getSubclasses()
			%GETSUBCLASSES returns all subclasses of the cell prop panel.
			%
			% LIST = NNxMLP_xPP_FI_Graph.GETSUBCLASSES() returns all subclasses of 'NNxMLP_xPP_FI_Graph'.
			%
			% Alternative forms to call this method are:
			%  LIST = PR.GETSUBCLASSES() returns all subclasses of the cell prop panel PR.
			%  LIST = Element.GETSUBCLASSES(PR) returns all subclasses of 'PR'.
			%  LIST = Element.GETSUBCLASSES('NNxMLP_xPP_FI_Graph') returns all subclasses of 'NNxMLP_xPP_FI_Graph'.
			%
			% Note that the Element.GETSUBCLASSES(PR) and Element.GETSUBCLASSES('NNxMLP_xPP_FI_Graph')
			%  are less computationally efficient.
			%
			% See also subclasses.
			
			subclass_list = { 'NNxMLP_xPP_FI_Graph' }; %CET: Computational Efficiency Trick
		end
		function prop_list = getProps(category)
			%GETPROPS returns the property list of cell prop panel.
			%
			% PROPS = NNxMLP_xPP_FI_Graph.GETPROPS() returns the property list of cell prop panel
			%  as a row vector.
			%
			% PROPS = NNxMLP_xPP_FI_Graph.GETPROPS(CATEGORY) returns the property list 
			%  of category CATEGORY.
			%
			% Alternative forms to call this method are:
			%  PROPS = PR.GETPROPS([CATEGORY]) returns the property list of the cell prop panel PR.
			%  PROPS = Element.GETPROPS(PR[, CATEGORY]) returns the property list of 'PR'.
			%  PROPS = Element.GETPROPS('NNxMLP_xPP_FI_Graph'[, CATEGORY]) returns the property list of 'NNxMLP_xPP_FI_Graph'.
			%
			% Note that the Element.GETPROPS(PR) and Element.GETPROPS('NNxMLP_xPP_FI_Graph')
			%  are less computationally efficient.
			%
			% See also getPropNumber, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_list = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53];
				return
			end
			
			switch category
				case 1 % Category.CONSTANT
					prop_list = [1 2 3];
				case 2 % Category.METADATA
					prop_list = [6 7 36];
				case 3 % Category.PARAMETER
					prop_list = 4;
				case 4 % Category.DATA
					prop_list = [5 23 24 29];
				case 6 % Category.QUERY
					prop_list = [8 11 12 16 17 18 19 20 21 22 53];
				case 7 % Category.EVANESCENT
					prop_list = [10 15 27 28 30 31 32 33 34 35 40 44 51 52];
				case 8 % Category.FIGURE
					prop_list = 14;
				case 9 % Category.GUI
					prop_list = [9 13 25 26 37 38 39 41 42 43 45 46 47 48 49 50];
				otherwise
					prop_list = [];
			end
		end
		function prop_number = getPropNumber(varargin)
			%GETPROPNUMBER returns the property number of cell prop panel.
			%
			% N = NNxMLP_xPP_FI_Graph.GETPROPNUMBER() returns the property number of cell prop panel.
			%
			% N = NNxMLP_xPP_FI_Graph.GETPROPNUMBER(CATEGORY) returns the property number of cell prop panel
			%  of category CATEGORY
			%
			% Alternative forms to call this method are:
			%  N = PR.GETPROPNUMBER([CATEGORY]) returns the property number of the cell prop panel PR.
			%  N = Element.GETPROPNUMBER(PR) returns the property number of 'PR'.
			%  N = Element.GETPROPNUMBER('NNxMLP_xPP_FI_Graph') returns the property number of 'NNxMLP_xPP_FI_Graph'.
			%
			% Note that the Element.GETPROPNUMBER(PR) and Element.GETPROPNUMBER('NNxMLP_xPP_FI_Graph')
			%  are less computationally efficient.
			%
			% See also getProps, Category.
			
			%CET: Computational Efficiency Trick
			
			if nargin == 0
				prop_number = 53;
				return
			end
			
			switch varargin{1} % category = varargin{1}
				case 1 % Category.CONSTANT
					prop_number = 3;
				case 2 % Category.METADATA
					prop_number = 3;
				case 3 % Category.PARAMETER
					prop_number = 1;
				case 4 % Category.DATA
					prop_number = 4;
				case 6 % Category.QUERY
					prop_number = 11;
				case 7 % Category.EVANESCENT
					prop_number = 14;
				case 8 % Category.FIGURE
					prop_number = 1;
				case 9 % Category.GUI
					prop_number = 16;
				otherwise
					prop_number = 0;
			end
		end
		function check_out = existsProp(prop)
			%EXISTSPROP checks whether property exists in cell prop panel/error.
			%
			% CHECK = NNxMLP_xPP_FI_Graph.EXISTSPROP(PROP) checks whether the property PROP exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PR.EXISTSPROP(PROP) checks whether PROP exists for PR.
			%  CHECK = Element.EXISTSPROP(PR, PROP) checks whether PROP exists for PR.
			%  CHECK = Element.EXISTSPROP(NNxMLP_xPP_FI_Graph, PROP) checks whether PROP exists for NNxMLP_xPP_FI_Graph.
			%
			% Element.EXISTSPROP(PROP) throws an error if the PROP does NOT exist.
			%  Error id: [BRAPH2:NNxMLP_xPP_FI_Graph:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PR.EXISTSPROP(PROP) throws error if PROP does NOT exist for PR.
			%   Error id: [BRAPH2:NNxMLP_xPP_FI_Graph:WrongInput]
			%  Element.EXISTSPROP(PR, PROP) throws error if PROP does NOT exist for PR.
			%   Error id: [BRAPH2:NNxMLP_xPP_FI_Graph:WrongInput]
			%  Element.EXISTSPROP(NNxMLP_xPP_FI_Graph, PROP) throws error if PROP does NOT exist for NNxMLP_xPP_FI_Graph.
			%   Error id: [BRAPH2:NNxMLP_xPP_FI_Graph:WrongInput]
			%
			% Note that the Element.EXISTSPROP(PR) and Element.EXISTSPROP('NNxMLP_xPP_FI_Graph')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = prop >= 1 && prop <= 53 && round(prop) == prop; %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':NNxMLP_xPP_FI_Graph:' 'WrongInput'], ...
					['BRAPH2' ':NNxMLP_xPP_FI_Graph:' 'WrongInput' '\n' ...
					'The value ' tostring(prop, 100, ' ...') ' is not a valid prop for NNxMLP_xPP_FI_Graph.'] ...
					)
			end
		end
		function check_out = existsTag(tag)
			%EXISTSTAG checks whether tag exists in cell prop panel/error.
			%
			% CHECK = NNxMLP_xPP_FI_Graph.EXISTSTAG(TAG) checks whether a property with tag TAG exists.
			%
			% Alternative forms to call this method are:
			%  CHECK = PR.EXISTSTAG(TAG) checks whether TAG exists for PR.
			%  CHECK = Element.EXISTSTAG(PR, TAG) checks whether TAG exists for PR.
			%  CHECK = Element.EXISTSTAG(NNxMLP_xPP_FI_Graph, TAG) checks whether TAG exists for NNxMLP_xPP_FI_Graph.
			%
			% Element.EXISTSTAG(TAG) throws an error if the TAG does NOT exist.
			%  Error id: [BRAPH2:NNxMLP_xPP_FI_Graph:WrongInput]
			%
			% Alternative forms to call this method are:
			%  PR.EXISTSTAG(TAG) throws error if TAG does NOT exist for PR.
			%   Error id: [BRAPH2:NNxMLP_xPP_FI_Graph:WrongInput]
			%  Element.EXISTSTAG(PR, TAG) throws error if TAG does NOT exist for PR.
			%   Error id: [BRAPH2:NNxMLP_xPP_FI_Graph:WrongInput]
			%  Element.EXISTSTAG(NNxMLP_xPP_FI_Graph, TAG) throws error if TAG does NOT exist for NNxMLP_xPP_FI_Graph.
			%   Error id: [BRAPH2:NNxMLP_xPP_FI_Graph:WrongInput]
			%
			% Note that the Element.EXISTSTAG(PR) and Element.EXISTSTAG('NNxMLP_xPP_FI_Graph')
			%  are less computationally efficient.
			%
			% See also getProps, existsTag.
			
			check = any(strcmp(tag, { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'X_DRAW'  'UPDATE'  'REDRAW'  'EL'  'PROP'  'HEIGHT'  'TITLE'  'LABEL_TITLE'  'BUTTON_CB'  'GUI_CB'  'LISTENER_CB'  'BUTTON_CALC'  'BUTTON_DEL'  'LISTENER_SET'  'LISTENER_MEMORIZED'  'LISTENER_LOCKED'  'D'  'XSLIDERSHOW'  'XSLIDERLABELS'  'XSLIDERHEIGHT'  'XSLIDER'  'YSLIDERSHOW'  'YSLIDERLABELS'  'YSLIDERWIDTH'  'YSLIDER'  'XYSLIDERLOCK'  'ENABLE'  'ROWNAME'  'COLUMNNAME'  'MENU_EXPORT'  'TABLE_HEIGHT'  'TABLE'  'CONTEXTMENU'  'MAP_TO_CELL' })); %CET: Computational Efficiency Trick
			
			if nargout == 1
				check_out = check;
			elseif ~check
				error( ...
					['BRAPH2' ':NNxMLP_xPP_FI_Graph:' 'WrongInput'], ...
					['BRAPH2' ':NNxMLP_xPP_FI_Graph:' 'WrongInput' '\n' ...
					'The value ' tag ' is not a valid tag for NNxMLP_xPP_FI_Graph.'] ...
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
			%  PROPERTY = PR.GETPROPPROP(POINTER) returns property number of POINTER of PR.
			%  PROPERTY = Element.GETPROPPROP(NNxMLP_xPP_FI_Graph, POINTER) returns property number of POINTER of NNxMLP_xPP_FI_Graph.
			%  PROPERTY = PR.GETPROPPROP(NNxMLP_xPP_FI_Graph, POINTER) returns property number of POINTER of NNxMLP_xPP_FI_Graph.
			%
			% Note that the Element.GETPROPPROP(PR) and Element.GETPROPPROP('NNxMLP_xPP_FI_Graph')
			%  are less computationally efficient.
			%
			% See also getPropFormat, getPropTag, getPropCategory, getPropDescription,
			%  getPropSettings, getPropDefault, checkProp.
			
			if ischar(pointer)
				prop = find(strcmp(pointer, { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'X_DRAW'  'UPDATE'  'REDRAW'  'EL'  'PROP'  'HEIGHT'  'TITLE'  'LABEL_TITLE'  'BUTTON_CB'  'GUI_CB'  'LISTENER_CB'  'BUTTON_CALC'  'BUTTON_DEL'  'LISTENER_SET'  'LISTENER_MEMORIZED'  'LISTENER_LOCKED'  'D'  'XSLIDERSHOW'  'XSLIDERLABELS'  'XSLIDERHEIGHT'  'XSLIDER'  'YSLIDERSHOW'  'YSLIDERLABELS'  'YSLIDERWIDTH'  'YSLIDER'  'XYSLIDERLOCK'  'ENABLE'  'ROWNAME'  'COLUMNNAME'  'MENU_EXPORT'  'TABLE_HEIGHT'  'TABLE'  'CONTEXTMENU'  'MAP_TO_CELL' })); % tag = pointer %CET: Computational Efficiency Trick
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
			%  TAG = PR.GETPROPTAG(POINTER) returns tag of POINTER of PR.
			%  TAG = Element.GETPROPTAG(NNxMLP_xPP_FI_Graph, POINTER) returns tag of POINTER of NNxMLP_xPP_FI_Graph.
			%  TAG = PR.GETPROPTAG(NNxMLP_xPP_FI_Graph, POINTER) returns tag of POINTER of NNxMLP_xPP_FI_Graph.
			%
			% Note that the Element.GETPROPTAG(PR) and Element.GETPROPTAG('NNxMLP_xPP_FI_Graph')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropSettings, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			if ischar(pointer)
				tag = pointer;
			else % numeric
				%CET: Computational Efficiency Trick
				nnxmlp_xpp_fi_graph_tag_list = { 'ELCLASS'  'NAME'  'DESCRIPTION'  'TEMPLATE'  'ID'  'LABEL'  'NOTES'  'TOSTRING'  'WAITBAR'  'H_WAITBAR'  'DRAW'  'DRAWN'  'PARENT'  'BKGCOLOR'  'H'  'SHOW'  'HIDE'  'DELETE'  'CLOSE'  'X_DRAW'  'UPDATE'  'REDRAW'  'EL'  'PROP'  'HEIGHT'  'TITLE'  'LABEL_TITLE'  'BUTTON_CB'  'GUI_CB'  'LISTENER_CB'  'BUTTON_CALC'  'BUTTON_DEL'  'LISTENER_SET'  'LISTENER_MEMORIZED'  'LISTENER_LOCKED'  'D'  'XSLIDERSHOW'  'XSLIDERLABELS'  'XSLIDERHEIGHT'  'XSLIDER'  'YSLIDERSHOW'  'YSLIDERLABELS'  'YSLIDERWIDTH'  'YSLIDER'  'XYSLIDERLOCK'  'ENABLE'  'ROWNAME'  'COLUMNNAME'  'MENU_EXPORT'  'TABLE_HEIGHT'  'TABLE'  'CONTEXTMENU'  'MAP_TO_CELL' };
				tag = nnxmlp_xpp_fi_graph_tag_list{pointer}; % prop = pointer
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
			%  CATEGORY = PR.GETPROPCATEGORY(POINTER) returns category of POINTER of PR.
			%  CATEGORY = Element.GETPROPCATEGORY(NNxMLP_xPP_FI_Graph, POINTER) returns category of POINTER of NNxMLP_xPP_FI_Graph.
			%  CATEGORY = PR.GETPROPCATEGORY(NNxMLP_xPP_FI_Graph, POINTER) returns category of POINTER of NNxMLP_xPP_FI_Graph.
			%
			% Note that the Element.GETPROPCATEGORY(PR) and Element.GETPROPCATEGORY('NNxMLP_xPP_FI_Graph')
			%  are less computationally efficient.
			%
			% See also Category, getPropProp, getPropTag, getPropSettings,
			%  getPropFormat, getPropDescription, getPropDefault, checkProp.
			
			prop = NNxMLP_xPP_FI_Graph.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			nnxmlp_xpp_fi_graph_category_list = { 1  1  1  3  4  2  2  6  9  7  6  6  9  8  7  6  6  6  6  6  6  6  4  4  9  9  7  7  4  7  7  7  7  7  7  2  9  9  9  7  9  9  9  7  9  9  9  9  9  9  7  7  6 };
			prop_category = nnxmlp_xpp_fi_graph_category_list{prop};
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
			%  FORMAT = PR.GETPROPFORMAT(POINTER) returns format of POINTER of PR.
			%  FORMAT = Element.GETPROPFORMAT(NNxMLP_xPP_FI_Graph, POINTER) returns format of POINTER of NNxMLP_xPP_FI_Graph.
			%  FORMAT = PR.GETPROPFORMAT(NNxMLP_xPP_FI_Graph, POINTER) returns format of POINTER of NNxMLP_xPP_FI_Graph.
			%
			% Note that the Element.GETPROPFORMAT(PR) and Element.GETPROPFORMAT('NNxMLP_xPP_FI_Graph')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropCategory,
			%  getPropDescription, getPropSettings, getPropDefault, checkProp.
			
			prop = NNxMLP_xPP_FI_Graph.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			nnxmlp_xpp_fi_graph_format_list = { 2  2  2  8  2  2  2  2  4  18  4  4  8  20  18  4  4  4  4  4  4  4  8  11  22  2  18  18  8  18  18  18  19  19  19  8  4  3  22  18  4  3  22  18  4  5  3  3  4  22  18  18  1 };
			prop_format = nnxmlp_xpp_fi_graph_format_list{prop};
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
			%  DESCRIPTION = PR.GETPROPDESCRIPTION(POINTER) returns description of POINTER of PR.
			%  DESCRIPTION = Element.GETPROPDESCRIPTION(NNxMLP_xPP_FI_Graph, POINTER) returns description of POINTER of NNxMLP_xPP_FI_Graph.
			%  DESCRIPTION = PR.GETPROPDESCRIPTION(NNxMLP_xPP_FI_Graph, POINTER) returns description of POINTER of NNxMLP_xPP_FI_Graph.
			%
			% Note that the Element.GETPROPDESCRIPTION(PR) and Element.GETPROPDESCRIPTION('NNxMLP_xPP_FI_Graph')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory,
			%  getPropFormat, getPropSettings, getPropDefault, checkProp.
			
			prop = NNxMLP_xPP_FI_Graph.getPropProp(pointer);
			
			%CET: Computational Efficiency Trick
			nnxmlp_xpp_fi_graph_description_list = { 'ELCLASS (constant, string) is the  % % % .'  'NAME (constant, string) is the name of the cell prop panel.'  'DESCRIPTION (constant, string) is the description of the cell prop panel.'  'TEMPLATE (parameter, item) is the template of the cell prop panel.'  'ID (data, string) is a few-letter code for the cell prop panel.'  'LABEL (metadata, string) is an extended label of the cell prop panel.'  'NOTES (metadata, string) are some specific notes about the cell prop panel.'  'TOSTRING (query, string) returns a string that represents the object.'  'WAITBAR (gui, logical) detemines whether to show the waitbar.'  'H_WAITBAR (evanescent, handle) is the waitbar handle.'  'DRAW (query, logical) draws the prop panel.'  'DRAWN (query, logical) returns whether the panel has been drawn.'  'PARENT (gui, item) is the panel parent.'  'BKGCOLOR (figure, color) is the panel background color.'  'H (evanescent, handle) is the panel handle.'  'SHOW (query, logical) shows the figure containing the panel and, possibly, the callback figure.'  'HIDE (query, logical) hides the figure containing the panel and, possibly, the callback figure.'  'DELETE (query, logical) resets the handles when the panel is deleted.'  'CLOSE (query, logical) closes the figure containing the panel and, possibly, the callback figure.'  'X_DRAW (query, logical) draws the prop panel.'  'UPDATE (query, logical) updates the content and permissions of the table.'  'REDRAW (query, logical) resizes the prop panel and repositions its graphical objects.'  'EL (data, item) is the element.'  'PROP (data, scalar) is the prop number.'  'HEIGHT (gui, size) is the pixel height of the prop panel.'  'TITLE (gui, string) is the property title.'  'LABEL_TITLE (evanescent, handle) is the handle for the title uilabel.'  'BUTTON_CB (evanescent, handle) is the handle for the callback button [only for PARAMETER, DATA, FIGURE and GUI].'  'GUI_CB (data, item) is the handle to the item figure.'  'LISTENER_CB (evanescent, handle) contains the listener to the updates in the property callback.'  'BUTTON_CALC (evanescent, handle) is the handle for the calculate button [only for RESULT, QUERY and EVANESCENT].'  'BUTTON_DEL (evanescent, handle) is the handle for the delete button [only for RESULT, QUERY and EVANESCENT].'  'LISTENER_SET (evanescent, handlelist) contains the listeners to the PropSet events.'  'LISTENER_MEMORIZED (evanescent, handlelist) contains the listeners to the PropMemorized events.'  'LISTENER_LOCKED (evanescent, handlelist) contains the listeners to the PropLocked events.'  'D (metadata, item) is the input dataset.'  'XSLIDERSHOW (gui, logical) determines whether to show the xslider.'  'XSLIDERLABELS (gui, stringlist) determines the xslider labels.'  'XSLIDERHEIGHT (gui, size) is the height below the xslider in font size units.'  'XSLIDER (evanescent, handle) is the x-slider.'  'YSLIDERSHOW (gui, logical) determines whether to show the yslider.'  'YSLIDERLABELS (gui, stringlist) determines the yslider labels.'  'YSLIDERWIDTH (gui, size) is the width to the right of the yslider in font size units.'  'YSLIDER (evanescent, handle) is the y-slider.'  'XYSLIDERLOCK (gui, logical) determines whether the sliders are locked so that only the diagonal is shown.'  'ENABLE (gui, option) switches table between on and off.'  'ROWNAME (gui, stringlist) determines the table row names.'  'COLUMNNAME (gui, stringlist) determines the table column names.'  'MENU_EXPORT (gui, logical) determines whether to show the context menu to export data.'  'TABLE_HEIGHT (gui, size) is the pixel height of the prop panel when the table is shown.'  'TABLE (evanescent, handle) is the alpha value edit field.'  'CONTEXTMENU (evanescent, handle) is the context menu.'  'MAP_TO_CELL (query, empty) maps a single vector back to the original cell array structure.' };
			prop_description = nnxmlp_xpp_fi_graph_description_list{prop};
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
			%  SETTINGS = PR.GETPROPSETTINGS(POINTER) returns settings of POINTER of PR.
			%  SETTINGS = Element.GETPROPSETTINGS(NNxMLP_xPP_FI_Graph, POINTER) returns settings of POINTER of NNxMLP_xPP_FI_Graph.
			%  SETTINGS = PR.GETPROPSETTINGS(NNxMLP_xPP_FI_Graph, POINTER) returns settings of POINTER of NNxMLP_xPP_FI_Graph.
			%
			% Note that the Element.GETPROPSETTINGS(PR) and Element.GETPROPSETTINGS('NNxMLP_xPP_FI_Graph')
			%  are less computationally efficient.
			%
			% See also getPropProp, getPropTag, getPropCategory, getPropFormat,
			%  getPropDescription, getPropDefault, checkProp.
			
			prop = NNxMLP_xPP_FI_Graph.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 36 % NNxMLP_xPP_FI_Graph.D
					prop_settings = Format.getFormatSettings(8);
				case 37 % NNxMLP_xPP_FI_Graph.XSLIDERSHOW
					prop_settings = Format.getFormatSettings(4);
				case 38 % NNxMLP_xPP_FI_Graph.XSLIDERLABELS
					prop_settings = Format.getFormatSettings(3);
				case 39 % NNxMLP_xPP_FI_Graph.XSLIDERHEIGHT
					prop_settings = Format.getFormatSettings(22);
				case 40 % NNxMLP_xPP_FI_Graph.XSLIDER
					prop_settings = Format.getFormatSettings(18);
				case 41 % NNxMLP_xPP_FI_Graph.YSLIDERSHOW
					prop_settings = Format.getFormatSettings(4);
				case 42 % NNxMLP_xPP_FI_Graph.YSLIDERLABELS
					prop_settings = Format.getFormatSettings(3);
				case 43 % NNxMLP_xPP_FI_Graph.YSLIDERWIDTH
					prop_settings = Format.getFormatSettings(22);
				case 44 % NNxMLP_xPP_FI_Graph.YSLIDER
					prop_settings = Format.getFormatSettings(18);
				case 45 % NNxMLP_xPP_FI_Graph.XYSLIDERLOCK
					prop_settings = Format.getFormatSettings(4);
				case 46 % NNxMLP_xPP_FI_Graph.ENABLE
					prop_settings = {'on', 'off'};
				case 47 % NNxMLP_xPP_FI_Graph.ROWNAME
					prop_settings = Format.getFormatSettings(3);
				case 48 % NNxMLP_xPP_FI_Graph.COLUMNNAME
					prop_settings = Format.getFormatSettings(3);
				case 49 % NNxMLP_xPP_FI_Graph.MENU_EXPORT
					prop_settings = Format.getFormatSettings(4);
				case 50 % NNxMLP_xPP_FI_Graph.TABLE_HEIGHT
					prop_settings = Format.getFormatSettings(22);
				case 51 % NNxMLP_xPP_FI_Graph.TABLE
					prop_settings = Format.getFormatSettings(18);
				case 52 % NNxMLP_xPP_FI_Graph.CONTEXTMENU
					prop_settings = Format.getFormatSettings(18);
				case 53 % NNxMLP_xPP_FI_Graph.MAP_TO_CELL
					prop_settings = Format.getFormatSettings(1);
				case 4 % NNxMLP_xPP_FI_4
					prop_settings = 'NNxMLP_xPP_FI_Graph';
				otherwise
					prop_settings = getPropSettings@PanelProp(prop);
			end
		end
		function prop_default = getPropDefault(pointer)
			%GETPROPDEFAULT returns the default value of a property.
			%
			% DEFAULT = NNxMLP_xPP_FI_Graph.GETPROPDEFAULT(PROP) returns the default 
			%  value of the property PROP.
			%
			% DEFAULT = NNxMLP_xPP_FI_Graph.GETPROPDEFAULT(TAG) returns the default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PR.GETPROPDEFAULT(POINTER) returns the default value of POINTER of PR.
			%  DEFAULT = Element.GETPROPDEFAULT(NNxMLP_xPP_FI_Graph, POINTER) returns the default value of POINTER of NNxMLP_xPP_FI_Graph.
			%  DEFAULT = PR.GETPROPDEFAULT(NNxMLP_xPP_FI_Graph, POINTER) returns the default value of POINTER of NNxMLP_xPP_FI_Graph.
			%
			% Note that the Element.GETPROPDEFAULT(PR) and Element.GETPROPDEFAULT('NNxMLP_xPP_FI_Graph')
			%  are less computationally efficient.
			%
			% See also getPropDefaultConditioned, getPropProp, getPropTag, getPropSettings, 
			%  getPropCategory, getPropFormat, getPropDescription, checkProp.
			
			prop = NNxMLP_xPP_FI_Graph.getPropProp(pointer);
			
			switch prop %CET: Computational Efficiency Trick
				case 36 % NNxMLP_xPP_FI_Graph.D
					prop_default = NNDataset();
				case 37 % NNxMLP_xPP_FI_Graph.XSLIDERSHOW
					prop_default = true;
				case 38 % NNxMLP_xPP_FI_Graph.XSLIDERLABELS
					prop_default = Format.getFormatDefault(3, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 39 % NNxMLP_xPP_FI_Graph.XSLIDERHEIGHT
					prop_default = 36;
				case 40 % NNxMLP_xPP_FI_Graph.XSLIDER
					prop_default = Format.getFormatDefault(18, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 41 % NNxMLP_xPP_FI_Graph.YSLIDERSHOW
					prop_default = true;
				case 42 % NNxMLP_xPP_FI_Graph.YSLIDERLABELS
					prop_default = Format.getFormatDefault(3, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 43 % NNxMLP_xPP_FI_Graph.YSLIDERWIDTH
					prop_default = 36;
				case 44 % NNxMLP_xPP_FI_Graph.YSLIDER
					prop_default = Format.getFormatDefault(18, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 45 % NNxMLP_xPP_FI_Graph.XYSLIDERLOCK
					prop_default = false;
				case 46 % NNxMLP_xPP_FI_Graph.ENABLE
					prop_default = 'on';
				case 47 % NNxMLP_xPP_FI_Graph.ROWNAME
					prop_default = {'numbered'};
				case 48 % NNxMLP_xPP_FI_Graph.COLUMNNAME
					prop_default = {'numbered'};
				case 49 % NNxMLP_xPP_FI_Graph.MENU_EXPORT
					prop_default = true;
				case 50 % NNxMLP_xPP_FI_Graph.TABLE_HEIGHT
					prop_default = 240;
				case 51 % NNxMLP_xPP_FI_Graph.TABLE
					prop_default = Format.getFormatDefault(18, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 52 % NNxMLP_xPP_FI_Graph.CONTEXTMENU
					prop_default = Format.getFormatDefault(18, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 53 % NNxMLP_xPP_FI_Graph.MAP_TO_CELL
					prop_default = Format.getFormatDefault(1, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 1 % NNxMLP_xPP_FI_1
					prop_default = 'NNxMLP_xPP_FI_Graph';
				case 2 % NNxMLP_xPP_FI_2
					prop_default = 'Cell Prop Panel';
				case 3 % NNxMLP_xPP_FI_3
					prop_default = 'A Cell Prop Panel (NNxMLP_xPP_FI_Graph) plots the panel for a CELL prop with a table and two sliders. It works for all categories. It can be personalized with the following props: TABLE_HEIGHT, XSLIDERSHOW, XSLIDERLABELS, XSLIDERHEIGHT, YSLIDERSHOW, YSLIDERLABELS, YSLIDERHEIGHT, XYSLIDERLOCK, ROWNAME, COLUMNAME, MENU_EXPORT.';
				case 4 % NNxMLP_xPP_FI_4
					prop_default = Format.getFormatDefault(8, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 5 % NNxMLP_xPP_FI_5
					prop_default = 'NNxMLP_xPP_FI_Graph ID';
				case 6 % NNxMLP_xPP_FI_6
					prop_default = 'NNxMLP_xPP_FI_Graph label';
				case 7 % NNxMLP_xPP_FI_7
					prop_default = 'NNxMLP_xPP_FI_Graph notes';
				case 23 % NNxMLP_xPP_FI_Graph.EL
					prop_default = NNClassifierMLP_CrossValidation();
				case 24 % NNxMLP_xPP_FI_Graph.PROP
					prop_default = 35;
				otherwise
					prop_default = getPropDefault@PanelProp(prop);
			end
		end
		function prop_default = getPropDefaultConditioned(pointer)
			%GETPROPDEFAULTCONDITIONED returns the conditioned default value of a property.
			%
			% DEFAULT = NNxMLP_xPP_FI_Graph.GETPROPDEFAULTCONDITIONED(PROP) returns the conditioned default 
			%  value of the property PROP.
			%
			% DEFAULT = NNxMLP_xPP_FI_Graph.GETPROPDEFAULTCONDITIONED(TAG) returns the conditioned default 
			%  value of the property with tag TAG.
			%
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  DEFAULT = PR.GETPROPDEFAULTCONDITIONED(POINTER) returns the conditioned default value of POINTER of PR.
			%  DEFAULT = Element.GETPROPDEFAULTCONDITIONED(NNxMLP_xPP_FI_Graph, POINTER) returns the conditioned default value of POINTER of NNxMLP_xPP_FI_Graph.
			%  DEFAULT = PR.GETPROPDEFAULTCONDITIONED(NNxMLP_xPP_FI_Graph, POINTER) returns the conditioned default value of POINTER of NNxMLP_xPP_FI_Graph.
			%
			% Note that the Element.GETPROPDEFAULTCONDITIONED(PR) and Element.GETPROPDEFAULTCONDITIONED('NNxMLP_xPP_FI_Graph')
			%  are less computationally efficient.
			%
			% See also conditioning, getPropDefault, getPropProp, getPropTag, 
			%  getPropSettings, getPropCategory, getPropFormat, getPropDescription, 
			%  checkProp.
			
			prop = NNxMLP_xPP_FI_Graph.getPropProp(pointer);
			
			prop_default = NNxMLP_xPP_FI_Graph.conditioning(prop, NNxMLP_xPP_FI_Graph.getPropDefault(prop));
		end
	end
	methods (Static) % checkProp
		function prop_check = checkProp(pointer, value)
			%CHECKPROP checks whether a value has the correct format/error.
			%
			% CHECK = PR.CHECKPROP(POINTER, VALUE) checks whether
			%  VALUE is an acceptable value for the format of the property
			%  POINTER (POINTER = PROP or TAG).
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  CHECK = PR.CHECKPROP(POINTER, VALUE) checks VALUE format for PROP of PR.
			%  CHECK = Element.CHECKPROP(NNxMLP_xPP_FI_Graph, PROP, VALUE) checks VALUE format for PROP of NNxMLP_xPP_FI_Graph.
			%  CHECK = PR.CHECKPROP(NNxMLP_xPP_FI_Graph, PROP, VALUE) checks VALUE format for PROP of NNxMLP_xPP_FI_Graph.
			% 
			% PR.CHECKPROP(POINTER, VALUE) throws an error if VALUE is
			%  NOT an acceptable value for the format of the property POINTER.
			%  Error id: BRAPH2:NNxMLP_xPP_FI_Graph:WrongInput
			% 
			% Alternative forms to call this method are (POINTER = PROP or TAG):
			%  PR.CHECKPROP(POINTER, VALUE) throws error if VALUE has not a valid format for PROP of PR.
			%   Error id: BRAPH2:NNxMLP_xPP_FI_Graph:WrongInput
			%  Element.CHECKPROP(NNxMLP_xPP_FI_Graph, PROP, VALUE) throws error if VALUE has not a valid format for PROP of NNxMLP_xPP_FI_Graph.
			%   Error id: BRAPH2:NNxMLP_xPP_FI_Graph:WrongInput
			%  PR.CHECKPROP(NNxMLP_xPP_FI_Graph, PROP, VALUE) throws error if VALUE has not a valid format for PROP of NNxMLP_xPP_FI_Graph.
			%   Error id: BRAPH2:NNxMLP_xPP_FI_Graph:WrongInput]
			% 
			% Note that the Element.CHECKPROP(PR) and Element.CHECKPROP('NNxMLP_xPP_FI_Graph')
			%  are less computationally efficient.
			%
			% See also Format, getPropProp, getPropTag, getPropSettings,
			% getPropCategory, getPropFormat, getPropDescription, getPropDefault.
			
			prop = NNxMLP_xPP_FI_Graph.getPropProp(pointer);
			
			switch prop
				case 36 % NNxMLP_xPP_FI_Graph.D
					check = Format.checkFormat(8, value, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 37 % NNxMLP_xPP_FI_Graph.XSLIDERSHOW
					check = Format.checkFormat(4, value, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 38 % NNxMLP_xPP_FI_Graph.XSLIDERLABELS
					check = Format.checkFormat(3, value, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 39 % NNxMLP_xPP_FI_Graph.XSLIDERHEIGHT
					check = Format.checkFormat(22, value, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 40 % NNxMLP_xPP_FI_Graph.XSLIDER
					check = Format.checkFormat(18, value, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 41 % NNxMLP_xPP_FI_Graph.YSLIDERSHOW
					check = Format.checkFormat(4, value, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 42 % NNxMLP_xPP_FI_Graph.YSLIDERLABELS
					check = Format.checkFormat(3, value, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 43 % NNxMLP_xPP_FI_Graph.YSLIDERWIDTH
					check = Format.checkFormat(22, value, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 44 % NNxMLP_xPP_FI_Graph.YSLIDER
					check = Format.checkFormat(18, value, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 45 % NNxMLP_xPP_FI_Graph.XYSLIDERLOCK
					check = Format.checkFormat(4, value, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 46 % NNxMLP_xPP_FI_Graph.ENABLE
					check = Format.checkFormat(5, value, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 47 % NNxMLP_xPP_FI_Graph.ROWNAME
					check = Format.checkFormat(3, value, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 48 % NNxMLP_xPP_FI_Graph.COLUMNNAME
					check = Format.checkFormat(3, value, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 49 % NNxMLP_xPP_FI_Graph.MENU_EXPORT
					check = Format.checkFormat(4, value, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 50 % NNxMLP_xPP_FI_Graph.TABLE_HEIGHT
					check = Format.checkFormat(22, value, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 51 % NNxMLP_xPP_FI_Graph.TABLE
					check = Format.checkFormat(18, value, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 52 % NNxMLP_xPP_FI_Graph.CONTEXTMENU
					check = Format.checkFormat(18, value, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 53 % NNxMLP_xPP_FI_Graph.MAP_TO_CELL
					check = Format.checkFormat(1, value, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				case 4 % NNxMLP_xPP_FI_4
					check = Format.checkFormat(8, value, NNxMLP_xPP_FI_Graph.getPropSettings(prop));
				otherwise
					if prop <= 35
						check = checkProp@PanelProp(prop, value);
					end
			end
			
			if nargout == 1
				prop_check = check;
			elseif ~check
				error( ...
					['BRAPH2' ':NNxMLP_xPP_FI_Graph:' 'WrongInput'], ...
					['BRAPH2' ':NNxMLP_xPP_FI_Graph:' 'WrongInput' '\n' ...
					'The value ' tostring(value, 100, ' ...') ' is not a valid property ' NNxMLP_xPP_FI_Graph.getPropTag(prop) ' (' NNxMLP_xPP_FI_Graph.getFormatTag(NNxMLP_xPP_FI_Graph.getPropFormat(prop)) ').'] ...
					)
			end
		end
	end
	methods (Access=protected) % postset
		function postset(pr, prop)
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
				case 47 % NNxMLP_xPP_FI_Graph.ROWNAME
					if pr.get('DRAWN')
					    pr.get('UPDATE')
					end
					
				case 48 % NNxMLP_xPP_FI_Graph.COLUMNNAME
					if pr.get('DRAWN')
					    pr.get('UPDATE')
					end
					
				otherwise
					if prop <= 35
						postset@PanelProp(pr, prop);
					end
			end
		end
	end
	methods (Access=protected) % calculate value
		function value = calculateValue(pr, prop, varargin)
			%CALCULATEVALUE calculates the value of a property.
			%
			% VALUE = CALCULATEVALUE(EL, PROP) calculates the value of the property
			%  PROP. It works only with properties with 5,
			%  6, and 7. By default this function
			%  returns the default value for the prop and should be implemented in the
			%  subclasses of Element when needed.
			%
			% VALUE = CALCULATEVALUE(EL, PROP, VARARGIN) works with properties with
			%  6.
			%
			% See also getPropDefaultConditioned, conditioning, preset, checkProp,
			%  postset, postprocessing, checkValue.
			
			switch prop
				case 40 % NNxMLP_xPP_FI_Graph.XSLIDER
					el = pr.get('EL');
					prop = pr.get('PROP');
					
					xslider = uislider( ...
					    'Parent', pr.get('H'), ...
					    'Tag', 'XSLIDER', ...
					    'MajorTicksMode', 'manual', ...
					    'MajorTickLabelsMode', 'manual', ...
					    'MinorTicksMode', 'manual', ...
					    'MinorTicks', [], ...
					    'FontSize', 12, ...
					    'Tooltip', [num2str(el.getPropProp(prop)) ' ' el.getPropDescription(prop)], ...
					    'ValueChangedFcn', {@cb_xslider} ...
					    );
					
					value = xslider;
					
				case 44 % NNxMLP_xPP_FI_Graph.YSLIDER
					el = pr.get('EL');
					prop = pr.get('PROP');
					
					yslider = uislider( ...
					    'Parent', pr.get('H'), ...
					    'Tag', 'YSLIDER', ...
					    'Orientation', 'vertical', ...
					    'MajorTicksMode', 'manual', ...
					    'MajorTickLabelsMode', 'manual', ...
					    'MinorTicksMode', 'manual', ...
					    'MinorTicks', [], ...
					    'FontSize', 12, ...
					    'Tooltip', [num2str(el.getPropProp(prop)) ' ' el.getPropDescription(prop)], ...
					    'ValueChangedFcn', {@cb_yslider} ...
					    );
					
					value = yslider;
					
				case 51 % NNxMLP_xPP_FI_Graph.TABLE
					el = pr.get('EL');
					prop = pr.get('PROP');
					
					table = uitable( ...
					    'Parent', pr.memorize('H'), ... % H = p for Panel
					    'Tag', 'TABLE', ...
					    'FontSize', 12, ...
					    'Tooltip', [num2str(el.getPropProp(prop)) ' ' el.getPropDescription(prop)], ...
					    'CellEditCallback', {@cb_table} ...
					    );
					
					value = table;
					
				case 52 % NNxMLP_xPP_FI_Graph.CONTEXTMENU
					contextmenu = uicontextmenu(...
					    'Parent', ancestor(pr.get('H'), 'figure'), ...
					    'Tag', 'CONTEXTMENU' ...
					    );
					menu_export_to_xls = uimenu( ...
					    'Parent', contextmenu, ...
					    'Tag', 'MENU_EXPORT_TO_XLS', ...
					    'Text', 'Export to XLS', ...
					    'MenuSelectedFcn', {@cb_export_to_xls} ...
					    );
					if pr.get('MENU_EXPORT')
					    set(pr.get('TABLE'), 'ContextMenu', contextmenu)
					end
					value = contextmenu;
					
				case 53 % NNxMLP_xPP_FI_Graph.MAP_TO_CELL
					if isempty(varargin)
					    value = {};
					    return
					end
					vector = varargin{1};
					cell_template = varargin{2};
					mappedCellArray = cell_template;
					index = 1;
					for i = 1:numel(cell_template)
					    cellData = cell_template{i};
					    if iscell(cellData)
					        % Map the vector to nested cell arrays recursively
					        nestedVector = pr.get('MAP_TO_CELL', vector(index:end), cellData);
					        mappedCellArray{i} = nestedVector;
					    else
					        % Assign elements from the vector to cells
					        numElements = numel(cellData);
					        mappedCellArray{i} = reshape(vector(index:index+numElements-1), size(cellData));
					        index = index + numElements;
					    end
					end
					
					value = mappedCellArray;
					
				case 20 % NNxMLP_xPP_FI_Graph.X_DRAW
					value = calculateValue@PanelProp(pr, 20, varargin{:}); % also warning
					if value
					    pr.memorize('TABLE')
					    pr.memorize('CONTEXTMENU')
					    pr.memorize('XSLIDER')
					    pr.memorize('YSLIDER')
					end
					
				case 21 % NNxMLP_xPP_FI_Graph.UPDATE
					value = calculateValue@PanelProp(pr, 21, varargin{:}); % also warning
					if value
					    el = pr.get('EL');
					    prop = pr.get('PROP');
					
					    if any(el.getPropCategory(prop) == [5 6 7]) && isa(el.getr(prop), 'NoValue')
					        pr.set('HEIGHT', 24)
					    else
					        pr.set('HEIGHT', pr.get('TABLE_HEIGHT'))
					    end
					    
					    el = pr.get('EL');
					    prop = pr.get('PROP');
					    
					    input_dataset = pr.get('D'); 
					    
					    g = input_dataset.get('DP_DICT').get('IT', 1).get('G');
					    if g.get('LAYERNUMBER') == 1
					        pr.set('TABLE_HEIGHT', 480, ...
					            'XSLIDERSHOW', false, ...
					            'YSLIDERSHOW', false, ...
					            'ROWNAME', g.getCallback('ANODELABELS'), ...
					            'COLUMNNAME', g.getCallback('ANODELABELS'), ...
					            varargin{:} ...
					            );
					    else % multilayer
					        pr.set('TABLE_HEIGHT', 480, ...
					            'XYSLIDERLOCK', true, ...
					            'XSLIDERSHOW', false, ...
					            'YSLIDERSHOW', true, ...
					            'YSLIDERLABELS', g.getCallback('ALAYERLABELS'), ...
					            'YSLIDERWIDTH', 60, ...
					            'ROWNAME', g.getCallback('ANODELABELS'), ...
					            'COLUMNNAME', g.getCallback('ANODELABELS'), ...
					            varargin{:});
					    end
					
					    rowname = pr.get('ROWNAME');
					    if isempty(rowname)
					        rowname = 'numbered';
					    end
					    columnname = pr.get('COLUMNNAME');
					    if isempty(rowname)
					        columnname = 'numbered';
					    end
					    set(pr.get('TABLE'), ...
					        'RowName', rowname, ...
					        'ColumnName', columnname ...
					        );
					
					    if el.isLocked(prop)
					        set(pr.get('TABLE'), 'Enable', pr.get('ENABLE'))
					    end
					    
					    prop_value = el.getr(prop);
					
					    if isa(prop_value, 'NoValue')
					        % don't plot anything for a result not yet calculated
					        set(pr.get('TABLE'), 'Visible', 'off')
					        set(pr.get('XSLIDER'), 'Visible', 'off')
					        set(pr.get('YSLIDER'), 'Visible', 'off')
					    else
					        set(pr.get('TABLE'), ...
					            'Data', set_sliders_and_get_value(), ...
					            'Enable', pr.get('ENABLE'), ...
					            'ColumnEditable', false, ...
					            'Visible', 'on' ...
					            )
					    end
					end
					
				case 22 % NNxMLP_xPP_FI_Graph.REDRAW
					value = calculateValue@PanelProp(pr, 22, varargin{:}); % also warning
					if value
					    w_p = get_from_varargin(w(pr.get('H'), 'pixels'), 'Width', varargin);
					    
					    if ~pr.get('XSLIDERSHOW') && ~pr.get('YSLIDERSHOW')
					        set(pr.get('TABLE'), 'Position', [4 4 max(1, w_p-8) max(1, pr.get('HEIGHT')-27)])
					    elseif pr.get('XSLIDERSHOW') && ~pr.get('YSLIDERSHOW')
					        set(pr.get('TABLE'), 'Position', [4 4 max(1, w_p-8) max(1, pr.get('HEIGHT')-27-pr.get('XSLIDERHEIGHT'))])
					        set(pr.get('XSLIDER'), 'Position', [4 max(1, pr.get('HEIGHT')-24-4) max(1, w_p-8) 3])
					    elseif ~pr.get('XSLIDERSHOW') && pr.get('YSLIDERSHOW')
					        set(pr.get('TABLE'), 'Position', [4+pr.get('YSLIDERWIDTH') 4 max(1, w_p-8-pr.get('YSLIDERWIDTH')) max(1, pr.get('HEIGHT')-27)])
					        set(pr.get('YSLIDER'), 'Position', [4 4 3 max(1, pr.get('HEIGHT')-27)])
					    else % pr.get('XSLIDERSHOW') && pr.get('YSLIDERSHOW')
					        set(pr.get('TABLE'), 'Position', [4+pr.get('YSLIDERWIDTH') 4 max(1, w_p-8-pr.get('YSLIDERWIDTH')) max(1, pr.get('HEIGHT')-27-pr.get('XSLIDERHEIGHT'))])
					        set(pr.get('XSLIDER'), 'Position', [4+pr.get('YSLIDERWIDTH') max(1, pr.get('HEIGHT')-24-4) max(1, w_p-8-pr.get('YSLIDERWIDTH')) 3])
					        set(pr.get('YSLIDER'), 'Position', [4 4 3 max(1, pr.get('HEIGHT')-27-8-pr.get('XSLIDERHEIGHT'))])
					    end
					end
					
				case 18 % NNxMLP_xPP_FI_Graph.DELETE
					value = calculateValue@PanelProp(pr, 18, varargin{:}); % also warning
					if value
					    pr.set('TABLE', Element.getNoValue())
					    pr.set('CONTEXTMENU', Element.getNoValue())
					    pr.set('XSLIDER', Element.getNoValue())
					    pr.set('YSLIDER', Element.getNoValue())
					end
					
				otherwise
					if prop <= 35
						value = calculateValue@PanelProp(pr, prop, varargin{:});
					else
						value = calculateValue@Element(pr, prop, varargin{:});
					end
			end
			
			function cb_xslider(~, ~)
			    set(pr.get('XSLIDER'), 'Value', round(get(pr.get('XSLIDER'), 'Value')))
			    
			    % if pr.get('XYSLIDERLOCK')
			    %     el = pr.get('EL');
			    %     prop = pr.get('PROP');
			    %     value = el.get(prop);
			    %     [R, C] = size(value);
			    % 
			    %     R = max(R, 1); % to manage the case in which C = R = 0 (empty cell)
			    % 
			    %     set(pr.get('YSLIDER'), 'Value', R + 1 - get(pr.get('XSLIDER'), 'Value'))
			    % end
			    
			    pr.get('UPDATE')
			end
			function cb_yslider(~, ~)
			    set(pr.get('YSLIDER'), 'Value', round(get(pr.get('YSLIDER'), 'Value')))
			    
			    if pr.get('XYSLIDERLOCK')
			        el = pr.get('EL');
			        prop = pr.get('PROP');
			        value_vectored = el.get(prop);
			
			        cell_template = pr.get('D').get('DP_DICT').get('IT', 1).get('INPUT');
			        value = pr.get('MAP_TO_CELL', cell2mat(value_vectored), cell_template);
			
			        [R, C] = size(value);
			        
			        C = max(C, 1); % to manage the case in which C = R = 0 (empty cell)
			
			        set(pr.get('XSLIDER'), 'Value', C + 1 - get(pr.get('YSLIDER'), 'Value'))
			    end
			
			    pr.get('UPDATE')
			end
			function cb_table(~, event)
			    i = event.Indices(1);
			    j = event.Indices(2); 
			    newdata = event.NewData;
			
			    el = pr.get('EL');
			    prop = pr.get('PROP');
			    
			    value = el.get(prop);
			    [R, C] = size(value);
			    
			    r = R + 1 - get(pr.get('YSLIDER'), 'Value');
			    c = get(pr.get('XSLIDER'), 'Value');
			    
			    value_rc = value{r, c};
			    value_rc(i, j) = newdata;
			    value{r, c} = value_rc;
			    el.set(prop, value)
			end
			function cb_export_to_xls(~, ~)
			    table = pr.get('TABLE');
			    data = table.Data;
			    
			    columns = table.ColumnName;
			    if isempty(columns)
			        columns = cellfun(@(x) ['Column ' num2str(x)], num2cell([1:1:size(data, 2)]), 'UniformOutput', false);
			    elseif isequal(columns, 'numbered')
			        columns = cellfun(@(x) num2str(x), num2cell([1:1:size(data, 2)]), 'UniformOutput', false);
			    end
			    
			    rows = table.RowName;
			    if isempty(rows)
			        rows = cellfun(@(x) ['Column ' num2str(x)], num2cell([1:1:size(data, 1)]), 'UniformOutput', false);
			    elseif isequal(rows, 'numbered')
			        rows = cellfun(@(x) num2str(x), num2cell([1:1:size(data, 1)]), 'UniformOutput', false);
			    end
			    
			    t = array2table(data, ...
			        'VariableNames', columns, ...
			        'RowNames', rows ...
			        );
			
			    % save file
			    [filename, filepath, filterindex] = uiputfile({'*.xlsx';'*.xls'}, 'Select Excel file');
			    if filterindex
			        file = [filepath filename];
			        writetable(t, file, 'WriteRowNames', true);
			    end
			end
			function value = set_sliders_and_get_value()
			    value_vectored = el.get(prop);
			    
			    cell_template = pr.get('D').get('DP_DICT').get('IT', 1).get('INPUT');
			    value = pr.get('MAP_TO_CELL', cell2mat(value_vectored), cell_template);
			
			    if isempty(value)
			        set(pr.get('XSLIDER'), ...
			            'Limits', [.6 1.4], ...
			            'MajorTicks', [1], ...
			            'MajorTickLabels', {}, ...
			            'Value', 1, ...
			            'Visible', pr.get('XSLIDERSHOW') ...
			            )
			        set(pr.get('YSLIDER'), ...
			            'Limits', [.6 1.4], ...
			            'MajorTicks', [1], ...
			            'MajorTickLabels', {}, ...
			            'Value', 1, ...
			            'Visible', pr.get('YSLIDERSHOW') ...
			            )
			    else
			        [R, C] = size(value);
			        set(pr.get('XSLIDER'), ...
			            'Limits', [.6 C+.4], ...
			            'MajorTicks', [1:1:C], ...
			            'MajorTickLabels', pr.get('XSLIDERLABELS'), ...
			            'Value', max(1, min(round(get(pr.get('XSLIDER'), 'Value'), C))), ...
			            'Visible', pr.get('XSLIDERSHOW') ...
			            )
			        set(pr.get('YSLIDER'), ...
			            'Limits', [.6 R+.4], ...
			            'MajorTicks', [1:1:R], ...
			            'MajorTickLabels', flip(pr.get('YSLIDERLABELS')), ...
			            'Value', max(1, min(round(get(pr.get('YSLIDER'), 'Value'), R))), ...
			            'Visible', pr.get('YSLIDERSHOW') ...
			            )
			
			        if pr.get('XYSLIDERLOCK')
			            set(pr.get('YSLIDER'), 'Value', R + 1 - get(pr.get('XSLIDER'), 'Value'))
			        end
			
			        value = value{R + 1 - get(pr.get('YSLIDER'), 'Value'), get(pr.get('XSLIDER'), 'Value')};
			    end
			end
		end
	end
end