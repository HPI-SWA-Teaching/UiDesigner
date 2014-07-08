initialization
openInWindowLabeled: aString inWorld: aWorld

	| window extent position systemWindow |
	systemWindow := UiCustomSystemWindow labelled: aString.
	systemWindow widget: self.
	window := systemWindow model: nil.
	window 
		" guess at initial extent"
		bounds:  (RealEstateAgent initialFrameFor: window initialExtent: self fullBounds extent world: aWorld);
		addMorph: self frame: (0@0 extent: 1@1);
		updatePaneColors.
	" calculate extent after adding in case any size related attributes were changed.  Use
	fullBounds in order to trigger re-layout of layout morphs"
	extent := self fullBounds extent + 
			(window borderWidth@window labelHeight) + window borderWidth.
	extent := self ui treeView extent.
	window extent: extent.
	aWorld addMorph: window.
	window activate.
	aWorld startSteppingSubmorphsOf: window.
	window width: 385.
	window height: 415.
	position := uiDesigner owner position + ((uiDesigner owner extent x)@0).
	window position: position.
	^window