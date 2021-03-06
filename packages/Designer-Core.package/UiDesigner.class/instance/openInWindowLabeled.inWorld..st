initialization
openInWindowLabeled: aString inWorld: aWorld
	"This method overrides the partent method(Morph) which looks exactly as terrible as this therefore we did not change it"

	| window extent |
	window := (UiCustomSystemWindow labelled: aString) model: nil.
	window uiDesigner: self.
	window 
		" guess at initial extent"
		bounds:  (RealEstateAgent initialFrameFor: window initialExtent: self fullBounds extent world: aWorld);
		addMorph: self frame: (0@0 extent: 1@1);
		updatePaneColors.
	" calculate extent after adding in case any size related attributes were changed.  Use
	fullBounds in order to trigger re-layout of layout morphs"
	extent := self fullBounds extent + 
			(window borderWidth@window labelHeight) + window borderWidth.
	window extent: extent.
	aWorld addMorph: window.
	window activate.
	aWorld startSteppingSubmorphsOf: window.
	^window
