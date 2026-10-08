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
	#category : #'app - accessing',
	#'squeak_changestamp' : 'ct 10/8/2026 21:37'
}
ArcTheme class >> githubRepositoryParams [
	"{owner. name. directory}"

	^ {'hpi-swa-lab'. 'sq-arc-theme'. 'src'}
]
