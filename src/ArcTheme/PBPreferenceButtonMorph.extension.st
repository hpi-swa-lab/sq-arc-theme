Extension { #name : #PBPreferenceButtonMorph }

{
	#category : #'*ArcTheme-extra controls(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/10/2026 00:47'
}
PBPreferenceButtonMorph >> codeBackgroundColor [

	self flag: #moveUpstream.
	^ self userInterfaceTheme codeBackgroundColor
		ifNil: [UserInterfaceTheme current get: #color for: PluggableTextMorph]
]

{
	#category : #'*ArcTheme-highlighting-override',
	#'squeak_changestamp' : 'ct 10/10/2026 00:47'
}
PBPreferenceButtonMorph >> highlightParametersOff [

	self beTransparent.
	self flag: #moveUpstream.
	self preferenceView highlightOff: self preferenceMorphicView.
]

{
	#category : #'*ArcTheme-highlighting-override',
	#'squeak_changestamp' : 'ct 10/10/2026 00:47'
}
PBPreferenceButtonMorph >> highlightParametersOn [

	self color: ((UserInterfaceTheme current get: #selectionColor for: PluggableListMorph) ifNil: [Color gray alpha: 0.1]).
	self flag: #moveUpstream.
	self preferenceView highlightOn: self preferenceMorphicView.
]

{
	#category : #'*ArcTheme-extra controls-override',
	#'squeak_changestamp' : 'ct 10/9/2026 23:42'
}
PBPreferenceButtonMorph >> preferenceCodeTextMorph [
	| text tm |
	text := self preferenceCodeText.
	tm := TextMorph new
		contents: text;
		backgroundColor: self codeBackgroundColor;
		wrapFlag: true;
		autoFit: true;
		hResizing: #spaceFill;
		vResizing: #shrinkWrap;
		margins: (5 px @ 0 corner: 5 px @ 0);
		visible: text notEmpty;
		yourself. "we don't want an empty textmorph showing"
	^tm
]
