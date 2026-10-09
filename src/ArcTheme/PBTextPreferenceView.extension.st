Extension { #name : #PBTextPreferenceView }

{
	#category : #'*ArcTheme-user interface-override',
	#'squeak_changestamp' : 'ct 10/9/2026 23:10'
}
PBTextPreferenceView >> textField [

	^(PluggableTextMorph
		on: self
		text: #preferenceValue
		accept: #preferenceValue:)
			color: self textFieldBackgroundColor;
			acceptOnCR: true;
			wrapFlag: false;
			hideScrollBarsIndefinitely;
			vResizing: #rigid;
			hResizing: #rigid;
			height: ToolBuilder default inputFieldHeight;
			width: (TextStyle default compositionWidthFor: 30);
			yourself.
]

{
	#category : #'*ArcTheme-user interface(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/9/2026 23:13'
}
PBTextPreferenceView >> textFieldBackgroundColor [

	^ (UserInterfaceTheme current get: #codeBackgroundColor for: #PBPreferenceButtonMorph)
		ifNil: [UserInterfaceTheme current get: #color for: PluggableTextMorph]
]
