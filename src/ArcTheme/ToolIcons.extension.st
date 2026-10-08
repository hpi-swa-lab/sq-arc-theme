Extension { #name : #ToolIcons }

{
	#category : #'*ArcTheme-accessing-override',
	#'squeak_changestamp' : 'ct 10/8/2026 21:45'
}
ToolIcons class >> iconNamed: aSymbol [

	self flag: #moveUpstream.
	(self userInterfaceTheme get: aSymbol for: self name) ifNotNil: [:icon | ^ icon].
	^self icons at: aSymbol ifAbsentPut: [self perform: aSymbol]
]

{
	#category : #'*ArcTheme-buttons-override',
	#'squeak_changestamp' : 'ct 10/8/2026 21:46'
}
ToolIcons class >> keyboardButtonLabeled: anObject dyed: aColor [

	| id form c width height elevation thickness font margins color label |
	thickness := RealEstateAgent scaleFactor rounded.

	anObject isForm
		ifTrue: [label := anObject]
		ifFalse: [
			label := anObject asString.
			id := (#button, label, thickness) asSymbol.
			self flag: #moveUpstream.
			((self userInterfaceTheme get: id for: self name) ifNil: [self icons at: id ifAbsent: nil])
				ifNotNil: [:icon | 
					^ aColor ~= Color black
						ifTrue: [icon dyed: aColor]
						ifFalse: [icon]]].

	elevation := (thickness * 2.5) rounded.
	font := Preferences standardButtonFont.
	color := Color black.

	margins := (font widthOf: $x) @ (font height // 2).
	width := label isForm ifTrue: [label width] ifFalse: [font widthOfString: label].
	height := label isForm ifTrue: [label height] ifFalse: [font height].
	
	form := Form
		extent: (width + (2* margins x)) @ (height + (2* margins y) + elevation)
		depth: 32.

	c := form getCanvas.	
	c
		frameRoundRect: (0@0 extent: form extent - (0@elevation))
		radius: thickness * 5
		width: thickness
		color: Color black.

	elevation > 0 ifTrue: [
		c
			clipBy: (0@ (form height // 2) corner: form width @ form height)
			during: [:c2 |
				c2
					frameRoundRect: (0@ elevation extent: form extent - (0@elevation))
					radius: thickness * 5
					width: thickness
					color: Color black]].
	
	label isForm
		ifTrue: [ c paintImage: label at: margins x @ (margins y)]
		ifFalse: [
			c
				drawString: label
				at: margins x @ (margins y)
				font: font
				color: color].
	
	"Fix true black to use #000001 so that #colorFromPixelValue:depth: can work."
	form bits: (form bits collect: [:ea | 
		(ea bitAnd: 16r00FFFFFF) = 0
			ifTrue: [(ea bitAnd: 16rFF000000) + 1]
			ifFalse: [ea]]).
	
	id ifNotNil: [self icons at: id put: form].
	
	^ aColor ~= Color black
		ifTrue: [form dyed: aColor]
		ifFalse: [form]
]
