layouting
updateSingleColumnHorizontalSingleRowLayout

	| cell hOffset previousItemWidth |
	
	self assert: self orientation == #horizontalSingleRow.
	
	"Compute virtual row and column count."
	vRowCount := 1.
	vColumnCount := self rowCountVisible.
	
	"Prepare cache and running variables."
	cellToBounds := {Array new: vColumnCount}. "one row only"
	cell := 0@1.
	hOffset := 0.
	previousItemWidth := nil.

	self rowsDo: [:rowInfo | rowInfo visible ifTrue: [
		| item |

		cell := cell + (1 @ 0).
		
		item := rowInfo items first.
		previousItemWidth ifNotNil: [:w | hOffset := hOffset + w].
		previousItemWidth := item width.

		"Special handling for hAlignment makes no sense here."		
		item topLeft: hOffset @ 0.

		"Fill bounds cache."
		cellToBounds first at: cell x put: {hOffset@0.item extent x @ maxItemExtent y.rowInfo}]].
			
	"Update dynamically-sized dimension."
	self width: self submorphBounds width.