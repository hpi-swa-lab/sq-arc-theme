Extension { #name : #PBClassPreferenceView }

{
	#category : #'*ArcTheme-user interface-override',
	#'squeak_changestamp' : 'ct 10/9/2026 23:14'
}
PBClassPreferenceView >> textField [

	| field |
	field := PluggableTextMorphPlus
		on: self
		text: #preferenceValue
		accept: #preferenceValue:.
	field
		color: self textFieldBackgroundColor;
		acceptOnCR: true;
		wrapFlag: false;
		hideScrollBarsIndefinitely;
		vResizing: #rigid;
		hResizing: #rigid;
		height: ToolBuilder default inputFieldHeight;
		width: (TextStyle default compositionWidthFor: 30).
	
	styler ifNotNil: [:s | field styler: (s view: field)].
	
	^ field
]
