/*
	File: restorePlayerPosition.sqf

	Description:
	Used to restore Players Position in the world

	Parameter(s):
  _this:	OBJECT	- Player Object that needs to be examined
          ARRAY - Player Position

	Returns: Nothing
*/

_player = _this select 0;
_posCoord = _this select 1;

_player setPosASL _posCoord;
