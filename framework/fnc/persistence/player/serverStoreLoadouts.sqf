/*
	File: getPlayerLoadouts.sqf

	Description:
  	For each player on the map store their position

	Parameter(s): None
	Returns: Nothing
*/

// For every player on the map, store their loadout
{
	// Make sure the player has been restored before saving inventory
	_playerUUID = getPlayerUID _x;
	_restoreStatus = _x getVariable "rrf_persistence_restored";

	if (_restoreStatus) then {
		_loadout = [_x] call ACE_common_fnc_getAllGear;
		// Call Function on Server by sending it the neccessary information
		[_playerUUID,_loadout] call rrf_fnc_persistence_player_serverStoreLoadout;
	};

	

} forEach allPlayers;