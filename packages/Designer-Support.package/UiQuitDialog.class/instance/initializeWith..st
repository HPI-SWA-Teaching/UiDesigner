initialization
initializeWith: aUiDesigner

	super initialize.
	self ui setupUi: self.
	uiDesigner := aUiDesigner.
	
	self connect: self ui saveButton signal: #clicked: to: self selector: #onSaveButton.
	self connect: self ui quitButton signal: #clicked: to: self selector: #onQuitButton.