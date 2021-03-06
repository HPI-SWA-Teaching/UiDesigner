code generation
generateUiClassFor: aMorph
	| generator |
	source := aMorph.
	
	"This is the root."
	source objectName: #panel.
	
	generator := self prepareGeneratorForUiClass.
	
	#(class accessors panel) do: [:step |
		step == #class ifTrue: [self createUiClassWith: generator].
		step == #accessors ifTrue: [generator generateAccessors].
		step == #panel ifTrue: [self createUiPanelCodeWith: generator]]
	displayingProgress: [:step | 
		(Dictionary newFrom: {#class -> 'Preparing class container...'.
			#accessors -> 'Creating accessors for named ui objects...'.
			#panel -> 'Generate initialization code...'})
			at: step].