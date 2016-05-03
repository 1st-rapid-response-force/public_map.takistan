/*
	File: getPlayerPositions.sqf

	Description:
  	For each player on the map store their position

	Parameter(s): None
	Returns: Nothing
*/

// For every player on the map, store their position
{
	_playerUUID = getPlayerUID _x;
	_position = getPosASL _x;
	_restoreStatus = _x getVariable "rrf_persistence_restored";

	if (_restoreStatus) then {
	  	// Call Function on Server by sending it the neccessary information
		[_playerUUID,_position] call rrf_fnc_persistence_player_serverStorePosition;
	};
	

} forEach allPlayers;