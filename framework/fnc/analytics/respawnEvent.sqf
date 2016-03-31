[] spawn {
	waitUntil {!isNull player};

	sleep 25;
	//Gets ID used for remoteExec
	_ownerID = owner player;
	// Persistence Code - Calls to Server / Server Excutes Actual Functions to Player
	if (rrfPersistence == 1) then {
		// Should Clear all Stored Data with a fresh instance
	        // Save Loadout
	        _h = [_player] call rrf_fnc_persistence_player_getPlayerLoadout;

	        // Save Position
	        _h = [_player] call rrf_fnc_persistence_player_getPlayerPosition;

	        // Save Medical Status
	        _h = [_player] call rrf_fnc_persistence_medical_getPlayerMedical;

			sleep 5;
			
			_h = [player,_ownerID] spawn rrf_fnc_loops_criticalLoop;
			_h = [player,_ownerID] spawn rrf_fnc_loops_nonCriticalLoop;
	};

	// Clear any event handlers and then readd them
	player removeAllEventHandlers "Respawn";
	player removeAllEventHandlers "Killed";

	_uuid = getPlayerUID player;

	// Initalize all Event Handlers
	player addMPEventHandler ["Respawn", format ["_null = [%1,%2] call rrf_fnc_analytics_respawnEvent", _uuid,_ownerID]];
	player addMPEventHandler ["Killed", format ["_null = [%1,%2] call rrf_fnc_analytics_deathEvent", _uuid,_ownerID]];

};
