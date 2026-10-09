Extension { #name : #SolarizedTheme }

{
	#category : #'*ArcTheme-initialize-release(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/5/2026 22:52'
}
SolarizedTheme class >> createAll [

	self createDark.
	self createLight.
]

{
	#category : #'*ArcTheme-initialize-release(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/10/2026 00:42'
}
SolarizedTheme class >> dependsOn: aThemeClass [

	^ aThemeClass name = #SqueakTheme
]
