/*
	File: arrayCheck.sqf

	Description:
	Examines Arrays to determine if operation was successful

	Parameter(s):
  _this:

	Returns:
	Nothing
*/
hint "";
_player = _this select 0;
hint format["%1",player];
_execute = [player] spawn rrf_fnc_persistence_player_getPlayerLoadout;
