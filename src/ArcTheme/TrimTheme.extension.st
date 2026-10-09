Extension { #name : #TrimTheme }

{
	#category : #'*ArcTheme-initialize-release(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/10/2026 00:42'
}
TrimTheme class >> dependsOn: aThemeClass [

	^ aThemeClass name = #SqueakTheme
]
