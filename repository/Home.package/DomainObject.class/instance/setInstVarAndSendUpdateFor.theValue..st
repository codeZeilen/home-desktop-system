generic-observer
setInstVarAndSendUpdateFor: instVarName theValue: value 
	
	self instVarNamed: instVarName put: value.
	self changed.
	