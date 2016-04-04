/*
	File: resetRangeScript.sqf

	Description:
	Resets range

	Parameter(s):
  	_this:
		0 - integer - Range Type
  		1 - integer - Lane Number

	Returns:
	Nothing
*/
params [["_rangeType",0],["_laneNum",1]];

if (_rangeType == 0) then
{
	call (compile (format ["profileNamespace setVariable [""lane_score_%1"",%2];",_laneNum,0]));
};

if (_rangeType == 1) then
{
	call (compile (format ["profileNamespace setVariable [""pistol_lane_score_%1"",%2];",_laneNum,0]));
};