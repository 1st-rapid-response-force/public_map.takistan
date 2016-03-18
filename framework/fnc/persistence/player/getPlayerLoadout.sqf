/*
	File: getPlayerLoadout.sqf

	Description:
	Used to obtain players current loadout  of the player.

	Parameter(s):
  	_this:	OBJECT	- Player Object that needs to be examined

	Returns:
	_this: Array
        0 - Player UUID
        1 - Player Loadout

*/

_player = _this select 0;
_playerName = name _player;
_playerUUID = getPlayerUID _player;

_loadout = [_player] call ACE_common_fnc_getAllGear;

// Call Function on Server by sending it the neccessary information
[_playerUUID,_loadout] remoteExecCall ["rrf_fnc_persistence_player_serverStoreLoadout", 2];

if (debugEnabled == 1) then {
    hint format['%1 | %2',_playerUUID,_data];
};
