/*
	File: restorePlayerLoadout.sqf

	Description:
	Used to restore players loadout from database
	Parameter(s):
  	_this:	OBJECT	- Player Object that needs to be examined

	Returns:
	_this: Array
        0 - Player

*/
_player = _this select 0;
_playerName = name _player;
_loadoutArray = _this select 1;
_loadout = [player,_loadoutArray,true,true] call ACE_common_fnc_setAllGear;

