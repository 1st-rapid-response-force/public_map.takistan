/*
	File: onPlayerKilled.sqf

	Description:
	Used to log player death

	Parameter(s):
  	_this:	OBJECT	- Player Object that needs to be examined

	Returns:
	_this: Array
        0 - Player UUID
        1 - Player Loadout

*/

_player = player;
_playerName = name _player;
_playerUUID = getPlayerUID _player;

hint format ["%1",_playerUUID];
// Call Function on Server by sending it the neccessary information
if (rrfFusion == 1) then {
	[_playerUUID] remoteExecCall ["rrf_fnc_analytics_deathEvent", 2];
};
if (debugEnabled == 1) then {
    hint format['%1 | %2',_playerUUID,_data];
};
