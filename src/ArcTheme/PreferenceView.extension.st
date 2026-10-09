Extension { #name : #PreferenceView }

{
	#category : #'*ArcTheme-user interface(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/10/2026 00:03'
}
PreferenceView >> highlightOff: representativeButton [

	| label |
	label := representativeButton firstSubmorph.
	label
		color: ((UserInterfaceTheme current get: #textColor for: PluggableListMorph) ifNil: [Color black]);
		font: ((UserInterfaceTheme current get: #font for: PluggableListMorph) ifNil: [TextStyle defaultFont]).
]

{
	#category : #'*ArcTheme-user interface(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/10/2026 00:03'
}
PreferenceView >> highlightOn: representativeButton [

	| label |
	label := representativeButton firstSubmorph.
	label
		color: ((UserInterfaceTheme current get: #selectionTextColor for: PluggableListMorph) ifNil: [Color black]);
		font: (((UserInterfaceTheme current get: #font for: PluggableListMorph) ifNil: [TextStyle defaultFont])
			emphasized: TextEmphasis bold emphasisCode).
]
