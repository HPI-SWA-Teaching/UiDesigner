code generation
prepareGeneratorForUiClass
	| generator |
	generator := UiGenericCodeGenerator new.
	generator generatedClassName: (self uiClassName).
	generator instVars: self instVarsString.
	generator category: (self category).
	generator superClass: UserInterface.
	^generator