Extension { #name : #MonokaiTheme }

{
	#category : #'*ArcTheme-initialize-release(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/5/2026 22:52'
}
MonokaiTheme class >> createAll [

	self createDark.
]

{
	#category : #'*ArcTheme-initialize-release(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/10/2026 00:42'
}
MonokaiTheme class >> dependsOn: aThemeClass [

	^ aThemeClass name = #SqueakTheme
]
