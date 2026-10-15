Extension { #name : #ScrollPane }

{
	#category : #'*ArcTheme-drawing-override',
	#'squeak_changestamp' : 'mad 10/11/2026 22:57'
}
ScrollPane >> borderAsOverlay [
	^ self userInterfaceTheme borderAsOverlay ifNil: [true]
]

{
	#category : #'*ArcTheme-drawing-override',
	#'squeak_changestamp' : 'mad 10/11/2026 22:58'
}
ScrollPane >> drawOn: aCanvas [

	self borderAsOverlay ifFalse: [^ super drawOn: aCanvas].
	self wantsRoundedCorners
		ifTrue: [aCanvas fillRoundRect: self bounds radius: self cornerRadius fillStyle: self fillStyle]
		ifFalse: [aCanvas fillRectangle: self bounds fillStyle: self fillStyle].
]

{
	#category : #'*ArcTheme-drawing-override',
	#'squeak_changestamp' : 'mad 10/11/2026 22:58'
}
ScrollPane >> drawOverlayOn: aCanvas [
	"Draw my border OVER my submorphs because the scrollbars overlap."
	self borderAsOverlay ifFalse: [^ super drawOverlayOn: aCanvas].
	
	self wantsRoundedCorners
		ifTrue: [aCanvas frameRoundRect: self bounds radius: self cornerRadius borderStyle: self borderStyle]
		ifFalse: [aCanvas frameRectangle: self bounds borderStyle: self borderStyle].
		
	super drawOverlayOn: aCanvas.
]
