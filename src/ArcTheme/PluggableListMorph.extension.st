Extension { #name : #PluggableListMorph }

{
	#category : #'*ArcTheme-initialization-override',
	#'squeak_changestamp' : 'ct 10/9/2026 01:32'
}
PluggableListMorph >> setListParameters [

	self listMorph
		selectionColor: (self userInterfaceTheme selectionColor ifNil: [Color r: 0.72 g: 0.72 b: 0.9]);
		singleSelectionColor: (self userInterfaceTheme selectionColor ifNil: [Color r: 0.72 g: 0.72 b: 0.9]);
		multiSelectionColor: (self userInterfaceTheme multiSelectionColor ifNil: [(Color r: 0.72 g: 0.72 b: 0.9) lighter]);
		setProperty: #selectionTextColor
			toValue: (self userInterfaceTheme selectionTextColor ifNil: [Color black]);
		setProperty: #singleSelectionTextColor
			toValue: self userInterfaceTheme singleSelectionTextColor;
		setProperty: #multiSelectionTextColor
			toValue: self userInterfaceTheme multiSelectionTextColor;
		filterColor: (self userInterfaceTheme filterColor ifNil: [Color yellow paler]);
		setProperty: #filterTextColor
			toValue: (self userInterfaceTheme filterTextColor ifNil: [Color black]);
		
		setProperty: #preSelectionColor
			toValue: ((self userInterfaceTheme preSelectionModifier ifNil: [ [:c | Color gray: 0.9] ]) value: self listMorph selectionColor asColor);
		setProperty: #hoverColor
			toValue: ((self userInterfaceTheme hoverSelectionModifier ifNil: [ [:c | c darker alpha: 0.3] ]) value: self listMorph selectionColor asColor)
]

{
	#category : #'*ArcTheme-preferences-override',
	#'squeak_changestamp' : 'ct 10/9/2026 01:42'
}
PluggableListMorph class >> themeProperties [

	^ super themeProperties, {
		{ #font. 'Fonts'. 'Font of the list items.' }.
		{ #textColor. 'Colors'. 'Color of the list items.' }.
		{ #selectionColor. 'Colors'. 'Color used for an item when hovering or selecting it.' }.
		{ #singleSelectionColor. 'Colors'. 'Outline color used for an item when hovering or (primarily) selecting it in a list that also supports multi-selection.'} flag: #moveUpstream.
		{ #multiSelectionColor. 'Colors'. 'Color used for items that are selected among others.'}.
		{ #selectionTextColor. 'Colors'. 'Color used for label when hovering or selecting them.' }.
		{ #singleSelectionTextColor. 'Colors'. 'Color used for label when hovering or selecting it in a list that also supports multi-selection.' } flag: #moveUpstream.
		{ #multiSelectionTextColor. 'Colors'. 'Color used for labels that are selected among others.' } flag: #moveUpstream.
		{ #filterColor. 'Colors'. 'Color used for items to indicate the matching filter.' }.
		{ #filterTextColor. 'Colors'. 'Color used for items to indicate the matching filter.' }.
		
		{ #preSelectionModifier. 'Colors'. 'How to derive the pre-selection color from the selection color.'}.
		{ #hoverSelectionModifier. 'Colors'. 'How to derive the hover color from the selection color.'}.
	}
]
