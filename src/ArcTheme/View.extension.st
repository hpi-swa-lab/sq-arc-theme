Extension { #name : #View }

{
	#category : #'*ArcTheme-bordering-override',
	#'squeak_changestamp' : 'ct 10/8/2026 23:13'
}
View >> backgroundColor [
	Display depth <= 2 ifTrue: [^ Color white].
	self flag: #moveUpstream. "lol, Display does not support transparency"
	(insideColor isNil or: [insideColor isTransparent]) ifFalse: [^ Color colorFrom: insideColor].
	^ superView == nil
		ifFalse: [superView backgroundColor]
		ifTrue:	[Color white]
]
