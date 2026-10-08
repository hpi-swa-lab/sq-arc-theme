Class {
	#name : #ArcTheme,
	#superclass : #UserInterfaceTheme,
	#classVars : [
		'CloseBoxImage',
		'CollapseBoxImage',
		'ExpandBoxImage',
		'MenuBoxImage'
	],
	#category : #ArcTheme
}

{
	#category : #'instance creation',
	#'squeak_changestamp' : 'ct 10/8/2026 21:11'
}
ArcTheme class >> addToolIcons: theme [
	"Tool-specific icons."

	theme 
		set: #genericClass for: #ToolIcons to: self genericClass.
]

{
	#category : #'window boxes',
	#'squeak_changestamp' : 'ct 10/8/2026 20:28'
}
ArcTheme class >> closeBoxImage [

	^ self makeBoxOfColor: (Color r: 0.952 g: 0.405 b: 0.393)
]

{
	#category : #'window boxes',
	#'squeak_changestamp' : 'ct 10/8/2026 20:28'
}
ArcTheme class >> collapseBoxImage [

	^ self makeBoxOfColor: (Color r: 0.958 g: 0.751 b: 0.356)
]

{
	#category : #'window boxes',
	#'squeak_changestamp' : 'ct 10/8/2026 20:29'
}
ArcTheme class >> expandBoxImage [

	^ self makeBoxOfColor: (Color r: 0.426 g: 0.762 b: 0.401)
]

{
	#category : #'tool icons',
	#'squeak_changestamp' : 'ct 10/8/2026 21:19'
}
ArcTheme class >> genericClass [

	| font |
	font := StrikeFont familyName: 'Bitmap DejaVu Sans' pointSize: 7 pt.
	^ (FormCanvas extent: 15.5 px @ 15.5 px depth: 32) in: [:canvas |
		canvas asBalloonCanvas
			aaLevel: 4;
			drawString: 'C' at: 15.5 px @ 15.5 px - ((font widthOf: $C) @ font ascent) // 2 font: font color: Color lightGray.
		canvas form]
]

{
	#category : #'app - accessing',
	#'squeak_changestamp' : 'ct 10/8/2026 21:37'
}
ArcTheme class >> githubRepositoryParams [
	"{owner. name. directory}"

	^ {'hpi-swa-lab'. 'sq-arc-theme'. 'src'}
]

{
	#category : #testing,
	#'squeak_changestamp' : 'ct 10/8/2026 20:43'
}
ArcTheme class >> isAbstract [

	^ self == ArcTheme
]

{
	#category : #'window boxes',
	#'squeak_changestamp' : 'ct 10/8/2026 20:30'
}
ArcTheme class >> makeBoxOfColor: aColor [

	^ self
		makeBoxOfSize: 12 px @ 12 px
		color: aColor
]

{
	#category : #'window boxes',
	#'squeak_changestamp' : 'ct 10/8/2026 20:25'
}
ArcTheme class >> makeBoxOfSize: size color: aColor [

	| canvas |
	canvas := FormCanvas extent: size depth: 32.
	canvas asBalloonCanvas
		aaLevel: 4;
		fillOval: (1 @ 1 extent: size - 2) color: aColor.
	^ canvas form
]

{
	#category : #'window boxes',
	#'squeak_changestamp' : 'ct 10/8/2026 20:29'
}
ArcTheme class >> menuBoxImage [

	^ self makeBoxOfColor: (Color r: 0.401 g: 0.669 b: 0.762)
]

{
	#category : #'private - display scale',
	#'squeak_changestamp' : 'ct 10/8/2026 21:28'
}
ArcTheme >> setScaleFactor: aFloat [

	| answer |
	answer := super setScaleFactor: aFloat.
	answer == self ifFalse: [^ answer].
	
	self
		set: #closeBoxImage for: #SystemWindow to: self class closeBoxImage;
		set: #collapseBoxImage for: #SystemWindow to: self class collapseBoxImage;
		set: #expandBoxImage for: #SystemWindow to: self class expandBoxImage;
		set: #menuBoxImage for: #SystemWindow to: self class menuBoxImage.
	self
		set: #closeBoxImage for: #MenuMorph to: self class closeBoxImage.
	self
		set: #genericClass for: #ToolIcons to: self class genericClass.
]
