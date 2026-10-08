Class {
	#name : #BaselineOfArcTheme,
	#superclass : #BaselineOf,
	#category : #BaselineOfArcTheme
}

{
	#category : #baseline,
	#'squeak_changestamp' : 'ct 10/8/2026 21:35'
}
BaselineOfArcTheme >> baseline: spec [
	<baseline>

	spec for: #common do: [
		spec package: 'ArcTheme'.
		
		spec group: #default with: #('ArcTheme')].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'ct 5/26/2021 15:29'
}
BaselineOfArcTheme >> projectClass [

	^ (self environment classNamed: #MetacelloCypressBaselineProject) ifNil: [super projectClass]
]
