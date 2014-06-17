initialization
initializeAttributeView
	self ui attributeTreeView removeAllColumns; model: nil; 
			addColumn: ((UiItemViewColumnSpec new)
				textSelector: #yourself;
				itemOrientation: #horizontalMaxHeight;
				textConverter: [:node | (node includesKey: #attributeOrigin)
					ifTrue: [('<b>' , (node at: #attributeOrigin) , '</b>') asHtmlText]
					ifFalse: [node at: #propertyName]]);
				
			addColumn: ((UiItemViewColumnSpec new)
				textSelector: #propertyValue;
				editorAcceptSignal: #returnPressed;
				morphSelector: #editorMorph;
				checkableSelector: #isCheckable;
				checkedSelector: #isChecked).
	

	self ui attributeTreeView viewport eventHandler mouseDownPriority: 0.
	self ui attributeTreeView model: self attributeTreeModel.
	
	self connect: (self attributeTreeModel) signal: #modelReset to: self selector: #expandAllAttributeCategories.