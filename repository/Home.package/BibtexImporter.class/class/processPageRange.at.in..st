as yet unclassified
processPageRange: rangeString at: key in: properties

	| numbers |
	[numbers := (rangeString findTokens: '-') collect: [:s | s withBlanksTrimmed asNumber]]
		on: NumberParserError
		do: [numbers := #()].
	numbers ifEmpty: [^ #pages -> nil].
	numbers size = 1 ifTrue: [numbers := {numbers first . numbers first}].
	^ #pages -> (numbers first to: numbers second) 