Extension { #name : #SystemWindow }

{
	#category : #'*ArcTheme-initialization-override',
	#'squeak_changestamp' : 'ct 10/8/2026 21:23'
}
SystemWindow >> createBox: aForm [
	"create a button with a form to be used in the label area"
	
	| box |
	box := SystemWindowButton new.
	box color: Color transparent;
		 target: self;
		 useSquareCorners;
		 borderWidth: 0;
		 flag: #moveUpstream; "hard-coded scale factor to allow for high-dpi forms"
		 labelGraphic: (aForm scaledToSize: 12 px @ 12 px);
		 extent: self boxExtent.
	^ box
]
