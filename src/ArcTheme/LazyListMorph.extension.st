Extension { #name : #LazyListMorph }

{
	#category : #'*ArcTheme-drawing-override',
	#'squeak_changestamp' : 'ct 10/9/2026 01:44'
}
LazyListMorph >> colorForRow: row [

	| isSelected |
	isSelected := selectedRow notNil and: [ row = selectedRow].
	^ listSource hasMultiSelection
		ifFalse: [
			isSelected
				ifTrue: [self selectionTextColor]
				ifFalse: [self color]]
		ifTrue: [
			(self listSource itemSelectedAmongMultiple: row)
				ifTrue: [
					"How should we style rows that are both single- and multi-selected? ArcLightTheme prefers it this way."
					self multiSelectionTextColor]
				ifFalse: [
					isSelected
						ifTrue: [self singleSelectionTextColor]
						ifFalse: [self color]]]
]

{
	#category : #'*ArcTheme-drawing-override',
	#'squeak_changestamp' : 'ct 10/9/2026 01:14'
}
LazyListMorph >> drawSelectionOn: aCanvas [
	
	self 
		drawSelectionFor: selectedRow 
		withColor:
			(listSource hasMultiSelection
				ifFalse: [self selectionColor]
				ifTrue: [self singleSelectionColor])
		on: aCanvas
]

{
	#category : #'*ArcTheme-accessing(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/9/2026 01:39'
}
LazyListMorph >> multiSelectionTextColor [

	^ self valueOfProperty: #multiSelectionTextColor ifAbsent: [self selectionTextColor]
]

{
	#category : #'*ArcTheme-accessing(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/9/2026 01:13'
}
LazyListMorph >> singleSelectionColor [

	^ self valueOfProperty: #singleSelectionColor ifAbsent: [self selectionColor asColor]
]

{
	#category : #'*ArcTheme-accessing(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/9/2026 01:13'
}
LazyListMorph >> singleSelectionColor: aColor [

	self setProperty: #singleSelectionColor toValue: aColor.
]

{
	#category : #'*ArcTheme-accessing(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/9/2026 01:39'
}
LazyListMorph >> singleSelectionTextColor [

	^ self valueOfProperty: #singleSelectionTextColor ifAbsent: [self selectionTextColor]
]
