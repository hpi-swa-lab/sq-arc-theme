Extension { #name : #UserInterfaceTheme }

{
	#category : #'*ArcTheme-initialize-release-override',
	#'squeak_changestamp' : 'ct 10/8/2026 21:29'
}
UserInterfaceTheme class >> cleanUp: aggressive [

	aggressive ifTrue: [
		All := Default := nil.
		self flag: #moveUpstream.
		self createAll].
]

{
	#category : #'*ArcTheme-private - display scale-override',
	#'squeak_changestamp' : 'ct 10/8/2026 21:26'
}
UserInterfaceTheme >> copyWithScaleFactor: aFloat [
	"Duplicate the receiver and reconfigure the copy to have its #scaleFactor match factorInPercent. This method is used for preserving the reference theme, which has a 100% scale factor."

	| copy |
	self
		assert: [self isTTCBased not]
		description: 'There is no need to duplicate themes that are already based on TrueType fonts!'.
	
	self flag: #moveUpstream. "preserve theme-specific logic after rescaling"
	copy := self class named: 'Demo'.
	copy merge: self overwrite: true.
	
	copy name: self name.
	copy set: #standardSystemFont to: nil. "We are not theme100 for the moment."
	self assert: [copy localScaleFactor isNil].

	copy setScaleFactorPreApply: aFloat.
	
	^ copy
]

{
	#category : #'*ArcTheme-initialize-release(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/10/2026 00:42'
}
UserInterfaceTheme class >> createAll [

	| themeClasses |
	self isAbstract ifFalse: [^ self create].
	
	themeClasses := self withAllSubclasses reject: [:ea | ea isAbstract].
	themeClasses := themeClasses topologicallySortedUsing: [:a :b | (a dependsOn: b) not].
	themeClasses do: [:ea | ea createAll].
]

{
	#category : #'*ArcTheme-initialize-release(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/10/2026 00:41'
}
UserInterfaceTheme class >> dependsOn: aThemeClass [

	^ false
]

{
	#category : #'*ArcTheme-testing(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/5/2026 22:51'
}
UserInterfaceTheme class >> isAbstract [

	^ self == UserInterfaceTheme
]
