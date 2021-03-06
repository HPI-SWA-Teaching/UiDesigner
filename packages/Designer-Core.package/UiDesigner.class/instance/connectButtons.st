initialization
connectButtons
		
	self connect: self ui newBtn signal: #clicked: toSelector: #reset.
	self connect: self ui saveBtn signal: #clicked: toSelector: #openSaveDialogByButton.
	self connect: self ui openBtn signal: #clicked: toSelector: #load.
	self connect: self ui hierarchyWindowButton 
		signal: #toggled: toSelector: #toggleHierarchyWindow:.
	self connect: self ui widgetsWindowButton 
		signal: #toggled: toSelector: #toggleWidgetsWindow:.
	self connect: self ui attributesWindowButton 
		signal: #toggled: toSelector: #toggleAttributesWindow:.
	self connect: self ui redoButton signal: #clicked: toSelector: #redoAction.
	self connect: self ui undoButton signal: #clicked: toSelector: #undoAction.
	"THIS CONECTS THE FUNCTION MULTI-REDO
	self connect: self ui redoComboBox 
		signal: #currentIndexChanged:text: toSelector: #forwardTo:text:.
	self connect: self ui undoComboBox 
		signal: #currentIndexChanged:text: toSelector: #revertUntil:text:"