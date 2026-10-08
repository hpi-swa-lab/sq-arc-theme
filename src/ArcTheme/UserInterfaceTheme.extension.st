Extension { #name : #UserInterfaceTheme }

{
	#category : #'*ArcTheme-initialize-release(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/8/2026 21:29'
}
UserInterfaceTheme class >> cleanUp: aggressive [

	aggressive ifTrue: [
		All := Default := nil.
		self flag: #moveUpstream.
		self createAll].
]

{
	#category : #'*ArcTheme-initialize-release(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/5/2026 22:51'
}
UserInterfaceTheme class >> createAll [

	self isAbstract ifFalse: [self create].
	self subclassesDo: [:ea | ea createAll].
]

{
	#category : #'*ArcTheme-testing(-pseudo)-override',
	#'squeak_changestamp' : 'ct 10/5/2026 22:51'
}
UserInterfaceTheme class >> isAbstract [

	^ self == UserInterfaceTheme
]
