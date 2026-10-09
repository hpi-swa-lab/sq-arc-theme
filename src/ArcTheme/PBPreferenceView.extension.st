Extension { #name : #PBPreferenceView }

{
	#category : #'*ArcTheme-user interface(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/10/2026 00:07'
}
PBPreferenceView >> highlightOff: representativeButton [

	| color |
	super highlightOff: representativeButton.
	representativeButton allMorphsDo: [:m |
		(m isKindOf: ThreePhaseButtonMorph) ifTrue: [
			color := (UserInterfaceTheme current get: #textColor for: PluggableListMorph) ifNil: [Color black].
			m
				textColor: color;
				color: color]].
]

{
	#category : #'*ArcTheme-user interface(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/10/2026 00:07'
}
PBPreferenceView >> highlightOn: representativeButton [

	| color |
	super highlightOn: representativeButton.
	representativeButton allMorphsDo: [:m |
		(m isKindOf: ThreePhaseButtonMorph) ifTrue: [
			color := (UserInterfaceTheme current get: #selectionTextColor for: PluggableListMorph) ifNil: [Color black].
			m
				textColor: color;
				color: color]].
]
