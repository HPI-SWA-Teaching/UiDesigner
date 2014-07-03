history
onMorphRemoved: aMorph from: aContainer
	((self historyActionInProgress not) and: (aMorph class ~= BorderedMorph))
	ifTrue: [
		self amendHistory.
		self actionHistory add: (UiDeleteMorphCommand newWith: aMorph in: aContainer).
		self actionHistoryIndex: self actionHistoryIndex + 1.
		self checkHistoryIndex.
			
		(aMorph class = UiContainer) ifTrue: [
			aMorph disconnectSignal: aMorph from: self selector: #onMorphAdded:into:. 
			aMorph disconnectSignal: #morphAdded:into: from: self selector: #onMorphAdded:into:. ]].