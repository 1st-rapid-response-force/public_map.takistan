/*
	File: getScoresScript.sqf

	Description:
	Resets range

	Parameter(s):
  	_this:
		0 - integer - Range ID
  		1 - array - integers - lane numbers

	Returns:
	Nothing
*/
params [["_score",0],["_maxScore",60]];

hint format ["REPORT: %1/%2", _score,_maxScore];