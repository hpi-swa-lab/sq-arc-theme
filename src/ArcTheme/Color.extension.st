Extension { #name : #Color }

{
	#category : #'*ArcTheme-instance creation',
	#'squeak_changestamp' : 'ct 10/10/2026 02:13'
}
Color class >> arcH: hue s: saturation l: lightness [

	self flag: #moveUpstream.
	^ self basicNew arcSetHue: hue saturation: saturation lightness: lightness
]

{
	#category : #'*ArcTheme-instance creation',
	#'squeak_changestamp' : 'ct 10/10/2026 02:13'
}
Color class >> arcH: h s: s l: l alpha: alpha [

	^ (self arcH: h s: s l: l) alpha: alpha
]

{
	#category : #'*ArcTheme-accessing',
	#'squeak_changestamp' : 'ct 10/10/2026 02:35'
}
Color >> arcHslSaturation [
	"Answer the HSL saturation of this color, a value between 0.0 and 1.0."

	| r g b max min |
	r := self privateRed.
	g := self privateGreen.
	b := self privateBlue. 
	
	max := min := r.
	g > max ifTrue: [max := g].
	b > max ifTrue: [max := b].
	g < min ifTrue: [min := g].
	b < min ifTrue: [min := b].
	
	^ max = min
		ifTrue: [0.0]
		ifFalse: [(max - min) asFloat / (ComponentMax - (max + min - ComponentMask) abs)]
]

{
	#category : #'*ArcTheme-private',
	#'squeak_changestamp' : 'ct 10/10/2026 02:32'
}
Color >> arcHueToRGB: p "min channel" q: q "max channel" t: t [ "hue position"

	| tt |
	tt := t.
	tt < 0.0 ifTrue: [tt := tt + 1.0].
	tt > 1.0 ifTrue: [tt := tt - 1.0].
	
	tt < (1.0 / 6.0) ifTrue: [^ p + (q - p * 6.0 * tt)].
	tt < 0.5 ifTrue: [^ q].
	tt < (2.0 / 3.0) ifTrue: [^ p + (q - p * (2.0 / 3.0 - tt) * 6.0)].
	^ p
]

{
	#category : #'*ArcTheme-accessing',
	#'squeak_changestamp' : 'ct 10/10/2026 03:05'
}
Color >> arcLightness [

	| max min |
	max := ((self privateRed max: self privateGreen) max: self privateBlue) asFloat.
	min := ((self privateRed min: self privateGreen) min: self privateBlue) asFloat.
	^ max + min / (2.0 * ComponentMax)
]

{
	#category : #'*ArcTheme-private',
	#'squeak_changestamp' : 'ct 10/10/2026 02:29'
}
Color >> arcSetHue: hue saturation: saturation lightness: lightness [
	"Initialize this color to the given hue, saturation, and lightness (HSL)."

	| s l hf p q |
	s := (saturation asFloat max: 0.0) min: 1.0.
	l := (lightness asFloat max: 0.0) min: 1.0.
	
	"zero saturation yields gray with the given lightness"
	s = 0.0 ifTrue: [^ self setRed: l green: l blue: l].
	
	hf := hue asFloat.
	(hf < 0.0 or: [hf >= 360.0])
		ifTrue: [hf := hf \\ 360].
	hf := hf / 360.0.
	
	q := l < 0.5 "max channel"
		ifTrue: [l * (1.0 + s)]
		ifFalse: [l + s - (l * s)].
	p := 2.0 * l - q. "min channel"
	
	^ self
		setRed: (self arcHueToRGB: p q: q t: hf + (1.0 / 3.0))
		green: (self arcHueToRGB: p q: q t: hf)
		blue: (self arcHueToRGB: p q: q t: hf - (1.0 / 3.0))
]

{
	#category : #'*ArcTheme-transformations',
	#'squeak_changestamp' : 'ct 10/10/2026 02:12'
}
Color >> arcWithLightness: aFloat [

	^ Color
		arcH: self hue
		s: self arcHslSaturation
		l: aFloat
		alpha: self alpha
]
