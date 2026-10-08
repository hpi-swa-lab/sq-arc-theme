Extension { #name : #MenuMorph }

{
	#category : #'*ArcTheme-construction(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/8/2026 21:22'
}
MenuMorph >> addStayUpIcons [
	| title closeBox pinBox |
	title := submorphs
				detect: [:ea | ea hasProperty: #titleString]
				ifNone: [
					"Called too soon. Will add stay-up icons when title is added."
					self setProperty: #needsTitlebarWidgets toValue: true.
					^ self].
	closeBox := SystemWindowButton new target: self;
				 actionSelector: #delete;
				 color: Color transparent;
				 setBalloonText: 'close this menu' translated;
				 borderWidth: 0.
	self flag: #moveUpstream. "new dispatch via #userInterfaceTheme"
	((self userInterfaceTheme closeBoxImage ifNil: [self class closeBoxImage]) scaledToSize: 12 px @ 12 px) in: [:icon |
		closeBox labelGraphic: icon; extent: icon extent].
	pinBox := SystemWindowButton new target: self;
				 actionSelector: #stayUp:;
				 arguments: {true};
				 color: Color transparent;
				 setBalloonText: 'keep this menu up' translated;
				 borderWidth: 0.
	self flag: #moveUpstream. "new dispatch via #userInterfaceTheme"
	((self userInterfaceTheme pushPinImage ifNil: [self class pushPinImage]) scaledToSize: 16 px @ 16 px) in: [:icon |
		pinBox labelGraphic: icon; extent: icon extent].
		
	title
		addMorphFront: closeBox;
		addMorphBack: pinBox.
		
	self setProperty: #hasTitlebarWidgets toValue: true.
	self removeProperty: #needsTitlebarWidgets.
	self removeStayUpItems
]

{
	#category : #'*ArcTheme-preferences(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/8/2026 20:54'
}
MenuMorph class >> themeProperties [

	^ super themeProperties, {
		{ #borderColor. 'Colors'. 'Color of the menu''s border.' }.
		{ #borderWidth. 'Borders'. 'Width of the menu''s border.' }.
		{ #borderStyle. 'Borders'. 'Whether to use a plain border, inset, or outset.' }.
		{ #color. 'Colors'. 'Background color of the menu.' }.

		{ #titleBorderColor. 'Colors'. 'Color of the menu title border.' }.
		{ #titleBorderWidth. 'Geometry'. 'Width of the menu title border.' }.
		{ #titleBorderStyle. 'Borders'. 'Whether to use a plain border, inset, or outset for the title.' }.
		{ #titleColor. 'Colors'. 'Background color of the menu'' title.' }.
		{ #titleFont. 'Fonts'. 'Font for menu title.' }.
		{ #titleTextColor. 'Colors'. 'Color for the menu title label.' }.

		{ #lineColor. 'Colors'. 'Color of the separators between menu items.' }.
		{ #lineStyle. 'Colors'. 'Use border-style to change appearance.' }.
		{ #lineWidth. 'Geometry'. 'How big the separators should be.' }.
		
		{ #closeBoxImage. 'Icons'. 'Icon to click on to close the menu.' }.
		{ #pushPinImage. 'Icons'. 'Icon to click on to keep the menu up.' }
	}
]
