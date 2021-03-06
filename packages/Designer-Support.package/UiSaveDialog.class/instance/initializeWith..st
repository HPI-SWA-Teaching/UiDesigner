initialize
initializeWith: aUiDesigner 

	self ui setupUi: self.
	uiDesigner := aUiDesigner.
	
	self connect: self ui okButton signal: #clicked: to: self selector: #onOkButtonClick.
	self connect: self ui saveWithSurroundingClass 
		signal: #clicked: to: self selector: #onSaveWithSurroundingClassClick.
	self connect: self ui cancelButton signal: #clicked: to: self selector: #onCancelButtonClick.
	self connect: self ui classNameInput signal: #textEdited: to: self selector: #detectClassExistsWarning: .