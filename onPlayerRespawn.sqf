[] spawn {
	waitUntil {!isNull player};

	sleep 25;
	//Gets ID used for remoteExec
	_ownerID = owner player;
	// Persistence Code - Calls to Server / Server Excutes Actual Functions to Player
	if (rrfFusion == 1) then {
		if (rrfPersistence == 1) then {
			// Should Clear all Stored Data with a fresh instance
	        // Save Loadout
	        _h = [player] call rrf_fnc_persistence_player_getPlayerLoadout;

	        // Save Position
	        _h = [player] call rrf_fnc_persistence_player_getPlayerPosition;

	        // Save Medical Status
	        //_h = [player] call rrf_fnc_persistence_medical_getPlayerMedical;

			sleep 5;

			_h = [player,_ownerID] spawn rrf_fnc_loops_criticalLoop;
			_h = [player,_ownerID] spawn rrf_fnc_loops_nonCriticalLoop;
		};
		_uuid = getPlayerUID player;
	};
};
